package com.udong.board.news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.udong.board.news.model.service.NewsBoardService;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.model.vo.PageInfo;

/**
 * Servlet implementation class NewsSearchController
 */
@WebServlet("/newsCategoryList.bo")
public class NewsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int listCount = new NewsBoardService().newsSelectListCount();
////		System.out.println(listCount); //확인 완료
//		
//		//현재 페이지
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		
//		//pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 개수 (목록 단위)
//		int pageLimit =10;
//		
//		//boardLimit : 한 페이지에 보여질 게시물 개수 (게시글 단위) -- 20개로 지정
//		int boardLimit = 10;
//		
//		//maxpage : listCount 와 boardLimit의 영향을 받는 수 
//		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
//		
//		//startPage : 페이징바의 시작수
//		int startPage = (currentPage-1)/pageLimit * pageLimit +1;
//		
//		//endPage = startPage +pageLimit -1;
//		int endPage = startPage + pageLimit -1;
//		
//		if(endPage>maxPage) { //끝수가 총 페이지 수보다 크다면 해당 수를 총 페이지 수로 바꿔주기
//			endPage = maxPage;
//		}
//		
//		//페이지 정보들을 하나의 공간에 담아보기 (VO이용)
//		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] NCArray = request.getParameterValues("NC");
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String region = "";
		if(!city.equals("전체") && county.equals("전체")) {
			region = city;
		}else {
			region = city + " " + county;
		}
		ArrayList<NewsBoard> nlist = new ArrayList<>();
		
		if(city.equals("전체")) { //지역은 신경 안쓰고 카테고리만 분류하면 된다.
			if(request.getParameterValues("NC") != null && NCArray.length > 0) {
				for(int i = 0; i < NCArray.length; i++) {
					nlist.add(new NewsBoardService().newsAllCategoryList(NCArray[i]));
				}
			}else {
				nlist = new NewsBoardService().selectNoNewsList();
			}
		}else { //지역, 카테고리  둘 다 분류해야된다.
			if(request.getParameterValues("NC") != null && NCArray.length > 0) {
				for(int i = 0; i<NCArray.length; i++) {
					nlist.add(new NewsBoardService().newsRegionCategoryList(NCArray[i],region));
					System.out.println("지역 o ct o : "+nlist);
				}
			}else {
				nlist = new NewsBoardService().selectRegionNewsList(region);
				System.out.println("지역 o ct x : "+nlist);
			}
		}
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(nlist, response.getWriter());
	}

}
