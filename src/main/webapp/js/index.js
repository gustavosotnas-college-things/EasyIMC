function calculaIMC()
{
	var peso = document.formularioIMC.peso.value;
	var altura = document.formularioIMC.altura.value;

	var alturaAoQuadrado = (altura * altura);
	var IMC = (peso / alturaAoQuadrado);

	if (IMC < 18.5)
	{
		alert("Abaixo do peso ideal\nÍndice: " + IMC);
	}
	else if (IMC >= 18.5 && IMC < 24.9)
	{
		alert("No peso ideal.\nÍndice: " + IMC);
	}
	else if (IMC >= 25 && IMC < 29.9)
	{
		alert("Acima do peso ideal.\nÍndice: " + IMC);
	}
	else if (IMC >= 30 && IMC < 39.9)
	{
		alert("Obesidade, muito acima do peso ideal.\nÍndice: " + IMC);
	}
	else if (IMC > 40)
		alert("Obesidade mórbida.\nÍndice: " + IMC);
}
