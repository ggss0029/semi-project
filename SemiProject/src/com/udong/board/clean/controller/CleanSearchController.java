package com.udong.board.clean.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.clean.model.service.CleanService;
import com.udong.board.clean.model.vo.CleanBoard;

/**
 * Servlet implementation class CleanSearchController
 */
@WebServlet("/cleanCategoryList.bo")
public class CleanSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CleanSearchController() {
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
		request.setCharacterEncoding("UTF-8");
		String[] CCArray = request.getParameterValues("CC");
		
		ArrayList<CleanBoard> clist = new ArrayList<>();
		
		
			if(request.getParameterValues("CC") != null && CCArray.length > 0) {
				for(int i = 0; i < CCArray.length; i++) {
					clist.add(new CleanService().cleanAllCategoryList(CCArray[i]));
				}
			}else {
				clist = new CleanService().selectNocleanList();
			}
		
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(clist, response.getWriter());
	}

}
