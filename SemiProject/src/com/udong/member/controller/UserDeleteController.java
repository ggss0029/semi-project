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
		//첫진입시 url 치고들어올때 화면을 띄우기위해서
		response.sendRedirect(request.getContextPath() + "/views/member/userDelete.jsp");
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
		
		if(result > 0) {
			//탈퇴에 업데이트된 값이있을때  메인페이지 화면으로 보내주기위함
			response.sendRedirect(request.getContextPath());
		}else {
			//첫진입시에는 실패했다고 말을할수없기때문에 
			//실패했을때는 다시 유저에게 회원탈퇴 실패했다고 알려줌과 그화면으로 다시 할수있게 하기위함
			request.setAttribute("flag", true);
			request.getRequestDispatcher("/views/member/userDelete.jsp").forward(request, response);
		}		
	}

		
		
	}

