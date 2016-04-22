package cl.buildersoft.web.servlet.config.enterprise.banch;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

@WebServlet("/servlet/config/enterprise/branch/BranchManager")
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void configEventLog(BSTableConfig table, Long userId) {
		// TODO Auto-generated method stub

	}

}
