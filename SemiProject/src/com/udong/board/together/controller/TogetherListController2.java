package com.udong.board.together.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.together.model.service.TogetherBoardService;
import com.udong.board.together.model.vo.TogetherBoard;
import com.udong.common.model.vo.PageInfo;

/**
 * Servlet implementation class TogetherListController2
 */
@WebServlet("/togetherList2.bo")
public class TogetherListController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherListController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] selectedCategory = request.getParameterValues("check");
		
		int listCount = 0;
		for(String s : selectedCategory) {
			listCount += new TogetherBoardService().selectTogetherListCount(s);
		}
		int currentPage = Integer.parseInt(request.getParameter("cPage")); // 현재 페이지
		int pageLimit = 10; // 페이징바의 최대 페이지 개수
		int boardLimit = 10; // 한 페이지 최대 게시글 수
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); // 가장 마지막 페이지
		int startPage = 1 + pageLimit*((currentPage-1)/pageLimit); // 페이징바의 시작 수
		int endPage = startPage + (pageLimit-1); // 페이징바의 끝 수
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<TogetherBoard> list = new TogetherBoardService().selectTogetherList(pi, selectedCategory);
		
		//new TogetherBoardService().selectTogetherList(pi);
		
		request.setAttribute("check", selectedCategory);
		request.setAttribute("togetherBoardList", list);
		request.setAttribute("pageInfo", pi);
		request.getRequestDispatcher("views/board/together/togetherListView2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
