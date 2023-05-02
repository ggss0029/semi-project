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
import com.udong.board.buy.model.vo.BuyBoard;

/**
 * Servlet implementation class BuySearchController
 */
@WebServlet("/buyCategoryList.bo")
public class BuySearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuySearchController() {
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
		String[] BCArray = request.getParameterValues("BC");
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String region = "";
		if(!city.equals("전체") && county.equals("전체")) {
			region = city;
		}else {
			region = city + " " + county;
		}
		ArrayList<BuyBoard> blist = new ArrayList<>();
		
		if(city.equals("전체")) { //지역은 신경 안쓰고 카테고리만 분류하면 된다.
			if(request.getParameterValues("BC") != null && BCArray.length > 0) {
				for(int i = 0; i < BCArray.length; i++) {
					blist.add(new BuyService().buyAllCategoryList(BCArray[i]));
				}
			}else {
				blist = new BuyService().selectNoBuyList();
			}
		}else { //지역, 카테고리  둘 다 분류해야된다.
			if(request.getParameterValues("BC") != null && BCArray.length > 0) {
				for(int i = 0; i<BCArray.length; i++) {
					blist.add(new BuyService().buyRegionCategoryList(BCArray[i],region));
					System.out.println("지역 o ct o : "+blist);
				}
			}else {
				blist = new BuyService().selectRegionBuyList(region);
				System.out.println("지역 o ct x : "+blist);
			}
		}
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(blist, response.getWriter());
		}

}
