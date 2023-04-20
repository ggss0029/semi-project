package com.udong.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class LoginControllerServlet
 */


@WebServlet("/MemberList.me")
public class MemberListControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		
		
		ArrayList<Member> list = new MemberService().getMemberList(page , userId , email);
		Integer count = userId == null && email == null ? new MemberService().getMemberListCount() : 1;
		int totalPage = count % 7 == 0 ? count / 7 : (count / 7) + 1;
		int currentPage = page == null ? 1 : Integer.parseInt(page);
		int minPage = (int) Math.floor((double)currentPage / 10) * 10 + 1;
		int maxPage = (int) Math.ceil((double)currentPage / 10) * 10 >= totalPage ? totalPage : (int) Math.ceil(currentPage / 10) * 10; 
		 
		request.setAttribute("MemberList", list);
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("minPage", minPage);
		request.setAttribute("maxPage", maxPage);
		
		request.getRequestDispatcher("views/admin/memberList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
