# JOOQ DSL for Loan Club data

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

2 .Download Lending Club dataset from Kaggle and unpack loan.csv file  into csv folder (ignored by git)

https://www.kaggle.com/wendykan/lending-club-loan-data

then run mvn install and check console output