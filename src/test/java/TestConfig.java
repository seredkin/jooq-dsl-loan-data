import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;


class TestConfig {

    private static Properties properties;
    private static Connection connection;

    static Connection connection() {
        if (connection == null) {
            try {
                Class.forName(properties().getProperty("db.driver"));

                connection = DriverManager.getConnection(
                        properties().getProperty("db.url"),
                        properties().getProperty("db.appname"),
                        properties().getProperty("db.apppassword"));
                connection.setAutoCommit(false);
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return connection;
    }

    private static Properties properties(){
        if (properties == null) {
            try {
                properties = new Properties();
                properties.load(TestConfig.class.getResourceAsStream("/config.properties"));
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return properties;
    }
}