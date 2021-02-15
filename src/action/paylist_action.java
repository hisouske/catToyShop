package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.goodsdao;
import dao.paymentdao;
import dto.goodsdto;
import dto.paymentdto;

public class paylist_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");

		paymentdao pdao = paymentdao.getinstanse();
		goodsdao gdao = goodsdao.getinstanse();
		List<List<paymentdto>> paylist = pdao.paylist(id);
		ArrayList<String> goodsname = new ArrayList<>();

		for (int i = 0; i < paylist.size(); i++) {
			List<paymentdto> temppaylist = paylist.get(i);
			System.out.println("paylist_action temppaylist.size() : "+temppaylist.size());
			for (int j = 0; j < temppaylist.size(); j++) {
				String date = temppaylist.get(j).getTime();
				StringTokenizer a = new StringTokenizer(date, " ");
				temppaylist.get(j).setTime(a.nextToken());
				goodsdto gd = gdao.onegoods(temppaylist.get(j).getGcode());
				String gn = gd.getName();
				goodsname.add(gn);
			}
		}
		
		request.setAttribute("goodsname", goodsname);
		request.setAttribute("paylist", paylist);

		RequestDispatcher dispatcher = request.getRequestDispatcher("miyao/paylist.jsp");
		dispatcher.forward(request, response);

	}

}
