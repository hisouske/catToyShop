package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;
import dao.memdao;

public class login_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user-id");
		String pw = request.getParameter("user-pw");

		memdao dao = memdao.getinstanse();
		String logincf = dao.loginmem(id, pw);
		if (logincf != null) {
			request.setAttribute("username", logincf);
			request.setAttribute("id", id);
			
			new homepage_action().execute(request, response);
			
		} else {
			new loginpage_action().execute(request, response);
			
	

		}
	}

}
