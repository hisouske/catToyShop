package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.goodsdao;
import dto.goodsdto;



/**
 * Servlet implementation class main2
 */
@WebServlet("/upload.do")
public class uploadservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public uploadservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");

		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
	
		String category = multi.getParameter("category");
		String name = multi.getParameter("goodsname");
		String quantity = multi.getParameter("goodsqtt");
		String price = multi.getParameter("goodsprice");
		String picurl = multi.getFilesystemName("goodspic");
		String dpicurl = multi.getFilesystemName("goodsdpic");
		String dtext = multi.getParameter("goodsdtext");
		if (picurl == null) {

		} else {
			System.out.println(picurl + " ok");
		}
		goodsdto dto = new goodsdto();
		dto.setDpic(dpicurl);
		dto.setDtext(dtext);
		dto.setCategory(category);
		dto.setName(name);
		dto.setPic(picurl);
		dto.setPrice(Integer.parseInt(price));
		dto.setQuantity(Integer.parseInt(quantity));
		
		
		System.out.println(category+"/"+name+"/"+picurl+"/"+price+"/"+quantity+"/"+dpicurl+"/"+dtext);
		goodsdao adao = goodsdao.getinstanse();
		adao.insertgoods(dto);
		response.sendRedirect("main.do");
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("main.do");
//		dispatcher.forward(request, response);
	}


}
