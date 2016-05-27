<!DOCTYPE html>
<%@ page language="java" %>
<!--
	index.jsp

	Página inicial do EasyIMC
	Autor: Gustavo Moraes
-->
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="styles/paper_bootstrap.min.css">
		<link rel="stylesheet" href="styles/index.css">
		<link rel="icon" href="assets/icon/ruler-icon.png">
		<title>EasyIMC</title>
	</head>
	<body>
		<div class="container">
			<!-- Navbar -->
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="pull-left" href="#">
							<center>
							<img src="assets/icon/easyimc_logo_header.svg" alt="" height="64px">
							</center>
						</a>
					</div>
				</div>
			</nav>
		<!-- Conteúdo -->
			<hr style="height: 64px"> <!-- Para a navbar não ficar acima do texto -->
			<h2>Calcule o seu IMC</h2>
			<p>Calcule seu índice de massa corporal e saiba se você está com 
			sobrepeso, obesidade, subnutrição ou se está no peso ideal.</p>
			<form role="form" name="formularioIMC" id="formularioIMC">
				<div class="form-group">
					<label for="peso-label">Seu peso:</label>
					<input type="number" class="form-control" id="peso" name="peso" placeholder="Peso em quilogramas (kg), ex.: 80">
				</div>
				<div class="form-group">
					<label for="altura-label">Sua altura:</label>
					<input type="number" class="form-control" id="altura" name="altura" placeholder="Altura em metros (m), ex.: 1,60">
				</div>
				<div class="form-group">
					<label for="altura">Sexo:</label>
					<div class="radio">
						<label><input type="radio" name="optradio" id="sexo-masc">Masculino</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="optradio" id="sexo-fem">Feminino</label>
					</div>
				</div>
				<button type="submit" class="btn btn-default" onclick="calculaIMC()">Calcular</button>
			</form>
		<script language="JavaScript">
			function calculaIMC()
			{
				formularioIMC.submit();
			}
		</script>
		<%
			String pesoStr = request.getParameter("peso");
			String alturaStr = request.getParameter("altura");
			Double peso = Double.parseDouble(pesoStr == null ? "0" : pesoStr);
			Double altura = Double.parseDouble(alturaStr == null ? "0" : alturaStr);
			double result = 0;
			if (peso == null || altura == null)
			{
				out.print("Resultado: " + result);
				return;
			}
			else
			{
				result = peso / (altura * altura);
				out.print("<center><div>Resultado: " + (Math.round(result*100))/100.0 + "</div></center>");
			}
		%>
		</div>
	</body>
</html>