package com.udong.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.free.model.service.FreeBoardService;
import com.udong.board.free.model.vo.FreeAttachment;
import com.udong.board.free.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardUpdateController
 */
@WebServlet("/freeUpdate.bo")
public class FreeBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//게시글 번호 조회 하여 수정페이지로 전달하기
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	FreeBoardService freeService = new FreeBoardService();
	
	FreeBoard fb = freeService.selectFreeBoard(bno);
	FreeAttachment fat = freeService.selectFreeAttachment(bno);
	
	request.setAttribute("fb",fb);
	request.setAttribute("fat",fat);
	
	request.getRequestDispatcher("views/board/free/freeUpdateBoard.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
