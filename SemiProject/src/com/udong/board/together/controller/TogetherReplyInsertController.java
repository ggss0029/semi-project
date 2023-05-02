package com.udong.board.together.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.together.model.service.TogetherBoardService;
import com.udong.board.together.model.vo.TogetherReply;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class TogetherReplyInsertController
 */
@WebServlet("/togetherInsertReply.bo")
public class TogetherReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherReplyInsertController() {
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
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		TogetherReply r = new TogetherReply();
		r.setReplyContent(content);
		r.setRefBno(boardNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new TogetherBoardService().togetherInsertReply(r);
		
		response.getWriter().print(result);
	}

}
