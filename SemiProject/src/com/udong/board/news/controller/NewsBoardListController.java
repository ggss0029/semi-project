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
		//news(동네소식) 전체 리스트를 조회해와서 request에 담아 위임.
		ArrayList<NewsBoard> nlist = new NewsBoardService().newsSelectList();
		//리스트 목록 가지고 와서 출력문으로 출력해보기
		System.out.println(nlist); //콘솔에 null 뜸
		
		request.setAttribute("nlist", nlist);
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
