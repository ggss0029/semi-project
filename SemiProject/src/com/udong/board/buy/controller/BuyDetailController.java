package com.udong.board.buy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.buy.model.service.BuyService;
import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.common.model.service.BoardCommonService;

/**
 * Servlet implementation class BuyDetailController
 */
@WebServlet("/buyDetail.bo")
public class BuyDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyDetailController() {
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
			BuyBoard buyb = new BuyService().selectBuy(boardNo);
			request.setAttribute("buyBoard", buyb);
			request.getRequestDispatcher("views/board/buy/buyDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "살림꿀팁 게시글 조회 실패");
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
