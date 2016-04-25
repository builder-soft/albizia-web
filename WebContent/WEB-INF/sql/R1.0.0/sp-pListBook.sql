DROP FUNCTION IF EXISTS fGetAliasField;
DROP PROCEDURE IF EXISTS pListBook;

DELIMITER $$

CREATE FUNCTION fGetAliasField(vIndex INTEGER, vType CHAR(3)) RETURNS VARCHAR(50) 
BEGIN
	DECLARE	vName VARCHAR(50) DEFAULT '';
	DECLARE vPre CHAR(1);
	DECLARE vNum CHAR(2);
	
	SELECT		a.cName
	INTO		vName
	FROM		tAssetDiscount AS a
	LEFT JOIN	tAssetDiscountType AS b ON a.cAssetDiscountType = b.cId
	WHERE		a.cEnable = true AND a.cIndex = vIndex AND b.cKey = vType;
	
/*	IF(vName != '') THEN
		SET vName = CONCAT('a.cB01, '); 
	END IF;
	
	RETURN CONCAT(' AS \'', vName, '\', ')	;
	IF(vName IS NULL ) THEN
		SET vName = 'null';
	END IF;
*/
	IF(vName != '') THEN
		IF(vIndex<10) THEN
			SET vNum = CONCAT('0', vIndex);
		ELSE
			SET vNum = CONCAT('', vIndex);
		END IF;
		IF(vType = 'BON') THEN 
			SET vPre = 'B';
		ELSE
			SET vPre = 'D';
		END IF;
		SET vName = CONCAT('a.c', vPre, vNum, ' AS \'', vName, '\', ');
	END IF;
	RETURN vName;
END$$

