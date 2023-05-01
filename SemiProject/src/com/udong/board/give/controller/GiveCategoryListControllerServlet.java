package com.udong.board.give.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.give.model.service.GiveBoardService;
import com.udong.board.give.model.vo.GiveBoard;

/**
 * Servlet implementation class FoodCategoryListControllerServlet
 */
@WebServlet("/giveCategoryList.bo")
public class GiveCategoryListControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiveCategoryListControllerServlet() {
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
		String[] GCArray = request.getParameterValues("GC");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String region = "";
		if(!city.equals("전체") && country.equals("전체")) {
			region = city;
		}else {
			region = city+" "+country;
		}
		ArrayList<GiveBoard> list = new ArrayList<>();

		if(city.equals("전체")) { //지역은 신경 안쓰고 아래 카테고리만 분류하면 됨
			if(request.getParameterValues("GC") !=null && GCArray.length>0) {
				for(int i=0; i<GCArray.length; i++) {
					list.add(new GiveBoardService().giveAllCategoryList(GCArray[i]));
				}
			}else {
				list = new GiveBoardService().selectNoCTGiveList();
			}
		}else {//지역,아래 카테고리 둘 다 분류해야함
			if(request.getParameterValues("GC") !=null && GCArray.length>0) {
				for(int i=0; i<GCArray.length; i++) {
					list.add(new GiveBoardService().giveRegionCategoryList(GCArray[i],region));
				}
			}else {
				list = new GiveBoardService().selectRegionGiveList(region);
			}
		}
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
	}

}
