import com.example.jooq_dsl.tables.pojos.Loan;
import com.example.jooq_dsl.tables.records.LoanRecord;
import org.jooq.DSLContext;
import org.jooq.Loader;
import org.jooq.impl.DSL;
import org.junit.Ignore;
import org.junit.Test;
import org.postgresql.copy.CopyManager;
import org.postgresql.core.BaseConnection;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import static com.example.jooq_dsl.Tables.LOAN;
import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

public class DataLoaderTest {

    @Test
    public void run() throws ClassNotFoundException, IOException {
        final DSLContext dsl = DSL.using(JooqConfig.connection());

        dsl.truncate(LOAN).execute();
        if(dsl.fetchCount(LOAN)==0) {
            System.out.println("Populating table");
            File file = new File(JooqConfig.fileName());
            assertTrue(file.exists());
            Loader<LoanRecord> loader = dsl.loadInto(LOAN)
                    .loadCSV(file)
                    .fields(LOAN.fields())
                    .execute();
            System.out.println("Populated rows: "+loader.stored());
        }
        List<Loan> loanData = dsl
                .selectFrom(LOAN)
                .limit(10)
                .fetchInto(Loan.class);
        assertThat(loanData.size(), greaterThan(9));

        loanData.forEach(Object::toString);//ensuring read of pojo properties

        System.out.println("loanData.count = " + dsl.fetchCount(LOAN));


    }

    @Ignore //TODO Anton deal with amount of columns
    public void pgCopy() throws Exception {
        BaseConnection connection = (BaseConnection) JooqConfig.connection();
        DSL.using(connection).truncate(LOAN).execute();
        BufferedReader fileReader = new BufferedReader(new FileReader(new File("./csv/loan.csv")));
        System.out.println("HEADER = " + fileReader.readLine());
        CopyManager copyManager = new CopyManager(connection);

        copyManager.copyIn("COPY LOAN FROM STDIN DELIMITER ',' NULL AS ''", fileReader);
        System.out.println("Done copying");
    }

}
