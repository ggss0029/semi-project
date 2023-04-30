package com.udong.board.buy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.buy.model.service.BuyService;
import com.udong.board.buy.model.vo.BuyReply;

/**
 * Servlet implementation class BuyReplyListController
 */
@WebServlet("/buySelectReplyList.bo")
public class BuyReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int buyBoardNo = Integer.parseInt(request.getParameter("buyBoardNo"));
		
		ArrayList<BuyReply> blist = new BuyService().buySelectReply(buyBoardNo);
	
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(blist, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
