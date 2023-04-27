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
 * Servlet implementation class NewsSearchController
 */
@WebServlet("/newsSearch.bo")
public class NewsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String region = request.getParameter("city") + request.getParameter("count");
		String category = request.getParameter("category");
		
		ArrayList<NewsBoard> nlist = new NewsBoardService().newsBoardSearch(region, category);
	
		request.setAttribute("nlist", nlist);
		request.getRequestDispatcher("views/board/clean/cleanListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
