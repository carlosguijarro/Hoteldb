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
<title>HOTEL DATABASE - Contratos</title>
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
<div class="container">

<% 
String query="SELECT c.nombre, c.apellidos, s.nombreServicio FROM (clientes_has_serviciosEspeciales chse JOIN clientes c ON (chse.idCliente = c.idCliente)) JOIN serviciosEspeciales s ON (chse.idServicio = s.serv_id) ORDER BY c.apellidos";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
%> 
<table>
<tr>
<th>Nombre</th><th>Apellidos</th><th>Servicio contratado</th>
</tr>
<% for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
	%><tr>
	 <td> <%=tablares[i][0] %> </td>
	 <td> <%=tablares[i][1] %> </td>
	 <td> <%=tablares[i][2] %> </td>
	 </tr> <% 
}
%>
</table>

</div>
<footer>Carlos Guijarro Villegas</footer>
</body>
</html>