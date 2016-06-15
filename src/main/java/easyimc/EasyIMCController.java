package easyimc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EasyIMC")
public class EasyIMCController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int oper1 = toInt(req, "operador1", "0");
		String op = valor(req, "operacao", "");
		int oper2 = toInt(req, "operador2", "0");

		int resultadoCalculo = CalculadoraModel.calcular(oper1, op, oper2);
		
		//Passando parâmetro para o JSP.
		req.setAttribute(
				"resultado",
				resultadoCalculo);

		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	
	private int toInt(HttpServletRequest req, String param, String padrao)
	{
		return Integer.parseInt(valor(req, param, padrao));
	}
	
	private String valor(HttpServletRequest req, String param, String padrao) {

		String result = req.getParameter(param);
		if (result == null) {
			result = padrao;
		}
		return result;
	}
}
