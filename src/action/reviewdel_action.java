package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.reviewdao;

public class reviewdel_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		int code = Integer.parseInt(request.getParameter("code"));
		String gcode = request.getParameter("gcode");
		reviewdao dao = reviewdao.getinstanse();
		dao.delreview(code);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("goods.do?gcommand=detail&code=" + gcode);
		dispatcher.forward(request, response);
	}

}
