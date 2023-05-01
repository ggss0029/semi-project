package com.udong.board.give.controller.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.give.model.service.GiveBoardService;
import com.udong.board.give.model.vo.GiveReply;

/**
 * Servlet implementation class NewsBoardReplyInsertController
 */
@WebServlet("/giveInsertReply.bo")
public class GiveBoardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiveBoardReplyInsertController() {
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
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("giveBoardNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		GiveReply gr = new GiveReply();
		gr.setReplyContent(content);
		gr.setRefBno(boardNo);
		
		int result = new GiveBoardService().giveInsertReply(gr,userNo);
		
		response.getWriter().print(result);
		
	}

}
