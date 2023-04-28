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
 * Servlet implementation class FreeBoardUpdateController
 */
@WebServlet("/freeUpdate.bo")
public class FreeBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//게시글 번호 조회 하여 수정페이지로 전달하기
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	FreeBoardService freeService = new FreeBoardService();
	
	FreeBoard fb = freeService.selectFreeBoard(bno);
	FreeAttachment fat = freeService.selectFreeAttachment(bno);
	
	request.setAttribute("fb",fb);
	request.setAttribute("fat",fat);
	
	request.getRequestDispatcher("views/board/free/freeUpdateBoard.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	
	if(ServletFileUpload.isMultipartContent(request)) {
		
		int maxSize = 10*1024*1024;
		//저장시킬 경로 찾아주기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/board_files");
		
		//파일명 수정 작업객체 추가하기
		MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
	
		String boardTitle = multiRequest.getParameter("title");
		String boardContent = multiRequest.getParameter("content");
		int boardNo = Integer.parseInt(multiRequest.getParameter("boardNo"));
		
		FreeBoard fb = new FreeBoard();
		fb.setBoardTitle(boardTitle);
		fb.setBoardNo(boardNo);
		fb.setBoardContent(boardContent);
		
		FreeAttachment fat = null;
		//새롭게 전달된 첨부파일이 있다면 처리해주기 
		if(multiRequest.getOriginalFileName("reUpfile")!=null) {
			
			fat = new FreeAttachment();
			
			fat.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
			fat.setChangeName(multiRequest.getFilesystemName("reUpfile"));
			fat.setFilePath("/resources/board_files");
			
			if(multiRequest.getParameter("fileNo") != null) {
				//새로운 첨부파일이 있고 기존에도 첨부파일이 있는 경우
				//update attachment
				//기존 파일번호(식별자)를 이용하여 데이터 변경하기
				fat.setFileNo(Integer.parseInt(multiRequest.getParameter("fileNo")));
				
				//기존에 첨부파일 삭제하기.
				new File(savePath+"/"+multiRequest.getParameter("originFileName")).delete();
				
			}else {//원래 첨부파일이 없었고 새롭게 들어온 경우
				//현재 게시글 번호를 참조하게 INSERT 하기
				fat.setRefBno(boardNo);
			}
		}	
			//DML (update)
			int result = new FreeBoardService().updateFreeBoard(fb,fat);
			//새로운 첨부파일 없고  기존 첨부파일도 없는경우 - Board-update
			//새로운 첨부파일 있고 기존 첨부파일 없는경우 - Board-update / Attachment-insert
			//새로운 첨부파일 있고 기존 첨부파일 있는 경우 -Board-update / Attachment-update
			
			if(result>0) { //성공
				request.getSession().setAttribute("alertMsg", "게시글 수정 성공");
				response.sendRedirect(request.getContextPath()+"/FreeDetail.bo?bno="+boardNo);
			}
		}
		
	}
	
	}

