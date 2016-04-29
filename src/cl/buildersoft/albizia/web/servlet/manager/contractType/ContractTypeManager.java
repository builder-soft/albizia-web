package cl.buildersoft.albizia.web.servlet.manager.contractType;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

/**
 * Servlet implementation class ContractTypeManager
 */
@WebServlet("/servlet/albizia/manager/ContractType")
public class ContractTypeManager extends BSHttpServletCRUD {
	private static final long serialVersionUID = -883759480200742225L;

	public ContractTypeManager() {
		super();
	}

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = initTable(request, "tContractType");
		return table;
	}

	@Override
	public Semaphore setSemaphore(Connection conn, Object[] values) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void configEventLog(BSTableConfig table, Long userId) {
		// TODO Auto-generated method stub

	}

}
