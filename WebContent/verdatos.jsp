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
<title>HOTEL DATABASE - Home</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Anton|Oswald" rel="stylesheet">  
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
<div class="tableList">
<button class="selectTable" onclick="alert('Prueba')">CLIENTES</button>
<button class="selectTable" onclick="alert('Prueba')">HABITACIONES</button>
<button class="selectTable" onclick="alert('Prueba')">RESERVAS</button>
<button class="selectTable" onclick="alert('Prueba')">SERVICIOS ESPECIALES</button>
<button class="selectTable" onclick="alert('Prueba')">CLIENTES_HAS_SERVICIOSESPECIALES</button>
</div>
<h4 class="centered">Consultas:</h4>
<div class="tableList">
<button class="selectTable" onclick="alert('Prueba')">INQUILINOS ACTUALES</button>
</div>
<% 
String query="select * from clientes";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
%> 
<table>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script></body></html>