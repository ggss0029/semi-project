package com.udong.member.controller.kakao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class KakaoLoginControllerServlet
 */
@WebServlet("/kakao-login.me")
public class KakaoLoginControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginControllerServlet() {
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
		
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		String ageRange = request.getParameter("ageRange");
		String birthday = request.getParameter("birthday");
		
		System.out.println("카카오 : "+email+" "+nickname+" "+gender+" "+ageRange+" "+birthday);
		//카카오 : hd9810@naver.com 성 male 20~29 1216
		
		Member m = new Member();
		m.setEmail(email);
		m.setLoginType(2);
		
		Member kakaoLoginUser = new MemberService().checkKakao(m);
		
		if(kakaoLoginUser!=null) { //db에 등록된 정보가 있는 경우 result==1
			request.getSession().setAttribute("loginUser", kakaoLoginUser);
			response.sendRedirect("views/member/test.jsp");
		}else { // 첫 카카오 로그인
			request.getSession().setAttribute("alertMsg","등록된 회원 정보가 없습니다. 회원 가입으로 이동합니다.");
			request.getRequestDispatcher("views/member/test.jsp").forward(request, response);
		}
		
	}

}
