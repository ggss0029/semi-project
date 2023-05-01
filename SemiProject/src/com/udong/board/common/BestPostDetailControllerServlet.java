package com.udong.board.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.common.model.vo.Attachment;
import com.udong.board.common.model.vo.BoardCommon;

/**
 * Servlet implementation class BestPostDetailControllerServlet
 */
@WebServlet("/bestDetail.bo")
public class BestPostDetailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestPostDetailControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardCommonService().increaseCount(boardNo);
		
		if(result>0) {
			BoardCommon bestPost = new BoardCommonService().selectBestPostDetail(boardNo);
			ArrayList<Attachment> alist = new BoardCommonService().selectAttachment(boardNo);
			
			request.setAttribute("board", bestPost);
			
			if(!alist.isEmpty()) {
				request.setAttribute("alist", alist);
			}
			
			if(bestPost.getBoardName().equals("동네 소식")) {
				request.setAttribute("bestPost", bestPost);
				System.out.println("동네소식"+bestPost);
				request.getRequestDispatcher("views/board/news/newsDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("살림 꿀팁")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("자취 레시피")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("동네 맛집")) {
				request.setAttribute("bestPost", bestPost);
				request.setAttribute("alist", alist);
				System.out.println(bestPost);
				System.out.println(alist);
				request.getRequestDispatcher("views/board/food/foodDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("나눔 할게요")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("이거 필요해요")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("같이 사요")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("같이 해요")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}else if(bestPost.getBoardName().equals("자유 게시판")) {
				request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			}
			
			
		}else {
			request.setAttribute("errorMsg","게시글 조회 실패");
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
