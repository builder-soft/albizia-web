/**
ALTER TABLE tR_RolOption ADD PRIMARY KEY(cRol, cOption);
ALTER TABLE tR_UserRol ADD PRIMARY KEY(cUser,cRol);
*/

/** L L A V E S   F O R A N E A S **/

/** EMPLOYEE */
ALTER TABLE tEmployee
ADD INDEX Employee_index_MaritalStatus (cMaritalStatus ASC),
ADD INDEX Employee_index_Country (cCountry ASC),
ADD INDEX Employee_index_Genere (cGenere ASC),
ADD INDEX comuna_index (cComuna ASC),
ADD CONSTRAINT withMaritalStatus FOREIGN KEY (cMaritalStatus) REFERENCES tMaritalStatus(cId),
ADD CONSTRAINT withCountry       FOREIGN KEY (cCountry) REFERENCES tCountry(cId),
ADD CONSTRAINT EmployeeToGenere FOREIGN KEY (cGenere) REFERENCES tGenere(cId),
ADD CONSTRAINT employeeToComuna FOREIGN KEY (cComuna) REFERENCES tComuna(cId);

/** AGREEMENT */
ALTER TABLE tAgreement
ADD INDEX Employee_index (cEmployee ASC),
ADD CONSTRAINT AgreementToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId),
ADD INDEX contractType_index (cContractType ASC),
ADD CONSTRAINT AgreementToContractType FOREIGN KEY (cContractType) REFERENCES tContractType(cId),
ADD INDEX profile_index (cProfile ASC),
ADD CONSTRAINT EmployeeToProfile FOREIGN KEY (cProfile) REFERENCES tProfile(cId),
ADD INDEX pfm_index (cPFM ASC),
ADD CONSTRAINT AgreementToPFM FOREIGN KEY (cPFM) REFERENCES tPFM(cId),
ADD INDEX Health_index (cHealth ASC),
ADD CONSTRAINT AgreementToHealth FOREIGN KEY (cHealth) REFERENCES tHealth(cId),
ADD INDEX gratificationType_index (cGratificationType ASC),
ADD CONSTRAINT AgreementToGratificationType FOREIGN KEY (cGratificationType) REFERENCES tGratificationType(cId),
ADD INDEX Agreement_index_PaymentType (cPaymentType ASC),
ADD CONSTRAINT AgreementToPaymentType FOREIGN KEY (cPaymentType) REFERENCES tPaymentType(cId),
ADD INDEX Horary_index (cHorary ASC),
ADD CONSTRAINT AgreementToHorary FOREIGN KEY (cHorary) REFERENCES tHorary(cId),
ADD INDEX Bank_index (cBank ASC),
ADD CONSTRAINT AgreementToBank FOREIGN KEY (cBank) REFERENCES tBank(cId),
ADD INDEX AccountType_index (cAccountType ASC),
ADD CONSTRAINT AgreementToAccountType FOREIGN KEY (cAccountType) REFERENCES tAccountType(cId),
ADD INDEX ExBoxSystem_index (cExBoxSystem ASC),
ADD CONSTRAINT AgreementToExBoxSystem FOREIGN KEY (cExBoxSystem) REFERENCES tExBoxSystem(cId),
ADD INDEX CurrencyAct2_index (cCurrencyAccount2 ASC),
ADD CONSTRAINT CurrencyAccount2ToCurrency FOREIGN KEY (cCurrencyAccount2) REFERENCES tCurrency(cId),
ADD INDEX Currency_index (cCurrencyAccount2 ASC),
ADD CONSTRAINT AgrementToCurrency FOREIGN KEY (cCurrencyAccount2) REFERENCES tCurrency(cId),
ADD INDEX HealthCurrency_index (cHealthCurrency ASC),
ADD CONSTRAINT HealthCurrencyToCurrency FOREIGN KEY (cHealthCurrency) REFERENCES tCurrency(cId),
ADD INDEX Agreement_index_FamilyAssignmentStretch (cFamilyAssignmentStretch ASC),
ADD CONSTRAINT AgreementToFamilyAssignmentStretch FOREIGN KEY (cFamilyAssignmentStretch) REFERENCES tFamilyAssignmentStretch(cId);

