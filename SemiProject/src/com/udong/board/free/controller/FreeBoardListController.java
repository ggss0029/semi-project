package com.udong.board.free.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.free.model.service.FreeBoardService;
import com.udong.board.free.model.vo.FreeBoard;
import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class FreeBoardListController
 */
@WebServlet("/FreeBoardList.bo")
public class FreeBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		NO.	제목	작성자	작성일	조회	추천수
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		ArrayList<FreeBoard> list = new FreeBoardService().getBoardList(page ,boardTitle,boardContent, boardContent);
		//Count = 검색한 게시물 수
		//검색한 게시글은 중복이 될수있고 페이징 처리를 해줘야 하기때문에 카운트를 가져와줘야함
		Integer count =  new FreeBoardService().getboardListCount(boardTitle,boardContent);
		int totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
		int currentPage = page == null ? 1 : Integer.parseInt(page);
		int minPage = (int) Math.floor((double)currentPage / 10) * 10 + 1;
		int maxPage = (int) Math.ceil((double)currentPage / 10) * 10 >= totalPage ? totalPage : (int) Math.ceil(currentPage / 10) * 10; 
		 
		request.setAttribute("FreeList", list);
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("minPage", minPage);
		request.setAttribute("maxPage", maxPage);
		
		request.getRequestDispatcher("views/board/free/freeListView.jsp").forward(request, response);
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
