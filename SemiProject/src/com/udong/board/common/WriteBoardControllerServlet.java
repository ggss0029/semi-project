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
 * Servlet implementation class WriteBoardControllerServlet
 */
@WebServlet("/insert.bo")
public class WriteBoardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBoardControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardName = request.getParameter("boardName");
		request.setAttribute("boardName", boardName);
		request.getRequestDispatcher("views/board/writeBoard.jsp").forward(request, response);
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
			String nickname = multiRequest.getParameter("userNickname");
			String boardName = multiRequest.getParameter("boardCategory");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String category = multiRequest.getParameter("detailCategory");
			String region;
			if(boardName.equals("동네 맛집")) {
				region = multiRequest.getParameter("restaurantName") + "$" + multiRequest.getParameter("restaurantAddress");
			}else if(boardName.equals("동네 소식") || boardName.equals("나눔 할게요") || boardName.equals("같이 사요") || boardName.equals("같이 해요")) {
				region = multiRequest.getParameter("city")+" "+multiRequest.getParameter("country"); 
			}else {
				region = null;
			}
			BoardCommon b = new BoardCommon();
				b.setBoardWriter(nickname);
				b.setBoardName(boardName);
				b.setBoardTitle(boardTitle);
				b.setBoardContent(boardContent);
				b.setCategory(category);
				b.setRegion(region);
				
			Attachment at = null;
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=0; i<=Integer.parseInt(multiRequest.getParameter("fileLength")); i++) {
				String key = "file"+i;
				if(multiRequest.getOriginalFileName(key) != null) {
					at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/");
					
					if(i==0) {
						at.setFileLevel(2);
					}else {
						at.setFileLevel(1);
					}
					list.add(at);
				}
			}
			
			int result = new BoardCommonService().insertEachBoard(b,list);
			
			if(result>0) {
				request.getSession().setAttribute("goBefore","뒤로 가 임마");
				response.sendRedirect(request.getHeader("Referer"));
			}else {
				if(!list.isEmpty()) {
					for(int i=0; i<=Integer.parseInt(multiRequest.getParameter("fileLength")); i++) {
						new File(savePath+list.get(i).getChangeName()).delete();
					}
				}
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
}
