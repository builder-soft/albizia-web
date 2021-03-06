<%@page import="cl.buildersoft.albizia.business.beans.Period"%>
<%@page import="java.sql.Connection"%>
<%@page import="cl.buildersoft.framework.database.BSmySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="cl.buildersoft.framework.util.BSDateTimeUtil"%>
<%@page import="java.util.Date,cl.buildersoft.framework.util.BSWeb"%>
 
<%
	Period period =(Period) request.getAttribute("Period");
	Date date = period.getDate();

	ResultSet book = (ResultSet) request.getAttribute("Book");

	Connection conn = (Connection) request.getAttribute("Conn");
%>
<%@ include file="/WEB-INF/jsp/common/header2.jsp"%>
<%@ include file="/WEB-INF/jsp/common/menu2.jsp"%>

<h1 class="cTitle">C�lculo de Remuneraciones</h1>

<form
	action="${pageContext.request.contextPath}/servlet/remuneration/process/salary/CalculateSalary"
	method="post">
	
	<table>
		<tr>
			<td class='cLabel'>Per�odo:</td>
			<td class='cData'><%=BSDateTimeUtil.month2Word(date)%> de <%=BSDateTimeUtil.getYear(date)%></td>
		</tr>
		<!-- 
<tr>
<td class='cLabel'>Empresa:</td>
<td class='cData'><select/></td>
</tr>
-->
	</table>
	<button class="btn btn-primary" type="submit">Calcular</button>
	<button class="btn disabled" type="button" onclick="javascript:$('#downloadAsFile').submit();">Descargar como archivo</button>

</form>

<form id="downloadAsFile"
	action="${pageContext.request.contextPath}/servlet/remuneration/process/salary/DownloadAsFile"
	method="post">
	
</form>

<script type="text/javascript">
<!--
	function onLoadPage() {
/*	
		document.getElementById("divScroll").style.height = (screen.availHeight - 350)
				+ "px";
		document.getElementById("divScroll").style.width = (screen.availWidth - 50)
				+ "px";
*/
		//	$("#divScroll").fadeIn(speed);

	}
//-->
</script>

	<div class="row">
<div id="col-sm-12" style="overflow: auto; position: relative;">
	<%=BSWeb.showResultSet(conn, book)%>
	
</div>
</div>
<%
new BSmySQL().closeConnection(conn);
%>
<%@ include file="/WEB-INF/jsp/common/footer2.jsp"%>

