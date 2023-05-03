package com.udong.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class BlackListController
 */
@WebServlet("/BlackList.me")
public class BlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		ArrayList<Member> list = new MemberService().getBlackList(page);
		Integer count = new MemberService().getBlackListCount();
		int totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
		int currentPage = page == null ? 1 : Integer.parseInt(page);
		int minPage = (int) Math.floor((double)currentPage / 10) * 10 + 1;
		int maxPage = (int) Math.ceil((double)currentPage / 10) * 10 >= totalPage ? totalPage : (int) Math.ceil(currentPage / 10) * 10; 
		 
		request.setAttribute("BlackList", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("minPage", minPage);
		request.setAttribute("maxPage", maxPage);
		
		request.getRequestDispatcher("views/admin/blackListView.jsp").forward(request, response);

		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
