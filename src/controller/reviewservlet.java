package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reviewservlet
 */
@WebServlet("/review.do")
public class reviewservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public reviewservlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println(1);
		String rcommand = request.getParameter("rcommand");
		System.out.println("rmain : " + rcommand);
		
		
		actionfactory af = actionfactory.getinstanse();
		controller.action action = af.reviewaction(rcommand);
		if (action != null) {
			action.execute(request, response);
		} 
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
