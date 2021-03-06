package cl.buildersoft.albizia.web.servlet.manager.banch;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

@WebServlet("/servlet/albizia/manager/Branch")
public class BranchManager extends BSHttpServletCRUD {
	private static final long serialVersionUID = -2048068668878392177L;

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = initTable(request, "tBranch");

		table.setTitle("Sucursales");

		table.getField("cName").setLabel("Nombre");
		table.getField("cEnterprise").setLabel("Empresa");
		table.getField("cAddress").setLabel("Dirección");
		table.getField("cPhone").setLabel("Teléfono");

		return table;
	}

	@Override
	public Semaphore setSemaphore(Connection conn, Object[] values) {
		return null;
	}

	@Override
	protected void configEventLog(BSTableConfig table, Long userId) {
	}

	
}
