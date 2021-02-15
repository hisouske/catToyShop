package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.cartdao;
import dao.goodsdao;
import dto.cartdto;
import dto.goodsdto;

public class cartpage_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id  =request.getParameter("id");
		
		goodsdao gdao = goodsdao.getinstanse();
		cartdao cdao = cartdao.getinstanse();
		
		System.out.println(id);
		List<cartdto> cartlist = cdao.cartlist(id);
		List<goodsdto> goodslist = new ArrayList<goodsdto>();
		
		System.out.println(cartlist.size());
		for (int i = 0; i < cartlist.size(); i++) {
			goodsdto gdto = gdao.onegoods(cartlist.get(i).getGcode());
			gdto.setQuantity(cartlist.get(i).getQtt());
			goodslist.add(gdto);
		}

		request.setAttribute("goodslist", goodslist);

		RequestDispatcher dispatcher = request.getRequestDispatcher("miyao/cart.jsp");
		dispatcher.forward(request, response);

	}

}
