package cl.buildersoft.albizia.web.servlet.manager.employeeAgreement;

import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import cl.buildersoft.framework.database.BSmySQL;
import cl.buildersoft.framework.type.Semaphore;
import cl.buildersoft.framework.util.BSConfig;
import cl.buildersoft.framework.util.BSConnectionFactory;
import cl.buildersoft.framework.util.crud.BSAction;
import cl.buildersoft.framework.util.crud.BSActionType;
import cl.buildersoft.framework.util.crud.BSHttpServletCRUD;
import cl.buildersoft.framework.util.crud.BSTableConfig;

/**
 * Servlet implementation class EmployeeManager
 */
@WebServlet("/servlet/config/employee/EmployeeAgreementManager")
public class EmployeeAgreementManager extends BSHttpServletCRUD {
	private static final Logger LOG = Logger.getLogger(EmployeeAgreementManager.class.getName());
	private static final long serialVersionUID = -7665593692157885850L;

	@Override
	protected BSTableConfig getBSTableConfig(HttpServletRequest request) {
		BSTableConfig table = initTable(request, "tEmployee", this);
		table.setSortField(getSortField(request));

		table.setTitle("Informacion de contratos");

		table.getField("cName").setLabel("Nombre");
		table.getField("cPost").setLabel("Cargo");
		table.getField("cArea").setLabel("Area");
		table.getField("cGroup").setLabel("Grupo");
		table.getField("cBoss").setLabel("Superior");
		table.getField("cPrivilege").setLabel("Tipo de usuario");
		// table.getField("cEnabled").setLabel("Activado");
		table.getField("cUsername").setLabel("Nombre Usuario");
		table.getField("cMail").setLabel("Correo electrónico");

		this.hideFields(table, "cMail", "cArea", "cPrivilege", "cBirthDate", "cAddress", "cComuna", "cCountry", "cGenere",
				"cPhone", "cMaritalStatus");
		table.removeField("cEnabled");

		table.setWhere("cEnabled=TRUE");
		table.removeAction("INSERT");
		table.removeAction("EDIT");
		table.removeAction("DELETE");

		BSAction informationPrevitional = new BSAction("PREVITIONAL", BSActionType.Record);
		informationPrevitional.setLabel("Información Previsional");
		informationPrevitional.setUrl("/servlet/config/employee/InformationPrevitional");
		// table.addAction(informationPrevitional);

		BSAction contractualInfo = new BSAction("CONTRACTUAL", BSActionType.Record);
		contractualInfo.setLabel("Información Contractual");
		contractualInfo.setUrl("/servlet/config/employee/ContractualInfo");
		contractualInfo.setContext("ALBIZIA_CONTEXT");
		table.addAction(contractualInfo);

		BSAction payMode = new BSAction("PAY_MODE", BSActionType.Record);
		payMode.setLabel("Forma de Pago");
		payMode.setUrl("/servlet/config/employee/PayMode");
		// table.addAction(payMode);

		BSAction document = new BSAction("DOCUMENTS", BSActionType.Record);
		document.setLabel("Documentos");
		document.setUrl("/servlet/config/employee/DocumentEmployee");
		document.setMethod("listDocuments");
		// table.addAction(document);

		return table;
	}

	private String getSortField(HttpServletRequest request) {
		BSConnectionFactory cf = new BSConnectionFactory();
		BSConfig config = new BSConfig();

		Connection conn = cf.getConnection(request);
		String out = config.getString(conn, "EMPLOYEE_ORDER");
		cf.closeConnection(conn);
		return out;
	}

	@Override
	public Semaphore setSemaphore(Connection conn, Object[] values) {
		LOG.entering(EmployeeAgreementManager.class.getName(), "setSemaphore", values);
		Semaphore out = null;
		Long startTime = null;
		if (values != null) {
			BSmySQL mysql = new BSmySQL();

			String sql = "SELECT count(cId) FROM tR_EmployeeTurn WHERE cEmployee=?";
			startTime = System.currentTimeMillis();
			Integer cant = Integer.parseInt(mysql.queryField(conn, sql, values[0]));
			LOG.log(Level.FINE, "Load semaphore in {0}mm", System.currentTimeMillis() - startTime);
			mysql.closeSQL();
			if (cant == 0) {
				out = Semaphore.RED;
			} else {
				out = Semaphore.GREEN;
			}
		}
		LOG.exiting(EmployeeAgreementManager.class.getName(), "setSemaphore", out);
		return out;
	}

	@Override
	protected void configEventLog(BSTableConfig table, Long userId) {
		// TODO Auto-generated method stub

	}

	@Override
	protected void preExecuteAction(BSTableConfig table, String action, Long userId) {
		// TODO Auto-generated method stub

	}

	@Override
	protected void postExecuteAction(BSTableConfig table, String action, Long userId) {
		// TODO Auto-generated method stub

	}
}
