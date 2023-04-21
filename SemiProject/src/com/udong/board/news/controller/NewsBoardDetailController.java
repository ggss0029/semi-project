package com.udong.board.news.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.news.model.service.NewsBoardService;
import com.udong.board.news.model.vo.NewsAttachment;
import com.udong.board.news.model.vo.NewsBoard;

/**
 * Servlet implementation class NewsBoardDetailController
 */
@WebServlet("/newsDetail.bo")
public class NewsBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//동네소식 하나의 정보를 조회해와서 request에 담아 위윔하기
		//글 번호 추출하기
		int newsBoardNo = Integer.parseInt(request.getParameter("bno"));
//		System.out.println("글번호 : "+ newsBoardNo); //글번호 추출 확인 완료
		
		//해당 글 번호로 그 글정보에 대해 조회수를 증가시키고 난 뒤 조회해오기
		//조회수 증가 메소드
		int result = new NewsBoardService().newsIncreaseCount(newsBoardNo);
		
		//조회수 증가가 잘 되었다면 해당 게시글 정보 조회해오기
		if(result>0) {
			NewsBoard nb = new NewsBoardService().selectNews(newsBoardNo);
			NewsAttachment na = new NewsBoardService().selectNewsAttachment(newsBoardNo);
//			System.out.println(nb); //null나오는데 맞는건가?
			request.setAttribute("newsBoard", nb);
			request.setAttribute("NewsAttachment", na);
			
			request.getRequestDispatcher("views/board/news/newsDetailView.jsp").forward(request, response);
		}else { //조회수 증가 실패했다면 에러페이지로 보내버리기!
			request.setAttribute("errorMsg", "동네소식 게시글 조회 실패");
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