CREATE PROCEDURE pListBook()
BEGIN
	DECLARE vIndex INTEGER DEFAULT 1;
	
	SET @sql = 'SELECT	CONCAT(MONTH(a.cDate), \'-\', YEAR(a.cDate)) AS \'Periodo pago\', ';
	SET @sql = CONCAT(@sql, 'a.cStartContract AS \'Inicio contrato\', ');
	SET @sql = CONCAT(@sql, 'a.cEndContract AS \'Termino contrato\', ');
	SET @sql = CONCAT(@sql, 'a.cName AS \'Nombre\', ');
	SET @sql = CONCAT(@sql, 'a.cUF AS \'U.F.\', ');
	SET @sql = CONCAT(@sql, 'a.cUTM AS \'U.T.M.\', ');
	SET @sql = CONCAT(@sql, 'a.cWorkedDays AS \'Días trabajado\', ');
	SET @sql = CONCAT(@sql, 'a.cPensionary AS \'Pensionado\', ');
	SET @sql = CONCAT(@sql, 'a.cDaysForYear AS \'Vacaciones por año\', ');
	SET @sql = CONCAT(@sql, 'c.cName AS \'Tipo de contrato\', ');
	SET @sql = CONCAT(@sql, 'a.cMinSalary AS \'Salario Mínimo\', ');
	SET @sql = CONCAT(@sql, 'a.cSalaryRoot AS \'Sueldo Base\', ');
	SET @sql = CONCAT(@sql, 'a.cSalaryReceived AS \'Salario Recibido\', ');
	SET @sql = CONCAT(@sql, 'b.cName AS \'Tipo de gratificación\', ');
	SET @sql = CONCAT(@sql, 'a.cLimitGratification AS \'Tope Gratificación\', ');
	SET @sql = CONCAT(@sql, 'a.cGratificationAmount AS \'Monto de Gratificación\', ');
	SET @sql = CONCAT(@sql, 'a.cGratificationFactor AS \'Factor de Gratificación\', ');
	SET @sql = CONCAT(@sql, 'a.cOvertime AS \'Horas Extras\', ');
	SET @sql = CONCAT(@sql, 'a.cOvertimeAmount AS \'Monto por horas extras\', ');
	SET @sql = CONCAT(@sql, 'a.cParticipation AS \'Participación\', ');
	
	WHILE vIndex<11 DO
		SET @sql = CONCAT(@sql, fGetAliasField(vIndex, 'BON'));
		SET vIndex = vIndex + 1;
	END WHILE;

	SET @sql = CONCAT(@sql, 'a.cExtraPay AS \'Aguinaldo\', ');
	SET @sql = CONCAT(@sql, 'a.cTotalIncomeTaxable AS \'Total Haberes Imponibles\', ');
	SET @sql = CONCAT(@sql, 'a.cLimitTaxableForecast AS \'Tope Imponible Previsional\', ');
	SET @sql = CONCAT(@sql, 'a.cLimitTaxableDismissInsurance AS \'Tope Imponible Seguro Cesantia\', ');
	SET @sql = CONCAT(@sql, 'a.cLimitInsurance AS \'Tope de seguro de cesantia\', ');
	SET @sql = CONCAT(@sql, 'a.cLimitIPS AS \'Tope IPS\', ');
	SET @sql = CONCAT(@sql, 'a.cIncome AS \'Renta afecta\', ');
	SET @sql = CONCAT(@sql, 'd.cKey AS \'Tramo familiar\', ');
	SET @sql = CONCAT(@sql, 'a.cFamilyAssignmentCount AS \'Cargas familiares\', ');
	SET @sql = CONCAT(@sql, 'a.cFamilyAssignmentAmount AS \'Monto cargas familiares\', ');
	SET @sql = CONCAT(@sql, 'a.cFamilyRetroactive AS \'Retroactivo familiar\', ');
	SET @sql = CONCAT(@sql, 'a.cFeeding AS \'Colación\', ');
	SET @sql = CONCAT(@sql, 'a.cMobilization AS \'Movilización\', ');
	SET @sql = CONCAT(@sql, 'a.cBounty AS \'Viaticos\', ');
	SET @sql = CONCAT(@sql, 'e.cName AS \'Horario\', ');
	/*
	SET @sql = CONCAT(@sql, 'a.cRewardAmount AS \'Gratificación\', ');
	*/
	SET @sql = CONCAT(@sql, 'a.cMonthNotification AS \'Mes de aviso\', ');
	SET @sql = CONCAT(@sql, 'a.cIAS AS \'Años de servicio\', ');
	SET @sql = CONCAT(@sql, 'a.cProportionalHoliday AS \'Vacaciones Proporcional\', ');
	SET @sql = CONCAT(@sql, 'a.cTotalIncomeNotTaxable AS \'Total haberes no imponibles\', ');
	SET @sql = CONCAT(@sql, 'a.cVoluntaryIndenmization AS \'Indemnisacion voluntaira\', ');
	SET @sql = CONCAT(@sql, 'f.cName AS \'A.F.P.\', ');
	SET @sql = CONCAT(@sql, 'g.cName AS \'ex-caja\', ');
	SET @sql = CONCAT(@sql, 'a.cObligatoryQuote AS \'Cotizacion Obligatoria\', ');
	SET @sql = CONCAT(@sql, 'a.cAPVAmount AS \'Monto APV\', ');
	SET @sql = CONCAT(@sql, 'a.cAccount2 AS \'Cuenta 2\', ');
	SET @sql = CONCAT(@sql, 'h.cName AS \'Salud\', ');
	SET @sql = CONCAT(@sql, 'i.cName AS \'Moneda Salud\', ');
	SET @sql = CONCAT(@sql, 'a.cHealthAmount AS \'Monto Salud\', ');
	SET @sql = CONCAT(@sql, 'a.cHealthCLP AS \'Salud CLP\', ');
	SET @sql = CONCAT(@sql, 'a.cAdditionalHealth AS \'Adicional de Salud\', ');
	SET @sql = CONCAT(@sql, 'a.cHealthLegalQuote AS \'Salud Legal\', ');
	SET @sql = CONCAT(@sql, 'j.cName AS \'Moneda Adicional AFP\', ');
	SET @sql = CONCAT(@sql, 'a.cAdditionalPFMAmount AS \'Monto APF adicional\', ');
	SET @sql = CONCAT(@sql, 'a.cAdditionalPFMCLP AS \'Monto APF adicional CLP\', ');
	SET @sql = CONCAT(@sql, 'a.cLimitHealth AS \'Limite Salud\', ');
	SET @sql = CONCAT(@sql, 'a.cHealthQuote AS \'Cotizacion de salud\', ');
	SET @sql = CONCAT(@sql, 'a.cInsuranceFactorEmployee AS \'Fact. cesantía empleado\', ');
	SET @sql = CONCAT(@sql, 'a.cInsuranceFactorEnterprise AS \'Fact. cesantía empresa\', ');
	SET @sql = CONCAT(@sql, 'a.cUnemploymentInsuranceAmount AS \'Monto Seguro cesantia\', ');
	SET @sql = CONCAT(@sql, 'a.cUniqueTax AS \'Impuesto Unico\', ');
	SET @sql = CONCAT(@sql, 'a.cSubtotalLawfulDiscounts AS \'Descuentos legales\', ');
	SET @sql = CONCAT(@sql, 'a.cAdvance AS \'Anticipo\', ');
	SET @sql = CONCAT(@sql, 'a.cLoanEnterprise AS \'Prestamo empresa\', ');
		
	SET vIndex = 1;
	WHILE vIndex<6 DO
		SET @sql = CONCAT(@sql, fGetAliasField(vIndex, 'DES'));
		SET vIndex = vIndex + 1;
	END WHILE;
	
	SET @sql = CONCAT(@sql, 'a.cLoanCompensationFund AS \'Prestamo caja compensacion\', ');
	SET @sql = CONCAT(@sql, 'a.cSavingCompensationFund AS \'Ahorro caja compensacion\', ');
	SET @sql = CONCAT(@sql, 'a.cJudicialRetention AS \'Retención Judicial\', ');
	SET @sql = CONCAT(@sql, 'a.cSubtotalOtherDiscounts AS \'Subtotal otros descuentos\', ');
	SET @sql = CONCAT(@sql, 'a.cTotalDiscounts AS \'Total descuentos\', ');
	SET @sql = CONCAT(@sql, 'a.cNetPaymentScope AS \'Alcance líquido\', ');
	SET @sql = CONCAT(@sql, 'a.cTotalIncome AS \'Total haberes\', ');
	SET @sql = CONCAT(@sql, 'a.cToPayEmployee AS \'A pagar al empleado\', ');
	SET @sql = CONCAT(@sql, 'a.cInsuranceAmountEnterprise AS \'Empleador por cesantía\', ');
	SET @sql = CONCAT(@sql, 'a.cMutualFactor AS \'Factor Mutual\', ');
	SET @sql = CONCAT(@sql, 'a.cPayToMutulEnterprise AS \'Empleador mutual \', ');
	SET @sql = CONCAT(@sql, 'a.cFamilyAssignmentEnterprise AS \'Empleador cargas familiares\', ');
	SET @sql = CONCAT(@sql, 'a.cCostEnterprise AS \'Costo empresa\', ');
	SET @sql = CONCAT(@sql, 'a.cSimpleLoads AS \'Cargas Simples\', ');
	SET @sql = CONCAT(@sql, 'a.cDisabilityBurdens AS \'Cargas Invalidez\', ');
	SET @sql = CONCAT(@sql, 'a.cMaternalLoads AS \'Cargas Maternales\', ');
	SET @sql = CONCAT(@sql, 'a.cSimpleAdjustment AS \'Ajuste Sencillo\'');
	SET @sql = CONCAT(@sql, 'FROM vBook AS a ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tGratificationType AS b ON a.cGratificationType = b.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tContractType AS c ON a.cContractType = c.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tFamilyAssignmentStretch AS d ON a.cFamilyAssignmentStretch = d.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tHorary AS e ON a.cHorary = e.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tPFMHistory AS f ON a.cPFMHistory = f.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tExBoxSystem AS g ON a.cExBoxSystem = g.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN 	tHealthHistory AS h ON a.cHealthHistory = h.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tCurrency AS i ON a.cHealthCurrency = i.cId ');
	SET @sql = CONCAT(@sql, 'LEFT JOIN	tCurrency AS j ON a.cAdditionalPFMCurrency = j.cId ');
	SET @sql = CONCAT(@sql, 'WHERE	a.cPeriod = fGetOpenedPeriod(); ');
	
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

END$$



DELIMITER ;