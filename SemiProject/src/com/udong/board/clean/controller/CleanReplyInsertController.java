package com.udong.board.clean.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.clean.model.service.CleanService;
import com.udong.board.news.model.vo.NewsReply;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class CleanReplyInsertController
 */
@WebServlet("/cleanInsertReply.bo")
public class CleanReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CleanReplyInsertController() {
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
		int cleanBoardNo = Integer.parseInt(request.getParameter("cleanBoardNo"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		NewsReply r = new NewsReply();
		r.setReplyContent(content);
		r.setRefBno(cleanBoardNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new CleanService().cleanInsertReply(r);
		
		response.getWriter().print(result);
	}

}
