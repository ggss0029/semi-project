package com.udong.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.udong.member.model.service.MemberService;

/**
 * Servlet implementation class UserDelete
 */
@WebServlet("/UserDelete.me")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteController() {
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
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().userDelete(userId,userPwd);
		
		HttpSession session = request.getSession();
		
		request.getRequestDispatcher("views/member/userDelete.jsp").forward(request, response);
		
		if(result>0) {
			session.setAttribute("alertMsg", "삭제하시겠습니까?.");
			session.removeAttribute("loginUser"); //로그인된 회원정보 삭제
			response.sendRedirect(request.getContextPath()+"/udong"); //메인화면으로 재요청
		}
	}

		
		
	}

