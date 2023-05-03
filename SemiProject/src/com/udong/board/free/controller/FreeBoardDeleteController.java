package com.udong.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.free.model.service.FreeBoardService;



/**
 * Servlet implementation class FredBoardDeleteController
 */
@WebServlet("/FreeDelete.bo")
public class FreeBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new FreeBoardService().deleteBoard(bno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "寃뚯떆湲� �궘�젣 �셿猷�");
			response.sendRedirect(request.getContextPath()+"/FreeBoardList.bo?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "寃뚯떆湲� �궘�젣 �떎�뙣");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
