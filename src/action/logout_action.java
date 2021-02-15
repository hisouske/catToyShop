package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action;

public class logout_action implements action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String out = "logout";
		request.setAttribute("logout", out);
		System.out.println(request.getAttribute("logout"));
		new homepage_action().execute(request, response);
		
	}

}
