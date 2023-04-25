package com.udong.member.controller;

import java.io.IOException;

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
@WebServlet("/login.me")
public class LoginControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControllerServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		String inputId = request.getParameter("inputId");
		String inputPwd = request.getParameter("inputPwd");
		
		int result = new MemberService().checkInfo(inputId,inputPwd); // 0 : 아이디 틀림 1: 비번 틀림 2: 로그인 가능
		
		Member loginUser = new MemberService().loginMember(inputId,inputPwd); //inputId에 대한 멤버 정보가 다 담겨있는 객체
		System.out.println(loginUser);
		
		request.getSession().setAttribute("result",result);
		if(result==2) { //로그인 가능
			 request.getSession().setAttribute("loginUser",loginUser);
			 request.getSession().removeAttribute("count");
			 response.sendRedirect(request.getContextPath());
		}else if(result==1) { //비번 틀림
			request.getSession().setAttribute("loginError","비밀번호를 "+((int)request.getSession().getAttribute("count")+1)+"회 잘못 입력하셨습니다. 다시 시도해주세요.");
			request.getSession().setAttribute("count", (int)request.getSession().getAttribute("count")+1);
			response.sendRedirect(request.getHeader("Referer")); //로그인 하기 바로 전 페이지로 보내기
		}else { // 아이디 틀림
			request.getSession().setAttribute("loginError","아이디를 잘못 입력하셨습니다. 다시 시도해주세요.");
			response.sendRedirect(request.getHeader("Referer")); //로그인 하기 바로 전 페이지로 보내기

		}
	}
}
