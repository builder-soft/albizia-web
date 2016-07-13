package cl.buildersoft.albizia.web.servlet.manager.assetDiscount;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

@WebServlet("/servlet/albizia/manager/AssetDiscount")
public class AssetDiscountManager extends BSHttpServletCRUD {
	private static final long serialVersionUID = -7130205551180841782L;

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = super.initTable(request, "tAssetDiscount");

		table.removeAction("DELETE");
		table.removeAction("INSERT");
		table.setTitle("Tabla de haberes y descuentos");

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
