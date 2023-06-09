package com.udong.member.controller.mypage;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.udong.board.common.model.vo.Attachment;
import com.udong.common.MyFileRenamePolicy;
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
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String address = request.getParameter("sample6_address") + request.getParameter("sample6_extraAddress")
						+ " " + request.getParameter("sample6_detailAddress") + "/" + request.getParameter("sample6_postcode");
		String introduction = request.getParameter("introduction");
	

//		Attachment at = null; //처음에는 null로 초기 화, 첨부파일이 있다면 객체 생성
//		
//		int maxSize = 10 * 1024 * 1024;
//		
//		//저장할  물리적인 경올 알아내기
//		String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_files/");
//		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
//		if(multiRequest.getOriginalFileName("upfile") != null) {
//			 address = multiRequest.getParameter("sample6_address") + multiRequest.getParameter("sample6_extraAddress")
//			+ " " + multiRequest.getParameter("sample6_detailAddress") + "-" + multiRequest.getParameter("sample6_postcode");
//		}
//		
		Member m = new Member(userId, userName, nickName, birthday, gender,  address, introduction);
		//System.out.println(m);
		
		Member updateMem = new MemberService().myInfoUpdate(m);
		
		if(updateMem != null) { //updateMem가 null이 아니면(조회 결곽가 있다면) - 성공
			request.getSession().setAttribute("alertMsg", "정보 수정되었습니다.");
			request.getSession().setAttribute("loginUser", updateMem); //동일 키 값으로 작성하면 갱신됨
			
			response.sendRedirect(request.getContextPath() + "/views/member/mypage/myInfo.jsp");
			
		}else { //실패시  에러페이지로 위임
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		//꺼내기
//		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
//		String userName = request.getParameter("userName");
//		String nickName = request.getParameter("nickName");
//		String birthday = request.getParameter("birthday");
//		String gender = request.getParameter("gender");
//		String email = request.getParameter("email");
//		String address = request.getParameter("address");
//		String introduction = request.getParameter("introduction");
	

//		Attachment at = null; //처음에는 null로 초기 화, 첨부파일이 있다면 객체 생성
//		
//		if(multiRequest.getOriginalFileName("upfile") != null) {
//			
//		}
//		
		//System.out.println(m);
		
		
		
	}

}
