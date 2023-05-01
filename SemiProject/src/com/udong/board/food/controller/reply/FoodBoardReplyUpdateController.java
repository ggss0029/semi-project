package com.udong.board.food.controller.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.food.model.service.FoodBoardService;

/**
 * Servlet implementation class NewBoardReplyUpdateController
 */
@WebServlet("/foodUpdateReply.bo")
public class FoodBoardReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodBoardReplyUpdateController() {
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
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		String content = request.getParameter("content");
		
		int result = new FoodBoardService().foodUpdateReply(replyNo, content);
		
		response.setContentType("json/application; charset=UTF-8");
		response.getWriter().print(result);
		
	}

}
