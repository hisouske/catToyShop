package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.cartdao;

public class cartdel_action implements action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gcode = Integer.parseInt(request.getParameter("code"));
		String id = request.getParameter("id");
		
		System.out.println(gcode+id);
		cartdao cdao = cartdao.getinstanse();
		
		 cdao.delcart(gcode,id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("cart.do?ccommand=cartpage&id="+id);
	dispatcher.forward(request, response);
	}

}
