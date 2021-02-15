package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.cartdao;
import dao.goodsdao;
import dao.reviewdao;
import dto.goodsdto;
import dto.reviewdto;

public class replycode_action implements action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String recode = request.getParameter("recode");
     	System.out.println(recode);
		int code = Integer.parseInt(request.getParameter("gcode"));
		goodsdao dao = goodsdao.getinstanse();
		goodsdto gdto = dao.onegoods(code);
		reviewdao rdao = reviewdao.getinstanse();
		List<reviewdto> reviewlist = rdao.reviewlist(code);
		List<reviewdto> rereviewlist = rdao.rereviewlist(code);
		
		int sum = rdao.sum1;
		int cnt = rdao.cnt1;
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("sum", sum);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("gdto", gdto);
	    request.setAttribute("recode", recode);
		request.setAttribute("rereviewlist", rereviewlist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("miyao/detail.jsp");
	dispatcher.forward(request, response);
	}

}
