package com.udong.letter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.letter.model.service.LetterService;
import com.udong.letter.model.vo.Letter;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class SendLetterController
 */
@WebServlet("/writeLetter.le")
public class WriteLetterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteLetterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String modalNickname = request.getParameter("modalNickname");
		request.setAttribute("modalNickname",modalNickname);
		request.getRequestDispatcher("views/letter/writeLetter.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int WriterNo = Integer.parseInt(request.getParameter("senderNo"));
		int receiverNo = Integer.parseInt(request.getParameter("receiverNo"));
		String letterContent = request.getParameter("letterContent");
		
		Letter le = new Letter(WriterNo,receiverNo,letterContent);
		int result = new LetterService().sendLetter(le);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "쪽지 보내기 완료");
			response.sendRedirect(request.getContextPath()+"/sendLetterList.le?currentPage=1&writerNo="+((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			
		}else {
			request.setAttribute("errorMsg", "쪽지 보내기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
