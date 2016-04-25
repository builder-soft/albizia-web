package cl.buildersoft.web.servlet.albizia.process.salary;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.buildersoft.albizia.business.beans.Period;
import cl.buildersoft.framework.database.BSBeanUtils;
import cl.buildersoft.framework.database.BSmySQL;
import cl.buildersoft.framework.util.BSConnectionFactory;
import cl.buildersoft.framework.web.servlet.BSHttpServlet_;

@WebServlet("/servlet/remuneration/process/salary/ProcessSalary")
public class ProcessSalary extends BSHttpServlet_ {
	private static final long serialVersionUID = 8964108846441089172L;

	public ProcessSalary() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BSmySQL mysql = new BSmySQL();
		BSConnectionFactory cf = new BSConnectionFactory();
		
		Connection conn = cf.getConnection(request);
		BSBeanUtils bu = new BSBeanUtils();

		Long periodId = Long.parseLong(mysql.callFunction(conn, "fGetOpenedPeriod", null));

		Period period = new Period();
		period.setId(periodId);
		bu.search(conn, period);

		ResultSet book = mysql.callSingleSP(conn, "pListBook", null);

		request.setAttribute("Period", period);
		request.setAttribute("Book", book);
		request.setAttribute("Conn", conn);
		
		forward(request, response, "/WEB-INF/jsp/remuneration/process/salary/process-salary.jsp");
//		request.getRequestDispatcher("/WEB-INF/jsp/remuneration/process/salary/process-salary.jsp").forward(request, response);
		
	}
}
