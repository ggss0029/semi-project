package com.udong.board.give.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.common.model.vo.Attachment;
import com.udong.board.food.model.service.FoodBoardService;
import com.udong.board.give.model.service.GiveBoardService;
import com.udong.board.give.model.vo.GiveBoard;

/**
 * Servlet implementation class FoodDetailControllerServlet
 */
@WebServlet("/giveDetail.bo")
public class GiveDetailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiveDetailControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardCommonService().increaseCount(boardNo);
		
		if(result>0) { 
			GiveBoard gb = new GiveBoardService().selectGiveBoardDetail(boardNo);
			ArrayList<Attachment> alist = new FoodBoardService().selectAttachmentList(boardNo);
		
			request.setAttribute("gb", gb);
			request.setAttribute("alist", alist);
			
			request.getRequestDispatcher("views/board/give/giveDetailView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "동네 맛집 게시글 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
