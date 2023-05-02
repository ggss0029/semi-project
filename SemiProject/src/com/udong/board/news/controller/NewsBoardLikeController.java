package com.udong.board.news.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.news.model.service.NewsBoardService;

/**
 * Servlet implementation class NewsBoardLikeController
 */
@WebServlet("/newsLikeUpdate.do")
public class NewsBoardLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsBoardLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int newsBoardNo = Integer.parseInt(request.getParameter("boardNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new NewsBoardService().newsLike(newsBoardNo, userNo);
		
		response.getWriter().print(result);
			
	}

}