/** AGREEMENT-APV */
ALTER TABLE tR_AgreementAPV
ADD INDEX index_agreement (cAgreement ASC),
ADD INDEX index_apv (cAPV ASC),
ADD INDEX Currency_index (cCurrency ASC),
ADD CONSTRAINT r_AgreementAPVToAgreement FOREIGN KEY (cAgreement) REFERENCES tAgreement(cId),
ADD CONSTRAINT r_AgreementAPVToAPV FOREIGN KEY (cAPV) REFERENCES tAPV(cId),
ADD CONSTRAINT r_AgreementAPVToCurrency FOREIGN KEY (cCurrency) REFERENCES tCurrency(cId);

/** ENTERPRISE */
ALTER TABLE tEnterprise
ADD INDEX comuna_index (cComuna ASC),
ADD CONSTRAINT withComuna FOREIGN KEY (cComuna) REFERENCES tComuna(cId),
ADD INDEX Mutual_index (cMutual ASC),
ADD CONSTRAINT EnterpriseToMutual FOREIGN KEY (cMutual) REFERENCES tMutual(cId),
ADD INDEX CompensationFund_index (cCompensationFund ASC),
ADD CONSTRAINT EnterpriseToCompensationFund FOREIGN KEY (cCompensationFund) REFERENCES tCompensationFund(cId);


/** BRANCH */
ALTER TABLE tBranch
ADD INDEX enterprise_index (cEnterprise ASC),
ADD INDEX comuna_index (cComuna ASC),
ADD CONSTRAINT BranchToEnterprise FOREIGN KEY (cEnterprise) REFERENCES tEnterprise(cId),
ADD CONSTRAINT BranchToComuna FOREIGN KEY (cComuna) REFERENCES tComuna(cId);

/** PARAMETER 
ALTER TABLE tParameter
ADD INDEX Parameter_index (cDataType ASC),
ADD CONSTRAINT ParameterToDataType FOREIGN KEY (cDataType) REFERENCES tDataType(cId);
*/

/** COST CENTER */
ALTER TABLE tCostCenter
ADD INDEX branch_index_costCenter (cBranch ASC),
ADD INDEX tCostCenter_cBusinessArea(cBusinessArea ASC),
ADD CONSTRAINT CostCenter_To_BusinessArea FOREIGN KEY (cBusinessArea) REFERENCES tBusinessArea(cId),
ADD CONSTRAINT CostCenterToBranch FOREIGN KEY (cBranch) REFERENCES tBranch(cId);


/** PROFILE */
ALTER TABLE tProfile
ADD INDEX costCenter_index (cCostCenter ASC),
ADD CONSTRAINT withCostCenter FOREIGN KEY (cCostCenter) REFERENCES tCostCenter(cId);

/** ROL-OPTION 
ALTER TABLE tR_RolOption
ADD INDEX index_rol (cRol ASC),
ADD INDEX index_option (cOption ASC),
ADD CONSTRAINT RolOption_To_Rol FOREIGN KEY (cRol) REFERENCES tRol(cId),
ADD CONSTRAINT RolOption_To_Option FOREIGN KEY (cOption) REFERENCES tOption(cId);
*/

/** USER-ROL 
ALTER TABLE tR_UserRol
ADD INDEX index_rol (cRol ASC),
ADD INDEX index_user (cUser ASC),
ADD CONSTRAINT r_UserRolToRol FOREIGN KEY (cRol) REFERENCES tRol(cId);,
ADD CONSTRAINT r_RolOptionToOption FOREIGN KEY (cOption) REFERENCES tOption(cId);
*/

/* PFM History */
ALTER TABLE tPFMHistory
ADD INDEX PFMHistory_index_Period (cPeriod ASC),
ADD CONSTRAINT PFMHistoryToPeriod FOREIGN KEY (cPeriod) REFERENCES tPeriod(cId);

/* tHealthHistory */
ALTER TABLE tHealthHistory
ADD INDEX HealthHistory_index_Period (cPeriod ASC),
ADD CONSTRAINT HealthHistoryToPeriod FOREIGN KEY (cPeriod) REFERENCES tPeriod(cId);

