package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.goodsdao;
import dto.goodsdto;

public class goodscate_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int category = Integer.parseInt(request.getParameter("category"));
		String category2 = null;
		switch (category) {
		case 1:
			category2 = "장난감";
			break;
		case 2:
			category2 = "사료";
			break;
		case 3:
			category2 = "간식";
			break;
		case 4:
			category2 = "건강보조제";
			break;
		case 5:
			category2 = "모래";
			break;
		}

		System.out.println(category2);
		goodsdao gdao = goodsdao.getinstanse();
		List<goodsdto> goodslist = gdao.goodslist(category2);

		request.setAttribute("goodslist", goodslist);

		RequestDispatcher dispatcher = request.getRequestDispatcher("miyao/main.jsp");
		dispatcher.forward(request, response);

	}

}
