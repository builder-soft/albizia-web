package cl.buildersoft.albizia.web.servlet.manager.gratificationType;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

/**
 * Servlet implementation class ContractTypeManager
 */
@WebServlet("/servlet/albizia/manager/GratificationType")
public class GratificationTypeManager extends BSHttpServletCRUD {
	private static final long serialVersionUID = -1230897600105567518L;

	public GratificationTypeManager() {
		super();
	}

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = initTable(request, "tGratificationType");
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

	@Override
	public void preExecuteAction(BSTableConfig table, String action, Long userId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void postExecuteAction(BSTableConfig table, String action, Long userId) {
		// TODO Auto-generated method stub

	}

}
