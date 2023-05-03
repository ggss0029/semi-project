package com.udong.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.free.model.vo.FreeReply;
import com.udong.board.free.model.service.FreeBoardService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class FreeBoardReplyListController
 */
@WebServlet("/freeReplyInsert.bo")
public class FreeBoardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardReplyInsertController() {
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
		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		FreeReply r = new FreeReply();
		r.setReplyContent(content);
		r.setRefBno(freeBoardNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new FreeBoardService().FreeInsertReply(r);
		
		response.getWriter().print(result);
		
	}

}
