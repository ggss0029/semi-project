package com.udong.board.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.board.common.model.vo.Reply;
import com.udong.common.model.vo.PageInfo;

/**
 * Servlet implementation class TotalSearchControllerServlet
 */
@WebServlet("/totalSearch.bo")
public class TotalSearchControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TotalSearchControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; //현재 총 게시글의 개수 
		int currentPage; //현재 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대 개수
		int boardLimit; //한 페이지에서 보여질 게시글 최대 개수
		
		int maxPage; //가장 마지막 페이지가 몇인지 (총페이지의 개수)
		int startPage; //페이지 하단에 보여질 페이징바의 시작수
		int endPage; //페이지 하단에 보여질 페이징바의 끝 수 
		
		//listCount : 총 게시글 개수 구하기
		listCount = new BoardCommonService().selectListCount();
		
		//currentPage : 현재 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대개수 (목록 단위)
		pageLimit = 10;
		//boardLimit : 한 페이지에 보여질 게시글 개수 (게시글 단위)
		boardLimit = 10;
		//maxPage ; listCount와 boardLimit의 영향을 받는 수 
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit +1;
		
		endPage = startPage+pageLimit-1;

		if(endPage>maxPage) { 
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
//		request.getSession().setAttribute("pi",pi);
		
		String timeRange = request.getParameter("timeRange");
		int time = 730;
		
		if(timeRange.equals("1일")) {
			time=1;
		}else if(timeRange.equals("7일")) {
			time=7;
		}else if(timeRange.equals("1달")) {
			time=30;
		}else if(timeRange.equals("1년")) {
			time=365;
		}
		String detailRange = request.getParameter("detailRange");
		String searchInput = request.getParameter("searchInput");
		
		response.setContentType("json/application; charset=UTF-8");
		
		ArrayList<Object> total = new ArrayList<>();
		
		if(detailRange.equals("제목만")) {
			ArrayList<BoardCommon> list = new BoardCommonService().selectSearchListTitle(pi,time,searchInput);
			total.add(list);
		}else if(detailRange.contentEquals("게시글 내용")) {
			ArrayList<BoardCommon> list = new BoardCommonService().selectSearchListContent(pi,time,searchInput);
			total.add(list);
		}else if(detailRange.contentEquals("댓글")) {
			ArrayList<Reply> list = new BoardCommonService().selectSearchListReply(pi,time,searchInput);
			total.add(list);
			total.add("check");
			request.getSession().setAttribute("checkReply", 1);
		}else if(detailRange.contentEquals("작성자")) {
			ArrayList<BoardCommon> list = new BoardCommonService().selectSearchListWriter(pi,time,searchInput);
			System.out.println(list);
			total.add(list);
		}
		
		total.add(pi);
		
		
		new Gson().toJson(total, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
