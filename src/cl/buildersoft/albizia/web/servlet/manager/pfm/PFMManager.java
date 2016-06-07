package cl.buildersoft.albizia.web.servlet.manager.pfm;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

@WebServlet("/servlet/config/pfm/PFMManager")
public class PFMManager extends BSHttpServletCRUD {
	private static final long serialVersionUID = -913523455848692014L;

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = super.initTable(request, "tPFM");

		table.setTitle("Administradores de Fondos de Pensión");

		table.getField("cKey").setLabel("Llave de integración");
		table.getField("cName").setLabel("Nombre");
		table.getField("cFactor").setLabel("Factor descuento");
		table.getField("cSIS").setLabel("Seguro de Invalidez y Sobrevivencia");

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