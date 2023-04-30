package com.udong.board.buy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.buy.model.service.BuyService;
import com.udong.board.buy.model.vo.BuyReply;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class BuyReplyInsertController
 */
@WebServlet("/buyInsertReply.bo")
public class BuyReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyReplyInsertController() {
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
		int buyBoardNo = Integer.parseInt(request.getParameter("buyBoardNo"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		BuyReply r = new BuyReply();
		r.setReplyContent(content);
		r.setRefBno(buyBoardNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new BuyService().buyInsertReply(r);
		
		response.getWriter().print(result);
	}

}
