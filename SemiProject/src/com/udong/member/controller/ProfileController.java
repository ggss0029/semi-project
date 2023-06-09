package com.udong.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet("/profile.me")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myNickname = request.getParameter("myNickname");
		String nickname = request.getParameter("nickname");
		int checkRec = Integer.parseInt(request.getParameter("checkRec"));
		
		int count = 0;
		if(checkRec == 1) { // 미추천
			count = new MemberService().recommend(myNickname, nickname);
		}
		else { // 이미 추천
			count = new MemberService().unrecommend(myNickname, nickname);
		}
		response.getWriter().print(count);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myNickname = request.getParameter("myNickname");
		String nickname = request.getParameter("nickname");
		Member m = new MemberService().profile(myNickname, nickname);
		
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(m, response.getWriter());
	}

}
