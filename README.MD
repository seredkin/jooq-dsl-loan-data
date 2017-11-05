# JOOQ DSL for Loan Club data

## TODO

Add field-level updates for Immutables using https://github.com/SQiShER/java-object-diff/

You will need Postgres system account to use import script, otherwise you can comment out lines
'''sql
copy loan FROM 'C:\tmp\loan.csv' DELIMITER ',' HEADER CSV;

CREATE INDEX idx_loan_id ON loan (
	id
);
'''
in the ./src/main/resources/db-pg.sql file and import the data manually using console or UI tool.

How to build:

1. Specify postgres account and application account credentials in config.properties.
    Create empty database if necessary.

2 .Download Lending Club dataset from Kaggle and unpack loan.csv file into a Git-ignored folder (ignored by git) accessible by psql.
Specify the path to file in src/main/resources/db-pg.sql

```sql
copy loan FROM '/tmp/loan.csv' DELIMITER ',' HEADER CSV;
```


https://www.kaggle.com/wendykan/lending-club-loan-data

then run mvn install and check console output