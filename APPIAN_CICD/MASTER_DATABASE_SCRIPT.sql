

CREATE TABLE  IF NOT EXISTS AB_LMS_LEAVE  (
   LEAVE_ID  int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
   EMPLOYEE_NAME  varchar(255) DEFAULT NULL,
   START_DATE  date DEFAULT NULL,
   END_DATE  date DEFAULT NULL,
   REASON  varchar(2000) DEFAULT NULL,
   LEAVE_TYPE_ID  int(10) DEFAULT NULL,
   CREATED_DATE  datetime DEFAULT NULL,
   CREATED_BY  varchar(255) DEFAULT NULL,
   MODIFIED_DATE  datetime DEFAULT NULL,
   MODIFIED_BY  varchar(255) DEFAULT NULL,
   ACTIVE  tinyint(1) DEFAULT 1
);