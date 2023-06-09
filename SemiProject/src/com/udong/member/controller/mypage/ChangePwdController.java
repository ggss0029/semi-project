package com.udong.member.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class ChangePwdController
 */
@WebServlet("/updatePwd.me")
public class ChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdController() {
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
		
		//hidden 타입으로 숨겻 보낸 데이터 꺼내보기
		
		//session 담겨있는 loginUser에서 id값 꺼내기
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String updatePwd = request.getParameter("updatePwd");
		//System.out.println(updatePwd);
		
		Member updateMem = new MemberService().updatePwd(userId, updatePwd);
		
		if(updateMem == null) { //수정 실패
			request.setAttribute("errorMsg", "비밀번호 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "비밀번호 수정 완료.");
			request.getSession().setAttribute("loginUser", updateMem);
			
//			//재요청
			response.sendRedirect("views/member/mypage/myInfo.jsp");
		}
	}

}
