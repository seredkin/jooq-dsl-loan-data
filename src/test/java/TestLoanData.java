import com.example.jooq_dsl.Tables;
import com.example.jooq_dsl.tables.pojos.Loan;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.junit.Test;

import java.util.List;

import static com.example.jooq_dsl.Tables.LOAN;
import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.assertThat;

public class TestLoanData {

    @Test
    public void run() throws ClassNotFoundException {
        final DSLContext dsl = DSL.using(TestConfig.connection());
        List<Loan> loanData = dsl
                .selectFrom(LOAN)
                .limit(10)
                .fetchInto(Loan.class);
        assertThat(loanData.size(), greaterThan(9));

        loanData.forEach(Object::toString);

        System.out.println("loanData.count = " + dsl.fetchCount(LOAN));


    }

}
