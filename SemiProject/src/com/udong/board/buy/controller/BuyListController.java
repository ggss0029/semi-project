package com.udong.board.buy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.buy.model.service.BuyService;
import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.clean.model.service.CleanService;
import com.udong.common.model.vo.PageInfo;

/**
 * Servlet implementation class BuyListController
 */
@WebServlet("/buyList.bo")
public class BuyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount = new BuyService().buySelectListCount();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageLimit =10;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage-1)/pageLimit * pageLimit +1;
		int endPage = startPage + pageLimit -1;
		
		if(endPage>maxPage) { //끝수가 총 페이지 수보다 크다면 해당 수를 총 페이지 수로 바꿔주기
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//buy(같이 사요) 전체 리스트를 조회해와서 request에 담아 위임.
		ArrayList<BuyBoard> blist = new BuyService().buySelectList(pi);
		//리스트 목록 가지고 와서 출력문으로 출력해보기
//		System.out.println(clist); //콘솔에 null 뜸
		
		request.setAttribute("blist", blist);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/board/buy/buyListView.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
