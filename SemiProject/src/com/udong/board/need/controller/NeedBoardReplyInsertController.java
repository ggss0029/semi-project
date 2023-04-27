package com.udong.board.need.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.need.model.NeedBoardService;
import com.udong.board.need.vo.NeedReply;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class NeedBoardReplyListController
 */
@WebServlet("/NeedBoardReplyInsert.me")
public class NeedBoardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NeedBoardReplyInsertController() {
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
		int needBoardNo = Integer.parseInt(request.getParameter("bno"));
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		NeedReply r = new NeedReply();
		r.setReplyContent(content);
		r.setRefBno(needBoardNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new NeedBoardService().needInsertReply(r);
		
		response.getWriter().print(result);
		
	}

}
