package com.udong.member.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.common.model.vo.PageInfo;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class MyPostController
 */
@WebServlet("/myPost.me")
public class MyPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int listCount = new BoardCommonService().selectMyPostList(m.getUserNo()); // 게시글 총 개수
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
		ArrayList<BoardCommon> list = new BoardCommonService().selectMyPost(pi, m.getUserNo());
		
		request.setAttribute("myPostList", list);
		request.setAttribute("pageInfo", pi);
		request.getRequestDispatcher("views/member/mypage/myPostPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
