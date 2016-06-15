package easyimc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import easyimc.EasyIMCModel.IMC;

@WebServlet("/EasyIMC")
public class EasyIMCController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException
	{
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
			IMC imc = EasyIMCModel.calculaIMC(peso, altura);
			//Passando resultado para o JSP.
			request.setAttribute("resultado", "alert('"+ imc.status + "\\nÍndice: " + imc.indice + "');");
	
			request.getRequestDispatcher("index.jsp").forward(request, resp);
		}
	}
}
