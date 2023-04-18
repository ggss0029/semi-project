package com.udong.member.controller.email.pwd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;

/**
 * Servlet implementation class ResetPwdControllerServlet
 */
@WebServlet("/resetPwd.me")
public class ResetPwdControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwdControllerServlet() {
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
		String resetPwd = request.getParameter("resetPwd");
		String inputId = request.getParameter("hiddenId");
		
		System.out.println(resetPwd+" "+inputId);
		int result = new MemberService().changePwd(resetPwd,inputId);
		
		if(result>0) {
			System.out.println("비번 재설정 완료");
			response.sendRedirect("views/member/loginPage.jsp");
		}else {
			System.out.println("비번 재설정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
