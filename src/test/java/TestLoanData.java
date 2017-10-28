import com.example.jooq_dsl.tables.pojos.LoanData;
import org.jooq.impl.DSL;
import org.junit.Test;

import java.util.List;

import static com.example.jooq_dsl.Tables.LOAN_DATA;
import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.assertThat;

public class TestLoanData {

    @Test
    public void run() {

        List<LoanData> loanData = DSL.using(TestConfig.connection())
                .selectFrom(LOAN_DATA)
                .limit(10)
                .fetchInto(LoanData.class);
        assertThat(loanData.size(), greaterThan(9));
    }

}
