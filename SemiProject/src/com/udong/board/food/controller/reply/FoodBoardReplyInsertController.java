package com.udong.board.food.controller.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.food.model.service.FoodBoardService;
import com.udong.board.food.model.vo.FoodReply;

/**
 * Servlet implementation class NewsBoardReplyInsertController
 */
@WebServlet("/foodInsertReply.bo")
public class FoodBoardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodBoardReplyInsertController() {
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
		int boardNo = Integer.parseInt(request.getParameter("foodBoardNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		FoodReply fr = new FoodReply();
		fr.setReplyContent(content);
		fr.setRefBno(boardNo);
		
		int result = new FoodBoardService().foodInsertReply(fr,userNo);
		
		response.getWriter().print(result);
		
	}

}