/* Period */   
ALTER TABLE tPeriod
ADD INDEX Period_index_PeriodStatus (cPeriodStatus ASC),
ADD CONSTRAINT PeriodStatusToPeriod FOREIGN KEY (cPeriodStatus) REFERENCES tPeriodStatus(cId);

/* FILE */
ALTER TABLE tFile
ADD INDEX File_index_FileCategory (cFileCategory ASC),
ADD INDEX File_index_Employee (cEmployee ASC),
ADD CONSTRAINT FileToFileCategory FOREIGN KEY (cFileCategory) REFERENCES tFileCategory(cId),
ADD CONSTRAINT FileToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId);

/* BOOK */
ALTER TABLE tBook
ADD INDEX Book_index_Period (cPeriod ASC),
ADD CONSTRAINT BookToPeriod FOREIGN KEY (cPeriod) REFERENCES tPeriod(cId),
ADD INDEX Book_index_Employee (cEmployee ASC),
ADD CONSTRAINT BookToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId),
ADD INDEX Book_index_Horary (cHorary ASC),
ADD CONSTRAINT BookToHorary FOREIGN KEY (cHorary) REFERENCES tHorary(cId),
ADD INDEX BookDiscounts_index_ContractType (cContractType ASC),
ADD CONSTRAINT BookDiscountsToContractType FOREIGN KEY (cContractType) REFERENCES tContractType(cId);

/* tBookAssets */
ALTER TABLE tBookAssets
ADD INDEX BookAssets_index_Book (cBook ASC),
ADD CONSTRAINT tBookAssetsToBook FOREIGN KEY (cBook) REFERENCES tBook(cId),
ADD INDEX GratificationType_index_Book (cGratificationType ASC),
ADD CONSTRAINT BookAssetsToGratificationType FOREIGN KEY (cGratificationType) REFERENCES tGratificationType(cId);

/* tBookDiscounts */
ALTER TABLE tBookDiscounts
ADD INDEX tBookDiscounts_index_Book (cBook ASC),
ADD INDEX BookDiscounts_index_PFM (cPFMHistory ASC),
ADD INDEX BookDiscounts_index_HealthHistory (cHealthHistory ASC),
ADD INDEX BookDiscounts_index_cHealthCurrency (cHealthCurrency ASC),
ADD INDEX BookDiscounts_index_cAdditionalPFMCurrency (cAdditionalPFMCurrency ASC),
ADD CONSTRAINT tBookDiscountsToBook FOREIGN KEY (cBook) REFERENCES tBook(cId),
ADD CONSTRAINT tBookDiscountsToPFMHistory FOREIGN KEY (cPFMHistory) REFERENCES tPFMHistory(cId),
ADD CONSTRAINT tBookDiscountsToHealthHistory FOREIGN KEY (cHealthHistory) REFERENCES tHealthHistory(cId),
ADD CONSTRAINT BookDiscountsToCurrency FOREIGN KEY (cHealthCurrency) REFERENCES tCurrency(cId),
ADD CONSTRAINT BookDiscountsToCurrency2 FOREIGN KEY (cAdditionalPFMCurrency) REFERENCES tCurrency(cId);

/* tOvertime */
ALTER TABLE tOvertime
ADD INDEX Overtime_index_Employee (cEmployee ASC),
ADD INDEX Overtime_index_Period (cPeriod ASC),
ADD CONSTRAINT OvertimeToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId),
ADD CONSTRAINT OvertimeToPeriod FOREIGN KEY (cPeriod) REFERENCES tPeriod(cId);

/* tLicense 
ALTER TABLE tLicense
ADD INDEX License_index_LicenseCause (cLicenseCause ASC),
ADD INDEX License_index_Employee (cEmployee ASC),
ADD INDEX License_index_Period (cPeriod ASC),
ADD INDEX License_index_File (cFile ASC),
ADD CONSTRAINT LicenseToLicenseCause FOREIGN KEY (cLicenseCause) REFERENCES tLicenseCause(cId),
ADD CONSTRAINT LicenseToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId),
ADD CONSTRAINT LicenseToPeriod FOREIGN KEY (cPeriod) REFERENCES tPeriod(cId),
ADD CONSTRAINT LicenseToFile FOREIGN KEY (cFile) REFERENCES tFile(cId);

ALTER TABLE tLicenseCause
ADD INDEX LicenseCause_index_FileCategory (cFileCategory ASC),
ADD CONSTRAINT LicenseCauseToLicenseCause FOREIGN KEY (cFileCategory) REFERENCES tFileCategory(cId);
*/

