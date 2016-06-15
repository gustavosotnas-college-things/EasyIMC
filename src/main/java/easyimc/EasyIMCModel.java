package easyimc;

public class EasyIMCModel {
	
	// "struct" para guardar os dados do resultado do IMC (valor e status).
	static class IMC
	{
		double indice;
		String status;
		
		IMC(double indice, String status)
		{
			this.indice = indice;
			this.status = status;
		}
	}

	public static int calcular(int oper1, String op, int oper2) {
		int resultado = 0;
		if (op.equals("+")) {
			resultado = oper1 + oper2;
		} else if (op.equals("-")) {
			resultado = oper1 - oper2;
		} else if (op.equals("*")) {
			resultado = oper1 * oper2;
		}
		return resultado;
	}

	public static IMC calculaIMC(Double peso, Double altura) {

		double resultado_temp = peso/(altura*altura);
		double IMC = (Math.round(resultado_temp*100))/100.0;
		String statusResultado = "";
		
		if (IMC > 0.0 && IMC < 18.5)
		{
			statusResultado = "Abaixo do peso ideal.";
		}
		else if (IMC >= 18.5 && IMC < 24.9)
		{
			statusResultado = "No peso ideal.";
		}
		else if (IMC >= 25 && IMC < 29.9)
		{
			statusResultado = "Acima do peso ideal.";
		}
		else if (IMC >= 30 && IMC < 39.9)
		{
			statusResultado = "Obesidade, muito acima do peso ideal.";
		}
		else if (IMC > 40)
		{
			statusResultado = "Obesidade mórbida.";
		}
		return new IMC(IMC, statusResultado);
	}
}
