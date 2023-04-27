package com.udong.member.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;

/**
 * Servlet implementation class MyCheckNickController
 */
@WebServlet("/myCheckNick.me")
public class MyCheckNickController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCheckNickController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkNick = request.getParameter("inputNickname");
//		System.out.println(checkId); --확인용
		
		int count = new MemberService().checkId(checkNick);
		
		if(count>0) { //조회가 되었다(중복임) NNNNN
			response.getWriter().print("NNNNN");
		}else { //조회가 되지 않음 (중복아님) - 사용가능 NNNNY
			response.getWriter().print("NNNNY");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
