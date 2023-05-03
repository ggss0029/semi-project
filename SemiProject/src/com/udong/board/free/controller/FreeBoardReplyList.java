package com.udong.board.free.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.free.model.vo.FreeReply;
import com.udong.board.free.model.service.FreeBoardService;

/**
 * Servlet implementation class FreeBoardReplyListController
 */
@WebServlet("/freeReplyList.bo")
public class FreeBoardReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardReplyList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		ArrayList<FreeReply> list = new FreeBoardService().selectReply(freeBoardNo);
		System.out.println(list);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
