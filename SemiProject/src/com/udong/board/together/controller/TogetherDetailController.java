package com.udong.board.together.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.together.model.service.TogetherBoardService;
import com.udong.board.together.model.vo.TogetherBoard;

/**
 * Servlet implementation class TogetherDetailController
 */
@WebServlet("/togetherDetail.bo")
public class TogetherDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardCommonService().increaseCount(boardNo);
		
		if(result >0) {
			TogetherBoard tb = new TogetherBoardService().selectTogether(boardNo);
			request.setAttribute("togetherBoard", tb);
			request.getRequestDispatcher("views/board/together/togetherDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "같이 해요 게시글 조회 실패");
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
