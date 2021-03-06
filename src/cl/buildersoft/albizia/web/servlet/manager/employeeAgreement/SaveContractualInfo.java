package cl.buildersoft.albizia.web.servlet.manager.employeeAgreement;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.buildersoft.albizia.business.beans.Agreement;
import cl.buildersoft.albizia.business.beans.ContractType;
import cl.buildersoft.framework.dataType.BSDataType;
import cl.buildersoft.framework.dataType.BSDataTypeEnum;
import cl.buildersoft.framework.dataType.BSDataTypeFactory;
import cl.buildersoft.framework.database.BSBeanUtils;
import cl.buildersoft.framework.database.BSBeanUtilsSP;
import cl.buildersoft.framework.util.BSConnectionFactory;
import cl.buildersoft.framework.web.servlet.BSHttpServlet_;

@WebServlet("/servlet/config/employee/SaveContractualInfo")
public class SaveContractualInfo extends BSHttpServlet_ {
	private static final long serialVersionUID = 5316369008384063620L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("cId"));

		BSConnectionFactory mysql = new BSConnectionFactory();
		Connection conn = mysql.getConnection(request);
		BSBeanUtilsSP bu = new BSBeanUtilsSP();

		Agreement agreement = getAgreement(conn, bu, id);

		BSDataTypeFactory dtf = new BSDataTypeFactory();
		BSDataType dateType = dtf.create(BSDataTypeEnum.DATE);
		BSDataType doubleType = dtf.create(BSDataTypeEnum.DOUBLE);

		Long profile = Long.parseLong(request.getParameter("cProfile"));
		Long contractTypeId = Long.parseLong(request.getParameter("cContractType"));
		ContractType contractType = getContractType(conn, contractTypeId);

		Date startContract = (Date) dateType.parse(conn, request.getParameter("cStartContract"));
		Date endContract = contractType.getKey().equals("UND") ? null : (Date) dateType.parse(conn,
				request.getParameter("cEndContract"));
		Long gratificationType = Long.parseLong(request.getParameter("cGratificationType"));
		Long horary = Long.parseLong(request.getParameter("cHorary"));

		Double mobilization = (Double) doubleType.parse(conn, request.getParameter("cMobilization"));
		Double feeding = (Double) doubleType.parse(conn, request.getParameter("cFeeding"));
		Double salaryRoot = (Double) doubleType.parse(conn, request.getParameter("cSalaryRoot"));

		agreement.setProfile(profile);
		agreement.setContractType(contractTypeId);
		agreement.setStartContract(startContract);
		agreement.setEndContract(endContract);
		agreement.setGratificationType(gratificationType);
		agreement.setHorary(horary);
		agreement.setMobilization(mobilization);
		agreement.setFeeding(feeding);
		agreement.setSalaryRoot(salaryRoot);

		bu.save(conn, agreement);

		mysql.closeConnection(conn);

		forward(request, response, "/servlet/config/employee/EmployeeAgreementManager");
		// request.getRequestDispatcher("/servlet/config/employee/EmployeeManager").forward(request,
		// response);
	}

	private ContractType getContractType(Connection conn, Long contractTypeId) {
		BSBeanUtils bu = new BSBeanUtils();
		ContractType contractType = new ContractType();
		contractType.setId(contractTypeId);
		bu.search(conn, contractType);

		return contractType;
	}

	private Agreement getAgreement(Connection conn, BSBeanUtilsSP bu, Long idEmployee) {
		ContractualInfo ci = new ContractualInfo();
		return ci.getAgreement(conn, bu, idEmployee);
	}

}
