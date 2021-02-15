package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.reviewdao;
import dto.reviewdto;

public class reviewadd_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String recode = request.getParameter("recode");
		String text = request.getParameter("text");
		String id = request.getParameter("id");
		int gcode = Integer.parseInt(request.getParameter("gcode"));
		System.out.println(id + text + gcode + "/" + recode);
		reviewdao dao = reviewdao.getinstanse();

		if (recode.equals("")) {
			int point = Integer.parseInt(request.getParameter("point"));
			reviewdto dto = new reviewdto();
			dto.setGcode(gcode);
			dto.setId(id);
			dto.setPoint(point);
			dto.setText(text);
			dto.setAdmincode(0);
			dao.insertreview(dto);
		}
		 else {
			reviewdto dto = new reviewdto();
			dto.setGcode(gcode);
			dto.setId(id);
			dto.setPoint(0);
			dto.setText(text);
			dto.setAdmincode(Integer.parseInt(recode));
			dao.insertreview(dto);

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("goods.do?gcommand=detail&code=" + gcode);
		dispatcher.forward(request, response);
	}

}
