package com.udong.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.free.model.service.FreeBoardService;

/**
 * Servlet implementation class FreeBoardReplyUpdateController
 */
@WebServlet("/freeUpdateReply.bo")
public class FreeBoardReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//�뙎湲� 踰덊샇 議고쉶 �븯�뿬 �닔�젙�븯湲�
	int freeReplyNo = Integer.parseInt(request.getParameter("replyNo"));
	String content = request.getParameter("content");
	
	int result = new FreeBoardService().freeUpdateReply(freeReplyNo,content);
	System.out.println("寃곌낵:"+result);
	
	response.setContentType("json/application; charset=UTF-8");
	response.getWriter().print(result);
	
	
	
	
	}

}