/*tEnterpriseConfig*/
ALTER TABLE tEnterpriseConfig
ADD INDEX fk_tEnterpriseConfig_tenterprise (cEnterprise ASC),
ADD CONSTRAINT tEnterpriseConfigToEnterprise FOREIGN KEY (cEnterprise) REFERENCES tEnterprise(cId);

/*tAssetDiscount*/
ALTER TABLE tAssetDiscount
ADD INDEX AssetDiscount_index_AssetDiscountType (cAssetDiscountType ASC),
ADD CONSTRAINT tAssetDiscountToAssetDiscountType FOREIGN KEY (cAssetDiscountType) REFERENCES tAssetDiscountType(cId);

/*tAssetDiscountValue*/
ALTER TABLE tAssetDiscountValue
ADD INDEX AssetDiscountValue_index_AssetDiscount (cAssetDiscount ASC),
ADD INDEX AssetDiscountValue_index_Book (cBook ASC),
ADD CONSTRAINT tAssetDiscountValueToAssetDiscount FOREIGN KEY (cAssetDiscount) REFERENCES tAssetDiscount(cId),
ADD CONSTRAINT tAssetDiscountValueToBook FOREIGN KEY (cBook) REFERENCES tBook(cId);

/*tProgressive*/
ALTER TABLE tProgressive
ADD INDEX Progressive_index_Employee (cEmployee ASC),
ADD CONSTRAINT tProgressiveToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId);

/*tHoliday*/
ALTER TABLE tHoliday
ADD INDEX Holiday_index_Employee (cEmployee ASC),
ADD CONSTRAINT tHolidayToEmployee FOREIGN KEY (cEmployee) REFERENCES tEmployee(cId);

/*tHolidayDetail*/
ALTER TABLE tHolidayDetail
ADD INDEX HolidayDetail_index_Holiday (cHoliday ASC),
ADD INDEX HolidayDetail_index_HolidayType (cHolidayDetailType ASC),
ADD CONSTRAINT tHolidayDetailToHoliday FOREIGN KEY (cHoliday) REFERENCES tHoliday(cId),
ADD CONSTRAINT tHolidayDetailToHolidayDetailType FOREIGN KEY (cHolidayDetailType) REFERENCES tHolidayDetailType(cId);


/* TRIGERS */
DROP TRIGGER IF EXISTS create_record;
DROP TRIGGER IF EXISTS InsertOnEnterprise;
DROP TRIGGER IF EXISTS InsertOnPFM;
DROP TRIGGER IF EXISTS UpdateOnPFM;
DROP TRIGGER IF EXISTS InsertOnHealth;
DROP TRIGGER IF EXISTS UpdateOnHealth;
DROP TRIGGER IF EXISTS DeleteOnAgreementAPV;
DROP TRIGGER IF EXISTS InsertOnAgreementAPV;
DROP TRIGGER IF EXISTS InsertOnPeriod;
DROP TRIGGER IF EXISTS UpdateOnPeriod;
 
DELIMITER $$

/* tEnterprise */
CREATE TRIGGER InsertOnEnterprise AFTER INSERT ON tEnterprise
FOR EACH ROW
BEGIN
	INSERT INTO tEnterpriseConfig (cEnterprise, cTextFootSalary) 
	VALUES (NEW.cId, '');
END$$

/* tPFM */
CREATE TRIGGER InsertOnPFM AFTER INSERT ON tPFM
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
 
	INSERT INTO tPFMHistory (cPeriod, cKey, cName, cFactor, cSIS) 
	VALUES (vPeriod, NEW.cKey, NEW.cName, NEW.cFactor, NEW.cSIS);
END$$

CREATE TRIGGER UpdateOnPFM AFTER UPDATE ON tPFM
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
 
	INSERT INTO tPFMHistory (cPeriod, cKey, cName, cFactor, cSIS) 
	VALUES (vPeriod, NEW.cKey, NEW.cName, NEW.cFactor, NEW.cSIS);
