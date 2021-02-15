package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.cartdao;
import dao.paymentdao;
import dao.pnumdao;
import dto.paymentdto;

public class cartpay_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String[] clist = request.getParameterValues("clist");
		String[] gcode = request.getParameterValues("gcode");
		String[] qttlist = request.getParameterValues("qtt");


		pnumdao pndao = pnumdao.getinstanse();
		cartdao cdao = cartdao.getinstanse();

		int pn = pndao.pnum();
		pn++;
		String paynum = "ordernum" + (pn);

		// 실제 제품 등록 // w

		paymentdao pdao = paymentdao.getinstanse();

		if (clist != null) {
			for (int i = 0; i < clist.length; i++) {
				paymentdto dto = new paymentdto();
				dto.setOrdernum(paynum);
				dto.setGcode(Integer.parseInt(gcode[Integer.parseInt(clist[i])]));
				dto.setId(id);
				dto.setQtt(Integer.parseInt(qttlist[Integer.parseInt(clist[i])]));
				pdao.insertpayment(dto);
				cdao.delcart(Integer.parseInt(gcode[Integer.parseInt(clist[i])]), id);
			}
			pndao.insertpnum(paynum);
			RequestDispatcher dispatcher = request.getRequestDispatcher("cart.do?ccommand=paylist&id=" + id);
			dispatcher.forward(request, response);
		}else {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("cart.do?ccommand=cartpage&id=" + id);
			dispatcher.forward(request, response);
		}

	}

}
