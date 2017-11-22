# JOOQ DSL for Loan Club data


How to build:

1. Specify database credentials in src/main/resources/jooq-build-dsl.properties.
    Create empty database with application user as owner if necessary.

2 .Download Lending Club dataset from Kaggle and unpack loan.csv file into a Git-ignored folder csv (ignored by git) accessible by psql.
```
https://www.kaggle.com/wendykan/lending-club-loan-data
```

then run mvn install and check console output