DROP TABLE IF EXISTS LOAN;

CREATE TABLE "loan" (
	"id"	BIGINT,
	"member_id"	NUMERIC,
	"loan_amnt"	NUMERIC,
	"funded_amnt"	NUMERIC,
	"funded_amnt_inv"	NUMERIC,
	"term"	TEXT,
	"int_rate"	TEXT,
	"installment"	NUMERIC,
	"grade"	TEXT,
	"sub_grade"	TEXT,
	"emp_title"	TEXT,
	"emp_length"	TEXT,
	"home_ownership"	TEXT,
	"annual_inc"	NUMERIC,
	"verification_status"	TEXT,
	"issue_d"	TEXT,
	"loan_status"	TEXT,
	"pymnt_plan"	TEXT,
	"url"	TEXT,
	"desc"	TEXT,
	"purpose"	TEXT,
	"title"	TEXT,
	"zip_code"	TEXT,
	"addr_state"	TEXT,
	"dti"	NUMERIC,
	"delinq_2yrs"	NUMERIC,
	"earliest_cr_line"	TEXT,
	"inq_last_6mths"	NUMERIC,
	"mths_since_last_delinq"	NUMERIC,
	"mths_since_last_record"	NUMERIC,
	"open_acc"	NUMERIC,
	"pub_rec"	NUMERIC,
	"revol_bal"	NUMERIC,
	"revol_util"	TEXT,
	"total_acc"	NUMERIC,
	"initial_list_status"	TEXT,
	"out_prncp"	NUMERIC,
	"out_prncp_inv"	NUMERIC,
	"total_pymnt"	NUMERIC,
	"total_pymnt_inv"	NUMERIC,
	"total_rec_prncp"	NUMERIC,
	"total_rec_int"	NUMERIC,
	"total_rec_late_fee"	NUMERIC,
	"recoveries"	NUMERIC,
	"collection_recovery_fee"	NUMERIC,
	"last_pymnt_d"	TEXT,
	"last_pymnt_amnt"	NUMERIC,
	"next_pymnt_d"	TEXT,
	"last_credit_pull_d"	TEXT,
	"collections_12_mths_ex_med"	NUMERIC,
	"mths_since_last_major_derog"	NUMERIC,
	"policy_code"	NUMERIC,
	"application_type"	TEXT,
	"annual_inc_joint"	NUMERIC,
	"dti_joint"	NUMERIC,
	"verification_status_joint"	TEXT,
	"acc_now_delinq"	NUMERIC,
	"tot_coll_amt"	NUMERIC,
	"tot_cur_bal"	NUMERIC,
	"open_acc_6m"	NUMERIC,
	"open_il_6m"	NUMERIC,
	"open_il_12m"	NUMERIC,
	"open_il_24m"	NUMERIC,
	"mths_since_rcnt_il"	NUMERIC,
	"total_bal_il"	NUMERIC,
	"il_util"	NUMERIC,
	"open_rv_12m"	NUMERIC,
	"open_rv_24m"	NUMERIC,
	"max_bal_bc"	NUMERIC,
	"all_util"	NUMERIC,
	"total_rev_hi_lim"	NUMERIC,
	"inq_fi"	NUMERIC,
	"total_cu_tl"	NUMERIC,
	"inq_last_12m"	NUMERIC
);

copy loan FROM '/tmp/loan.csv' DELIMITER ',' HEADER CSV;

CREATE INDEX idx_loan_id ON loan (
	id
);

alter table loan owner to loan_data;