END$$

/* tHealth */
CREATE TRIGGER InsertOnHealth AFTER INSERT ON tHealth
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
 
	INSERT INTO tHealthHistory (cPeriod, cKey, cName, cFactor) 
	VALUES (vPeriod, NEW.cKey, NEW.cName, NEW.cFactor);
END$$

CREATE TRIGGER UpdateOnHealth AFTER UPDATE ON tHealth
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
 
	INSERT INTO tHealthHistory (cPeriod, cKey, cName, cFactor) 
	VALUES (vPeriod, NEW.cKey, NEW.cName, NEW.cFactor);
END$$

/* tR_AgreementAPV */
CREATE TRIGGER DeleteOnAgreementAPV AFTER DELETE ON tR_AgreementAPV
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
	
	DELETE
	FROM	tR_AgreementAPVHistory
	WHERE	cPeriod=vPeriod AND 
			cAgreement=OLD.cAgreement AND
			cAPV=OLD.cAPV AND
			cCurrency=OLD.cCurrency;
END$$

CREATE TRIGGER InsertOnAgreementAPV AFTER INSERT ON tR_AgreementAPV
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
			
	INSERT INTO tR_AgreementAPVHistory (cPeriod, cAgreement, cAPV, cCurrency, cAmount) 
	VALUES (vPeriod, NEW.cAgreement, NEW.cAPV, NEW.cCurrency, NEW.cAmount);
END$$

/* tFamilyAssignmentStretchHistory */
CREATE TRIGGER InsertOnFamilyAssignmentStretch AFTER INSERT ON tFamilyAssignmentStretch
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
 
	INSERT INTO tFamilyAssignmentStretchHistory (cPeriod, cKey, cAmount) 
	VALUES (vPeriod, NEW.cKey, NEW.cAmount);
END$$

CREATE TRIGGER UpdateOnFamilyAssignmentStretch AFTER UPDATE ON tFamilyAssignmentStretch
FOR EACH ROW
BEGIN
	DECLARE vPeriod BIGINT DEFAULT 0;
	SET vPeriod = fGetOpenedPeriod();
 
	INSERT INTO tHealthFamilyAssignmentStretchHistory (cPeriod, cKey, cAmount) 
	VALUES (vPeriod, NEW.cKey, NEW.cAmount);
END$$

/* tPeriod */
CREATE TRIGGER InsertOnPeriod AFTER INSERT ON tPeriod
FOR EACH ROW
BEGIN
	DECLARE vPeriodCount INTEGER DEFAULT 0;
	DECLARE vLastPeriod, vMax BIGINT DEFAULT 0;
	
	SET vPeriodCount = (SELECT COUNT(cId) FROM tPeriod);
	
	IF(vPeriodCount = 1) THEN
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '1', 13.5,	0.00,	0);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '2', 0030,	0.05,	0.675);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '3', 0050,	0.10,	2.175);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '4', 0070,	0.15,	4.675);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '5', 0090,	0.25,	11.675);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '6', 0120,	0.32,	17.975);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '7', 0150,	0.37,	23.975);
		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount) VALUES(NEW.cId, '8', 9999,	0.40,	28.475);
	ELSE
		SET vLastPeriod = (SELECT cId FROM tPeriod WHERE cId != NEW.cId ORDER BY cId DESC LIMIT 0,1);

		INSERT INTO tUniqueTax(cPeriod, cKey, cLimit, cFactor, cDiscount)

		SELECT	NEW.cId, cKey, cLimit, cFactor, cDiscount 
		FROM	tUniqueTax 
		WHERE	cPeriod = vLastPeriod;
			
	END IF;
END$$


CREATE TRIGGER UpdateOnPeriod AFTER UPDATE ON tPeriod
FOR EACH ROW
BEGIN
	IF(NEW.cPeriodStatus = 2 AND OLD.cPeriodStatus = 1) THEN
		INSERT INTO tR_AgreementAPVHistory(cPeriod, cAgreement, cAPV, cCurrency, cAmount)
		SELECT NEW.cId, cAgreement, cAPV, cCurrency, cAmount FROM tR_AgreementAPV;
	END IF;
END$$

DELIMITER ;