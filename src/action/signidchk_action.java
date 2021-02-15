package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.memdao;

public class signidchk_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		memdao mdao = memdao.getinstanse();
	
		String chkid = request.getParameter("chkid");
		String sign = mdao.idchk(chkid);
		
		System.out.println(sign);
	
		request.setAttribute("sign", sign);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("miyao/login.jsp#lg2");
		dispatcher.forward(request, response);
	}

}
