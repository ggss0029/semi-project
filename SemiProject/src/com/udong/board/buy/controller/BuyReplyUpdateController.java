package com.udong.board.buy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.buy.model.service.BuyService;

/**
 * Servlet implementation class BuyReplyUpdateController
 */
@WebServlet("/buyUpdateReply.bo")
public class BuyReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyReplyUpdateController() {
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
		int buyBoardNo = Integer.parseInt(request.getParameter("replyNo"));
		String content = request.getParameter("content");
		
		int result = new BuyService().buyUpdateReply(buyBoardNo, content);
		//System.out.println("결과:"+result);
		
		response.setContentType("json/application; charset=UTF-8");
		response.getWriter().print(result);
	}

}
