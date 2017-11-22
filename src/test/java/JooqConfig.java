import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;


class JooqConfig {

    private static Properties properties;
    private static Connection connection;

    static Connection connection() {
        if (connection == null) {
            try {
                Class.forName(properties().getProperty("db.driver"));

                connection = DriverManager.getConnection(
                        properties().getProperty("db.url"),
                        properties().getProperty("db.username"),
                        properties().getProperty("db.password"));
                connection.setAutoCommit(false);
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return connection;
    }

    static String fileName(){
        return properties().getProperty("import.file");
    }

    private static Properties properties(){
        if (properties == null) {
            try {
                properties = new Properties();
                properties.load(JooqConfig.class.getResourceAsStream("jooq-build-dsl.properties"));
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return properties;
    }
}