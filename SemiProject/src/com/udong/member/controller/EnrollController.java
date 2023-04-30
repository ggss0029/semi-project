package com.udong.member.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class EnrollController
 */
@WebServlet("/enroll.me")
public class EnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/enrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = "";
		String userPwd = "";
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String birthday = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("sample6_address") + request.getParameter("sample6_extraAddress")
						+ " " + request.getParameter("sample6_detailAddress") + "-" + request.getParameter("sample6_postcode");
		int loginType = 1;
		
		
		if(Integer.parseInt(request.getParameter("loginType"))==2) {
			Random r = new Random();
			int ran = r.nextInt(99999) + 10000;
			userId = "kakaoId"+ran;
			userPwd = "kakaoPwd"+(ran+1);
			loginType = 2;
		}else if(Integer.parseInt(request.getParameter("loginType"))==3){
			Random r = new Random();
			int ran = r.nextInt(99999) + 10000;
			userId = "naverId"+ran;
			userPwd = "naverPwd"+(ran+1);
			loginType = 3;
		}
		else{
			userId = request.getParameter("userId");
			userPwd = request.getParameter("userPwd");
		}
		Member m = new Member(userId, userPwd, userName, nickname, birthday, gender, email, address, loginType);
		int result = new MemberService().enrollMember(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원가입이 완료되었습니다.");
			response.sendRedirect(request.getContextPath());
		}
		else {
			request.setAttribute("errorMsg", "회원가입에 실패하셨습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
