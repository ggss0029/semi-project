package com.udong.board.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.board.faq.model.service.FaqService;
import com.udong.board.faq.model.vo.FaqBoard;

/**
 * Servlet implementation class FaqUpdateController
 */
@WebServlet("/faqUpdate.bo")
public class FaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int FaqNo = Integer.parseInt(request.getParameter("bno"));
		
		FaqBoard fb = new FaqService().selectFaq(FaqNo);
		request.setAttribute("FaqBoard", fb);
		
		request.getRequestDispatcher("views/board/faq/faqUpdateView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int FaqNo = Integer.parseInt(request.getParameter("bno"));
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		System.out.println(FaqNo);
		
		FaqBoard fb = new FaqBoard();
		fb.setFaqNo(FaqNo);
		fb.setFaqTitle(faqTitle);
		fb.setFaqContent(faqContent);
		
		int result = new FaqService().updateFaq(fb);
		
		if(result>0) { //수정한 글번호를 이용해서 상세보기 페이지 보내기
			request.getSession().setAttribute("alertMsg", "FAQ 수정완료");
			response.sendRedirect(request.getContextPath()+"/faqList.bo?bno="+FaqNo);
		}else {
			request.setAttribute("errorMsg", "FAQ 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
