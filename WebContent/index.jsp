<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HOTEL DATABASE - Login</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
	.inputgris {
		border: none; 
		background-color: #DFDFDF;
		color: green;
		text-align: center;
	}
</style>
<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		}
		else return true;
	}
	else return true;
}
</script>
</head>
<body style="font-family: sans-serif; font-size: 10pt; background-color: #FAFAFA;">
<div class="centered-onscreen">
<h1>Iniciar Sesión</h1>
<form action="./LoginAuthenticator" method="post" name="iniciosesion"/>

<input type="hidden" name="varoculta" value="secreto"/>
<div class="row">
<div class="col-sm">
Usuario:</div>
<div class="col-sm"><input type="text" name="usuario" onkeypress="return compruebaalfan(this,event);" maxlength="10" value="" class="inputgris"/></div>
	</div>
	<div class="row">
<div class="col-sm">Contraseña:</div>
	<div class="col-sm"><input type="password" name="pass" onkeypress="return compruebaalfan(this,event);" maxlength="8" value="" class="inputgris"/></div>
</div>
	
		<input type="button" name="send" value="Enviar" onclick="compruebayenvia();"/>

</form>
</div>
</body>
</html>