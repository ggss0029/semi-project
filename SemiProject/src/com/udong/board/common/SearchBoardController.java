package com.udong.board.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchBoardController
 */
@WebServlet("/searchBoard.bo")
public class SearchBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		String boardName = request.getParameter("bname");
		
		if(boardName.equals("동네 소식")) {
			response.sendRedirect(request.getContextPath() + "/newsDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("살림 꿀팁")) {
			response.sendRedirect(request.getContextPath() + "/cleanDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("자취 레시피")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("동네 맛집")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("나눔 할게요")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("이거 필요해요")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("같이 해요")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("같이 사요")) {
			response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("자유 게시판")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
		}
		else if(boardName.equals("공지 사항")) {
			//response.sendRedirect(request.getContextPath() + "/buyDetail.bo?bno=" + boardNo);
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
