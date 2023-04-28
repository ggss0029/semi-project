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
			String before = request.getHeader("Referer");
			
			if(before.contains("myPost")) {
				response.sendRedirect(request.getHeader("Referer"));
			}
			else if(before.contains("news")) { // 동네 소식
				System.out.println("삭제 후 동네소식으로 이동함");
				response.sendRedirect(request.getContextPath() + "/newsList.bo?currentPage=1");
			}
			else if(before.contains("Free")) { // 자유 게시판
				response.sendRedirect(request.getContextPath() + "/FreeBoardList.bo?currentPage=1");
			}
			else if(before.contains("clean")) { // 살림 꿀팁
				response.sendRedirect(request.getContextPath() + "/cleanList.bo?currentPage=1");
			}
//			else if() { // 자취 레시피
//				
//			}
//			else if() { // 동네 맛집
//				
//			}
//			else if() { // 나눔 할게요
//				
//			}
//			else if() { // 이거 필요해요
//				
//			}
//			else if() { // 같이 해요
//				
//			}
//			else if() { // 같이 사요
//				
//			}
//			else { // 공지사항
//				
//			}
		}
		else { // 삭제 실패
			request.setAttribute("errorMsg", "게시판 삭제 실패");
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
