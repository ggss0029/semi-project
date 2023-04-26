package com.udong.member.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.vo.Attachment;
import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class MyInfoUpdateController
 */
@WebServlet("/update.me")
public class MyInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoUpdateController() {
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
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		//꺼내기
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		String userPwd = ((Member)request.getSession().getAttribute("loginUser")).getUserPwd();
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String introduction = request.getParameter("introduction");
		
//		String updatePwd = request.getParameter("updatePwd");
		
		if(request.getParameter("updatePwd") == null) {
			String updatePwd = request.getParameter("updatePwd");
			Member updateMem2 = new MemberService().updatePwd(userId, updatePwd);
			
			if(updateMem2 == null) {
				request.setAttribute("errorMsg", "비밀번호 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} else {
				request.getSession().setAttribute("alertMsg", "비밀번호 수정 완료. 변경된 비밀번호로 재로그인해주세요.");
				request.getSession().setAttribute("loginUser", updateMem2);
			}
		}
	

//		Attachment at = null; //처음에는 null로 초기 화, 첨부파일이 있다면 객체 생성
//		
//		if(multiRequest.getOriginalFileName("upfile") != null) {
//			
//		}
//		
		Member m = new Member(userId, userName, nickName, userPwd, birthday, gender, email, address, introduction);
		System.out.println(m);
		
		Member updateMem = new MemberService().myInfoUpdate(m);
		
//		Member updateMem2 = new MemberService().updatePwd(userId, updatePwd);
		
		
			
		
		if(updateMem != null) { //updateMem가 null이 아니면(조회 결곽가 있다면) - 성공
			request.getSession().setAttribute("alertMsg", "정보 수정되었습니다.");
			request.getSession().setAttribute("loginUser", updateMem); //동일 키 값으로 작성하면 갱신됨
			
			
			response.sendRedirect(request.getHeader("Referer")); //로그인 하기 바로 전 페이지로 보내기
//			response.sendRedirect(request.getContextPath()+"/myInfo.me");
			
		}else { //실패시  에러페이지로 위임
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
