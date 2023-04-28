package com.udong.board.news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.news.model.service.NewsBoardService;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.model.vo.PageInfo;

/**
 * Servlet implementation class NewsBoardListController
 */
@WebServlet("/newsList.bo")
public class NewsBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 처리
		int listCount; //현재 총 게시글의 개수
		int currentPage; // 현재 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대 개수
		int boardLimit; //한 페이지에서 보여질 게시글 최대 개수
		
		int maxPage; //가장 마지막 페이지가 몇인지 (총 페이지의 개수)
		int startPage; //페이지 하단에 보여질 페이징바의 시작수
		int endPage; //페이지 하단에  보여질 페이징 바의 끝 수 
		
		//listCount : 총 게시글 개수 구하기
		listCount = new NewsBoardService().newsSelectListCount();
//		System.out.println(listCount); //확인 완료
		
		//현재 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 개수 (목록 단위)
		pageLimit =10;
		
		//boardLimit : 한 페이지에 보여질 게시물 개수 (게시글 단위) -- 20개로 지정
		boardLimit = 10;
		
		//maxpage : listCount 와 boardLimit의 영향을 받는 수 
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		//startPage : 페이징바의 시작수
		startPage = (currentPage-1)/pageLimit * pageLimit +1;
		
		//endPage = startPage +pageLimit -1;
		endPage = startPage + pageLimit -1;
		
		if(endPage>maxPage) { //끝수가 총 페이지 수보다 크다면 해당 수를 총 페이지 수로 바꿔주기
			endPage = maxPage;
		}
		
		//페이지 정보들을 하나의 공간에 담아보기 (VO이용)
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		System.out.println(pi);
		
		//news(동네소식) 전체 리스트를 조회해와서 request에 담아 위임.
		ArrayList<NewsBoard> nlist = new NewsBoardService().newsSelectList(pi);
		//리스트 목록 가지고 와서 출력문으로 출력해보기
//		System.out.println(nlist); //콘솔에 null 뜸
		
		request.setAttribute("nlist", nlist);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/board/news/newsListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
