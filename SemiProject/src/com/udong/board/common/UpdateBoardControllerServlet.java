package com.udong.board.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.udong.board.common.model.service.BoardCommonService;
import com.udong.board.common.model.vo.Attachment;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.common.MyFileRenamePolicy;

/**
 * Servlet implementation class UpdateBoardControllerServlet
 */
@WebServlet("/updateBoard.bo")
public class UpdateBoardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardCommonService service = new BoardCommonService();
		BoardCommon b = service.selectEachBoard(bno);
		ArrayList<Attachment> alist = service.selectAttachment(bno);
		request.setAttribute("bno", bno);
		if(alist.isEmpty()) {
			request.setAttribute("b", b);
		}else {
			request.setAttribute("alist", alist);
			request.setAttribute("b", b);
		}
		request.getRequestDispatcher("views/board/updateBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 20 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			int boardNo = Integer.parseInt(multiRequest.getParameter("boardNo"));
			String boardName = multiRequest.getParameter("boardCategoryHidden");
			String updateTitle = multiRequest.getParameter("updateTitle");
			String updateContent = multiRequest.getParameter("updateContent");
			String detailCategory = multiRequest.getParameter("updateDetailCategory");
			String region;
			if(boardName.equals("동네 맛집")) {
				region = multiRequest.getParameter("restaurantName") + "$" + multiRequest.getParameter("restaurantAddress");
			}else if(boardName.equals("동네 소식") || boardName.equals("나눔 할게요") || boardName.equals("같이 사요") || boardName.equals("같이 해요")) {
				region = multiRequest.getParameter("city")+" "+multiRequest.getParameter("country"); 
			}else {
				region = null;
			}
			BoardCommon b = new BoardCommon();
				b.setBoardNo(boardNo);
				b.setBoardName(boardName);
				b.setBoardTitle(updateTitle);
				b.setBoardContent(updateContent);
				b.setCategory(detailCategory);
				b.setRegion(region);
			Attachment at = null;
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			
			if(multiRequest.getParameter("changedFileLength") != null && Integer.parseInt(multiRequest.getParameter("changedFileLength"))>0) {
			String[] deleteFiles = new String[Integer.parseInt(multiRequest.getParameter("changedFileLength"))];
			
			if(multiRequest.getParameterValues("deleteFiles") != null) {
				deleteFiles= multiRequest.getParameterValues("deleteFiles");
				
				int delete = 0;
			for(int i=0;i<deleteFiles.length;i++) {
				delete *= new BoardCommonService().deleteEachAttachment(deleteFiles[i]);
				System.out.println(deleteFiles[i]+"체크"+i);
				new File(savePath+deleteFiles[i]).delete();
			}
			if(delete>0) {
				System.out.println("성공쓰");
			}else {
				System.out.println("실패쓰");
			}
			}
			

			for(int i=0; i<=Integer.parseInt(multiRequest.getParameter("changedFileLength")); i++) {
				String key = "file"+i;
				if(multiRequest.getOriginalFileName(key) != null) {
					
					at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/");
					at.setRefBno(boardNo);
					
					if(i==0) {
						at.setFileLevel(2);
					}else {
						at.setFileLevel(1);
					}
					list.add(at);
				}
			}
			}
			int result = new BoardCommonService().updateEachBoard(b,list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg","게시글 수정 성공");
				response.sendRedirect(request.getHeader("Referer"));
			}else {
				if(!list.isEmpty()) {
					for(int i=0; i<Integer.parseInt(multiRequest.getParameter("changedFileLength")); i++) {
						new File(savePath+list.get(i).getChangeName()).delete();
					}
				}
				request.setAttribute("errorMsg", "게시글 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

}
