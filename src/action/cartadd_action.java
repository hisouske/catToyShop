package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.cartdao;
import dto.cartdto;

public class cartadd_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gcode = Integer.parseInt(request.getParameter("gcode"));
		int qtt = Integer.parseInt(request.getParameter("qtt"));
		String id = request.getParameter("id");

		System.out.println(id + "+" + gcode + "+" + qtt);

		cartdao dao = cartdao.getinstanse();

		int qttcheck = dao.qttcheck(gcode,id);

		if (qttcheck == 0) {
			cartdto cdto = new cartdto();
			cdto.setGcode(gcode);
			cdto.setQtt(qtt);
			cdto.setId(id);
			dao.insertcart(cdto);
		} else {
			qttcheck += qtt;
			dao.updateqtt(qttcheck, gcode);

		}

		response.sendRedirect("cart.do?ccommand=cartpage&id="+id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("cart.do?ccommand=cartpage&id"+id);
//		dispatcher.forward(request, response);

	}

}
