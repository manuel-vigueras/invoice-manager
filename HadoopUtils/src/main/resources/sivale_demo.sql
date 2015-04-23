create database if not exist 'sivale_demo';

use sivale_demo;

CREATE TABLE INVOICE (
RFC_ISSUER STRING,
RFC_RECEIVER STRING,
AMOUNT FLOAT,
UUID STRING,
F_CONCILIATION BOOLEAN
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
COMMENT 'INVOICE INFO FROM QR CODE/EMAIL';

CREATE TABLE TRX (
CARD STRING,
ACCOUNT STRING,
TRX_DATE STRING,
TRX_HOUR STRING,
AMOUNT FLOAT,
F STRING,
BALANCE FLOAT,
TRADE STRING,
TRX_ID BIGINT,
R STRING,
RR STRING,
TRX_AUT DOUBLE,
TRADE_INFO STRING,
MS INT,
REF STRING,
S INT,
F_CONCILIATION BOOLEAN
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
COMMENT 'TRANSACTIONS FROM CLIENT';

CREATE TABLE BDU (
BANK STRING,
AFFILIATION STRING,
CAD_CVE INT,
NAME_CAD STRING,
CAD_GRP DOUBLE,
NAME_GRP_CAD STRING,
CRIT_ENC INT,
DESC_CRITENC STRING,
CVE_BLOCK INT,
CATEGORY INT,
CAT_DEB INT,
TYPE_DEB STRING,
NAME STRING,
OWNER STRING,
CORPORATE_NAME STRING,
EMAIL STRING,
RFC STRING,
ADDRESS STRING,
SUBURB STRING,
CP DOUBLE,
LADA1 DOUBLE,
PHONE1 DOUBLE,
LADA2 DOUBLE,
PHONE2 DOUBLE,
SIC DOUBLE,
DESC_SIC STRING,
POB INT,
DESC_POB STRING,
STATE INT,
STATE_NAME STRING,
AFIL_ANT DOUBLE,
REC_CVE INT,
COM_ACTIVE STRING,
DATE_INSERT STRING,
DATE_LASTMOD STRING,
USR_LASTMOD STRING,
AFIL_AMEX STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

CREATE TABLE CONCILIATIONS (
UUID STRING,
TRX_AUT DOUBLE,
AMOUNT FLOAT,
RFC_ISSUER STRING,
RFC_RECEIVER STRING,
CARD STRING,
DATE STRING,
HOUR STRING
)
COMMENT 'RELATIONS BETWEEN TRX AND INVOICES';

#Nota: crear tablas temporales/externas para cargar desde archivos CSV

load data inpath 'hdfs://sandbox.hortonworks.com:8020/apps/hive/warehouse/sivale_demo.db/trxtmp/tx.csv' into table trxtmp;

load data inpath 'hdfs://sandbox.hortonworks.com:8020/apps/hive/warehouse/sivale_demo.db/bdutmp/bdu.csv' into table bdutmp;

load data inpath 'hdfs://sandbox.hortonworks.com:8020/apps/hive/warehouse/sivale_demo.db/invoicetmp/invoice.csv' into table invoicetmp;