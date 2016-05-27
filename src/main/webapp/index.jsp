﻿<!DOCTYPE html>
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
		<!-- GitHub Ribbon -->
		<a href="https://github.com/gustavosotnas/EasyIMC"><img style="position: absolute; top: 0; right: 0; border: 0; z-index: 1031;" src="https://camo.githubusercontent.com/e7bbb0521b397edbd5fe43e7f760759336b5e05f/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677265656e5f3030373230302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_green_007200.png"></a>
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
			double result = 0, IMC = 0;
			if (peso == null || altura == null)
			{
				return;
			}
			else
			{
				result = peso/(altura*altura);
				IMC = (Math.round(result*100))/100.0;
				out.print("<script type=text/javascript>");
				if (IMC > 0.0 && IMC < 18.5)
				{
					out.print("alert('Abaixo do peso ideal\\nÍndice: " + IMC + "');");
				}
				else if (IMC >= 18.5 && IMC < 24.9)
				{
					out.print("alert('No peso ideal.\\nÍndice: " + IMC + "');");
				}
				else if (IMC >= 25 && IMC < 29.9)
				{
					out.print("alert('Acima do peso ideal.\\nÍndice: " + IMC + "');");
				}
				else if (IMC >= 30 && IMC < 39.9)
				{
					out.print("alert('Obesidade, muito acima do peso ideal.\\nÍndice: " + IMC + "');");
				}
				else if (IMC > 40)
				{
					out.print("alert('Obesidade mórbida.\\nÍndice: " + IMC + "');");
				}
				out.print("</script>");
			}
		%>
		</div>
	</body>
</html>