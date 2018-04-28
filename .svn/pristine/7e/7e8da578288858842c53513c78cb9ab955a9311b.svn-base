
CREATE TABLE U_MESSAGE (
	ID INTEGER NOT NULL ,
	TITLE NVARCHAR2(100) NULL ,
	RELEASE_TIME DATE NULL ,
	RELEASE_USER_ID NUMBER NULL ,
	RELEASE_USER_NAME NVARCHAR2(45) NULL ,
	CONTENT NVARCHAR2(1000) NULL ,
	MSG_TYPE NVARCHAR2(2) NULL ,
	STATUS NVARCHAR2(2) NULL ,
	CREATED_TIME DATE NULL ,
	CREATED_USER_ID NUMBER NULL ,
	CREATED_USER_NAME NVARCHAR2(45) NULL ,
	UPDATED_TIME DATE NULL ,
	UPDATED_USER_ID NUMBER NULL ,
	UPDATED_USER_NAME NVARCHAR2(45) NULL 
);

-- ----------------------------
-- Table structure for U_MESSAGE_NOTIFY_USER
-- ----------------------------
CREATE TABLE U_MESSAGE_NOTIFY_USER (
	ID INTEGER NOT NULL ,
	MESSAGE_ID NUMBER NULL ,
	MESSAGE_READ_ID NUMBER NULL ,
	USER_ID NUMBER NULL ,
	NOTIFY_TIME DATE NULL ,
	CREATED_TIME DATE NULL ,
	CREATED_USER_ID NUMBER NULL ,
	CREATED_USER_NAME NVARCHAR2(45) NULL 
);

-- ----------------------------
-- Table structure for U_MESSAGE_READ
-- ----------------------------
CREATE TABLE U_MESSAGE_READ (
	ID INTEGER NOT NULL ,
	USER_ID NUMBER NULL ,
	MESSAGE_ID NUMBER NULL ,
	MSG_TYPE NVARCHAR2(2) NULL ,
	STATUS NVARCHAR2(2) NULL ,
	CREATED_TIME DATE NULL ,
	CREATED_USER_ID NUMBER NULL ,
	CREATED_USER_NAME NVARCHAR2(45) NULL 
)
;

-- ----------------------------
-- Indexes structure for table U_MESSAGE
-- ----------------------------

-- ----------------------------
-- Checks structure for table U_MESSAGE
-- ----------------------------
ALTER TABLE U_MESSAGE ADD CHECK (ID IS NOT NULL);
ALTER TABLE U_MESSAGE ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table U_MESSAGE
-- ----------------------------
ALTER TABLE U_MESSAGE ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table U_MESSAGE_NOTIFY_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table U_MESSAGE_NOTIFY_USER
-- ----------------------------
ALTER TABLE U_MESSAGE_NOTIFY_USER ADD CHECK (ID IS NOT NULL);
ALTER TABLE U_MESSAGE_NOTIFY_USER ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table U_MESSAGE_NOTIFY_USER
-- ----------------------------
ALTER TABLE U_MESSAGE_NOTIFY_USER ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table U_MESSAGE_READ
-- ----------------------------

-- ----------------------------
-- Checks structure for table U_MESSAGE_READ
-- ----------------------------
ALTER TABLE U_MESSAGE_READ ADD CHECK (ID IS NOT NULL);
ALTER TABLE U_MESSAGE_READ ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table U_MESSAGE_READ
-- ----------------------------
ALTER TABLE U_MESSAGE_READ ADD PRIMARY KEY (ID);

-- ----------------------------
-- Foreign Key structure for table U_MESSAGE_READ
-- ----------------------------
ALTER TABLE U_MESSAGE_READ ADD FOREIGN KEY (MESSAGE_ID) REFERENCES U_MESSAGE (ID);
ALTER TABLE U_MESSAGE_READ ADD FOREIGN KEY (USER_ID) REFERENCES U_USER (ID);

