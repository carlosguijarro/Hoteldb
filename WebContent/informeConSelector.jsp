<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
%>
<html>
<head>
<title>HOTEL DATABASE - Inicio</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Anton|Oswald|Exo+2" rel="stylesheet">  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<h1>HOTEL DATABASE</h1>
<h3>Bienvenido, <%=session.getAttribute("usuario") %>. Estos son los datos del hotel actuales</h3>
<hr/>
<div id="tabNavigator"><a class="headerLink" href="bienvenido.jsp">Página principal</a>
<a class="headerLink" href="cerrarsesion.jsp">Salir</a></div>
</header>
<br/>
<div class="container">
<h2 class="centered">Selector</h2>

<form method="post" action="informeConSelector.jsp">
	<select name="opcion">
		<option value="a" selected>Listado de clientes que aún no han visitado el hotel</option>
		<option value="b">Listado de habitaciones libres</option>
		<option value="c">Listado de clientes que ya han abandonado el hotel</option>
		<option value="d">Listado de clientes con servicios especiales</option>
	</select>
	<input type="submit" value="Enviar">
</form>
<%
String query;
beanDB basededatos = new beanDB();
String [][] tablares;
String op = request.getParameter("opcion");
if(op==null)
	op="a";
String title1,title2,title3;
	if(op.equals("a")){
		query="SELECT c.idCliente, r.idHabitacion, r.fechaEntrada FROM reservas r JOIN clientes c ON (r.idCliente = c.idCliente) WHERE CURDATE() < fechaEntrada";
		title1="ID de Cliente"; title2="Habitación"; title3="Fecha de entrada";
	}
	else if(op.equals("b")){
		query="SELECT idHabitacion, planta, 'LIBRE' FROM habitaciones WHERE idHabitacion IN (SELECT idHabitacion FROM reservas WHERE CURDATE() > fechaSalida OR CURDATE() < fechaEntrada)";
		title1="Habitación"; title2="Planta"; title3="Estado";
	}
	else if(op.equals("c")){
		query="SELECT c.nombre, c.apellidos, r.fechaSalida FROM reservas r JOIN clientes c ON (r.idCliente = c.idCliente) WHERE r.fechaSalida < CURDATE()";
		title1="Nombre"; title2="Apellidos"; title3="Fecha de salida";
		}
	else{
		query="SELECT DISTINCT c.nombre, c.apellidos, ca.idHabitacion FROM (clientes c JOIN clientes_has_serviciosEspeciales chse ON (c.idCliente = chse.idCliente)) JOIN ClientesActuales ca ON (c.idCliente = ca.idCliente) WHERE chse.idServicio IS NOT NULL";
		title1="Nombre"; title2="Apellidos"; title3="Habitación";
	}
	tablares = basededatos.resConsultaSelectA3(query);
%>

<table>
<tr>
<th><%=title1 %></th><th><%=title2 %></th><th><%=title3 %></th>
</tr>
<% for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista%>
	<tr>
	<% for (int j=0;j<tablares[i].length;j++){ %>
		
	 <td> <%=tablares[i][j] %> </td>
	  
	 <% }%>
	 </tr>
	 <% } %>
</table>

</div>
<footer>Carlos Guijarro Villegas</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script></body></html>