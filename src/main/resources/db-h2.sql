DROP TABLE IF EXISTS loan_data
;

create table loan_data
as
select


ListingKey::UUID as listing_key,
ListingNumber::INT as listing_number,
ListingCreationDate::timestamp as listing_creation_date,
CreditGrade::VARCHAR(2),
TERM::SMALLINT as term,
LoanStatus as Loan_Status,
(CASE WHEN ClosedDate <> '' THEN PARSEDATETIME (ClosedDate, 'yyyy-MM-dd hh:mm:ss') ELSE NULL END) as Closed_Date,
concat ('0', BorrowerAPR)::NUMERIC as Borrower_APR,
concat ('0', BorrowerRate)::NUMERIC as Borrower_Rate,

--TODO select and cast remaining fields
--concat ('0', LenderYield)::NUMERIC as Lender_Yield
--concat ('0', EstimatedEffectiveYield)::NUMERIC as Estimated_Effective_Yield,
--concat ('0', EstimatedLoss)::NUMERIC as Estimated_Loss
--concat ('0', EstimatedReturn)::NUMERIC as Estimated_Return
--"","","","","","ProsperRating (numeric)","ProsperRating (Alpha)"
--"","","","","","PublicRecordsLast10Years","PublicRecordsLast12Months","RevolvingCreditBalance","BankcardUtilization","AvailableBankcardCredit","TotalTrades","TradesNeverDelinquent (percentage)","TradesOpenedLast6Months","DebtToIncomeRatio","IncomeRange","IncomeVerifiable","StatedMonthlyIncome","LoanKey","TotalProsperLoans","TotalProsperPaymentsBilled","OnTimeProsperPayments","ProsperPaymentsLessThanOneMonthLate","ProsperPaymentsOneMonthPlusLate","ProsperPrincipalBorrowed","ProsperPrincipalOutstanding","ScorexChangeAtTimeOfListing","LoanCurrentDaysDelinquent","LoanFirstDefaultedCycleNumber","LoanMonthsSinceOrigination","LoanNumber","LoanOriginalAmount","LoanOriginationDate","LoanOriginationQuarter","MemberKey","MonthlyLoanPayment","LP_CustomerPayments","LP_CustomerPrincipalPayments","LP_InterestandFees","LP_ServiceFees","LP_CollectionFees","LP_GrossPrincipalLoss","LP_NetPrincipalLoss","LP_NonPrincipalRecoverypayments","PercentFunded","Recommendations","InvestmentFromFriendsCount","InvestmentFromFriendsAmount","Investors"

"ListingCategory (numeric)"::SMALLINT as Listing_Category,
ProsperScore as Prosper_Score,
BorrowerState as Borrower_State,
Occupation,
EmploymentStatus as employment_status,
(CASE WHEN EmploymentStatusDuration <> '' THEN EmploymentStatusDuration::INT ELSE NULL END) as employment_status_duration,
IsBorrowerHomeowner::BOOL as is_borrower_homeowner,
CurrentlyInGroup::BOOL as currently_in_group,
GroupKey as Group_Key,
(CASE WHEN DateCreditPulled <> '' THEN PARSEDATETIME (DateCreditPulled, 'yyyy-MM-dd hh:mm:ss') ELSE NULL END) as date_credit_pulled,
(CASE WHEN CreditScoreRangeLower <> '' THEN CreditScoreRangeLower::INT ELSE NULL END) as credit_score_range_lower,
(CASE WHEN CreditScoreRangeUpper <> '' THEN CreditScoreRangeUpper::INT ELSE NULL END) as credit_score_range_upper,
(CASE WHEN FirstRecordedCreditLine <> '' THEN PARSEDATETIME (FirstRecordedCreditLine, 'yyyy-MM-dd hh:mm:ss') ELSE NULL END) as First_Recorded_Credit_Line,
(CASE WHEN CurrentCreditLines <> '' THEN CurrentCreditLines::INT ELSE NULL END) as current_credit_lines,
(CASE WHEN OpenCreditLines <> '' THEN OpenCreditLines::INT ELSE NULL END) as open_credit_lines,
(CASE WHEN TotalCreditLinespast7years <> '' THEN TotalCreditLinespast7years::NUMERIC ELSE NULL END) as Total_Credit_Lines_past7years,
OpenRevolvingAccounts:: NUMERIC as open_revolving_accounts,
OpenRevolvingMonthlyPayment:: NUMERIC as open_revolving_monthly_payment,
InquiriesLast6Months as Inquiries_Last6Months,
TotalInquiries as Total_Inquiries,
CurrentDelinquencies as Current_Delinquencies,
AmountDelinquent as Amount_Delinquent,
DelinquenciesLast7Years as Delinquencies_Last7Years
from csvread('./csv/prosperLoanData.csv')
;

DROP SEQUENCE IF EXISTS s_loan_data
;
CREATE SEQUENCE s_loan_data START WITH 1
;

