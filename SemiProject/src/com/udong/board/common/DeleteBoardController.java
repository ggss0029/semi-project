package com.udong.board.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.service.BoardCommonService;

/**
 * Servlet implementation class DeleteBoardController
 */
@WebServlet("/deletePost.bo")
public class DeleteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] bnoString = request.getParameterValues("bno");
		int[] bnoArr = new int[bnoString.length]; // 삭제할 게시판 번호 담은 배열
		for(int i=0;i<bnoString.length;i++) {
			bnoArr[i] = Integer.parseInt(bnoString[i]);
		}
		
		int result = new BoardCommonService().deletePost(bnoArr);
		if(result > 0) { // 삭제 성공
			request.getSession().setAttribute("alertMsg", "게시글 삭제가 완료되었습니다.");
			System.out.println(request.getHeader("Referer"));
			response.sendRedirect(request.getHeader("Referer"));
		}
		else { // 삭제 실패
			request.setAttribute("errorMsg", "게시판 삭제 실패");
			request.getRequestDispatcher("views/oommon/errorPage.jsp").forward(request, response);
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
