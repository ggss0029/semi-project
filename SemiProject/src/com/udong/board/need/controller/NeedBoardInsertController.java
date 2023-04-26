package com.udong.board.need.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.udong.board.need.vo.NeedAttachment;
import com.udong.board.need.vo.NeedBoard;
import com.udong.common.MyFileRenamePolicy;

/**
 * Servlet implementation class NeedBoardInsertController
 */
@WebServlet("/NeedInsert.me")
public class NeedBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NeedBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			//파일 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_files/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			// 카테고리 제목 내용 작성자 
			String category = multiRequest.getParameter("category");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
		
			NeedBoard nb = new NeedBoard();
			nb.setCategory(category);
			nb.setBoardTitle(title);
			nb.setBoardContent(content);
			nb.setBoardWriter(boardWriter);
			
			NeedAttachment at = null; // null로 초기화해놓기
			
			if(multiRequest.getOriginalFileName("upfile") !=null) {
				//조회가 된경우 (첨부파일이 있다)
				at = new NeedAttachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));//원본명
				at.setChangeName(multiRequest.getFilesystemName("upfile"));//수정명(실제 서버에 업로드된 파일명)
				at.setFilePath("/resources/board_files");
			}
			
		}
		
		
	}

}
