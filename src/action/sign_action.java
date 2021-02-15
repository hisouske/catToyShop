package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.memdao;
import dto.memdto;

public class sign_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("sign_action");
		memdto dto = new memdto();
		dto.setId(request.getParameter("user-id"));
		dto.setPw(request.getParameter("user-pw"));
		dto.setName(request.getParameter("user-name"));
		dto.setEmail(request.getParameter("user-email"));
		memdao dao = memdao.getinstanse();
		dao.insertmem(dto);
		new homepage_action().execute(request, response);
	
	}

}
