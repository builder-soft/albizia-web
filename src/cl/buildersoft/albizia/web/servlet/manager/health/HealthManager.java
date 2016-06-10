package cl.buildersoft.albizia.web.servlet.manager.health;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

@WebServlet("/servlet/config/health/HealthManager")
public class HealthManager extends BSHttpServletCRUD {
	private static final long serialVersionUID = 4686868722586369145L;

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = super.initTable(request, "tHealth");

		table.setTitle("Instituciones de salud");

		table.getField("cKey").setLabel("Llave de integración");
		table.getField("cName").setLabel("Nombre");
		table.getField("cFactor").setLabel("Factor descuento");

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