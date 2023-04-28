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
		
		int listCount; 
		
		String detailRange = request.getParameter("detailRange");
		String searchInput = request.getParameter("searchInput");
		
		response.setContentType("json/application; charset=UTF-8");
		
		ArrayList<Object> total = new ArrayList<>();
		
		total.add(time);
		total.add(searchInput);
		total.add(detailRange);
		
		if(detailRange.equals("제목만")) {
			
			listCount = new BoardCommonService().selectListCountTitleTime(time,searchInput);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int pageLimit = 10;
			int boardLimit = 10;
			int maxPage = (int)Math.ceil((double)listCount/boardLimit);
			int startPage = (currentPage-1)/pageLimit * pageLimit +1;
			int endPage = startPage+pageLimit-1;
			
			if(endPage>maxPage) { 
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
			
			ArrayList<BoardCommon> list = new BoardCommonService().selectSearchListTitle(pi,time,searchInput);
			total.add(pi);
			total.add(list);
		}else if(detailRange.contentEquals("게시글 내용")) {
			
			listCount = new BoardCommonService().selectListCountContentTime(time,searchInput);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int pageLimit = 10;
			int boardLimit = 10;
			int maxPage = (int)Math.ceil((double)listCount/boardLimit);
			int startPage = (currentPage-1)/pageLimit * pageLimit +1;
			int endPage = startPage+pageLimit-1;
			
			if(endPage>maxPage) { 
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
			ArrayList<BoardCommon> list = new BoardCommonService().selectSearchListContent(pi,time,searchInput);
			total.add(pi);
			total.add(list);
			total.add("content");
		}else if(detailRange.contentEquals("댓글")) {
			
			listCount = new BoardCommonService().selectListCountReplyTime(time,searchInput);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int pageLimit = 10;
			int boardLimit = 10;
			int maxPage = (int)Math.ceil((double)listCount/boardLimit);
			int startPage = (currentPage-1)/pageLimit * pageLimit +1;
			int endPage = startPage+pageLimit-1;
			
			if(endPage>maxPage) { 
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
			ArrayList<Reply> list = new BoardCommonService().selectSearchListReply(pi,time,searchInput);
			total.add(pi);
			total.add(list);
			total.add("reply");
			request.getSession().setAttribute("checkReply", 1);
		}else if(detailRange.contentEquals("작성자")) {
			
			listCount = new BoardCommonService().selectListCountWriterTime(time,searchInput);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int pageLimit = 10;
			int boardLimit = 10;
			int maxPage = (int)Math.ceil((double)listCount/boardLimit);
			int startPage = (currentPage-1)/pageLimit * pageLimit +1;
			int endPage = startPage+pageLimit-1;
			
			if(endPage>maxPage) { 
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
			ArrayList<BoardCommon> list = new BoardCommonService().selectSearchListWriter(pi,time,searchInput);
			total.add(pi);
			total.add(list);
		}
		
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
