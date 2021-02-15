package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.goodsdao;
import dao.paymentdao;
import dto.goodsdto;
import dto.pagenum;

public class homepage_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		goodsdao gdao = goodsdao.getinstanse();
		paymentdao pdao = paymentdao.getinstanse();
		int nowPage = 1;
		if (request.getParameter("page") != null) {
			nowPage = Integer.valueOf(request.getParameter("page"));
		}
		pagenum pagemaker = new pagenum();
		pagemaker.setPage(nowPage);
		pagemaker.setCount(gdao.allCount());

		List<goodsdto> goodslist = gdao.goodslist(pagemaker.getNowPageStart(), pagemaker.getNowPageEnd());

		request.setAttribute("goodslist", goodslist);
		request.setAttribute("pagemaker", pagemaker);

		List<goodsdto> allgoods = gdao.allgoodslist();

		
		System.out.println(allgoods.size());
		request.setAttribute("allgoods", allgoods);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("miyao/main.jsp");
		dispatcher.forward(request, response);

	}

} 
