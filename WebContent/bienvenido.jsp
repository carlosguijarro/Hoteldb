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
<h4 class="centered">Tablas:</h4>
<div class="tableList">
<a class="selectTable" href="verclientes.jsp">CLIENTES</a>
<a class="selectTable" href="verhabitaciones.jsp">HABITACIONES</a>
<a class="selectTable" href="verreservas.jsp">RESERVAS</a>
<a class="selectTable" href="verservicios.jsp">SERVICIOS ESPECIALES</a>
<a class="selectTable" href="vercontratos.jsp">CONTRATOS</a>
</div>
<h4 class="centered">Consultas:</h4>
<div class="tableList">
<a class="selectTable" href="verinquilinos.jsp">INQUILINOS ACTUALES</a>
</div>
<h4 class="centered">Informe con selector:</h4>
<div class="tableList">
<a class="selectTable" href="informeConSelector.jsp">IR A SELECTOR</a>
</div>
<h4 class="centered">Inserción de datos:</h4>
<div class="tableList">
<a class="selectTable" href="nuevoCliente.jsp">AÑADIR CLIENTE</a>
</div>
</div>
<footer>Carlos Guijarro Villegas</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script></body></html>