package com.udong.board.free.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.udong.board.free.model.service.FreeBoardService;
import com.udong.board.free.model.vo.FreeAttachment;
import com.udong.board.free.model.vo.FreeBoard;
import com.udong.common.MyFileRenamePolicy;

/**
 * Servlet implementation class FreeBoardInsertController
 */
@WebServlet("/FreeInsert.me")
public class FreeBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardInsertController() {
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
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
		
			FreeBoard nb = new FreeBoard();
			nb.setBoardTitle(title);
			nb.setBoardContent(content);
			nb.setBoardWriter(boardWriter);
			
			FreeAttachment at = null; // null로 초기화해놓기
			
			if(multiRequest.getOriginalFileName("upfile") !=null) {
				//조회가 된경우 (첨부파일이 있다)545
				at = new FreeAttachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));//원본명
				at.setChangeName(multiRequest.getFilesystemName("upfile"));//수정명(실제 서버에 업로드된 파일명)
				at.setFilePath("/resources/board_files");
			}
			//서비스에게 준비된 객체 전달 서비스 요청
			int result = new  FreeBoardService().insertFreeBoard(nb,at);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/FreeBoardList.me?currentPage=1");
			}else {
				//실패시에는 업로드된 파일을 지워주는 작업이 필요하다(게시글은 없는데 업로드파일이 자원을 쓰고있으니) 
				if(at!=null) { //넘어온 파일이 있어서 객체가 생성됐다면.
					//해당 파일 경로 잡아서 File객체 생성 후 delete메소드로 파일 삭제 작업 
					new File(savePath+at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/board/Free/FreeListView.jsp").forward(request, response);
				
			}
			
		}
		
		
	}

}
