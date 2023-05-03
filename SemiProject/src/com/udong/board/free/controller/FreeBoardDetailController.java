package com.udong.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.free.model.service.FreeBoardService;
import com.udong.board.free.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardDetailController
 */
@WebServlet("/FreeDetail.bo")
public class FreeBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		//寃뚯떆湲� 議고쉶�떆 議고쉶�닔 利앷� �떆�궎�뒗 硫붿냼�뱶 �옉�꽦
		int result = new BoardCommonService().increaseCount(boardNo);
		
		//議고쉶�닔媛� 利앷��릺�뿀�떎硫� 寃뚯떆湲� �젙蹂댁“�쉶 �븯湲�
		if(result>0) {
 			FreeBoard fb = new FreeBoardService().selectFree(boardNo);
			
			request.setAttribute("freeBoard", fb);
			
			request.getRequestDispatcher("views/board/free/freeDetailView.jsp").forward(request, response);
		//議고쉶�닔媛� 利앷�媛� �븞�릺�뿀�쓣�떆 �뿉�윭�럹�씠吏�濡� 蹂대궡踰꾨━湲�
		}else {
			request.setAttribute("errorMsg", "寃뚯떆湲� 議고쉶 �떎�뙣�븯���뒿�땲�떎..");
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
