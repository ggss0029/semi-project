package com.udong.board.news.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.news.model.service.NewsBoardService;

/**
 * Servlet implementation class NewsBoardDeleteController
 */
@WebServlet("/newsDelete.bo")
public class NewsBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int newsBoardNo = Integer.parseInt(request.getParameter("bno"));

		int result = new NewsBoardService().deleteNewsBoard(newsBoardNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 삭제 완료");
			response.sendRedirect(request.getContextPath()+"/newsList.bo?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "게시글 삭제 실패");
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
