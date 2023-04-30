package com.udong.board.food.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.food.model.service.FoodBoardService;
import com.udong.board.food.model.vo.FoodBoard;
import com.udong.common.model.vo.PageInfo;

/**
 * Servlet implementation class FoodCategoryListControllerServlet
 */
@WebServlet("/foodCategoryList.bo")
public class FoodCategoryListControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodCategoryListControllerServlet() {
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
		String[] FCArray = request.getParameterValues("FC");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String region = "";
		if(!city.equals("전체") && country.equals("전체")) {
			region = city;
		}else {
			region = city+" "+country;
		}
		ArrayList<FoodBoard> list = new ArrayList<>();

		if(city.equals("전체")) { //지역은 신경 안쓰고 아래 카테고리만 분류하면 됨
			if(request.getParameterValues("FC") !=null && FCArray.length>0) {
				for(int i=0; i<FCArray.length; i++) {
					list.add(new FoodBoardService().foodAllCategoryList(FCArray[i]));
				}
			}else {
				list = new FoodBoardService().selectNoCTFoodList();
			}
		}else {//지역,아래 카테고리 둘 다 분류해야함
			if(request.getParameterValues("FC") !=null && FCArray.length>0) {
				for(int i=0; i<FCArray.length; i++) {
					list.add(new FoodBoardService().foodRegionCategoryList(FCArray[i],region));
				}
			}else {
				list = new FoodBoardService().selectRegionFoodList(region);
			}
		}
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
	}

}
