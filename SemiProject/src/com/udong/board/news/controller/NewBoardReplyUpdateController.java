package com.udong.board.news.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.news.model.service.NewsBoardService;

/**
 * Servlet implementation class NewBoardReplyUpdateController
 */
@WebServlet("/newsUpdateReply.bo")
public class NewBoardReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBoardReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int newsReplyNo = Integer.parseInt(request.getParameter("replyNo"));
		String content = request.getParameter("content");
		
		int result = new NewsBoardService().newsUpdateReply(newsReplyNo, content);
		System.out.println("결과:"+result);
		
		response.setContentType("json/application; charset=UTF-8");
		response.getWriter().print(result);
		
	}

}
