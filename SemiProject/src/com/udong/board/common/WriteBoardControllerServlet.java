package com.udong.board.common;

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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=0; i<=Integer.parseInt(multiRequest.getParameter("fileLength")); i++) {
				String key = "file"+i;
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/");
					
					if(i==0) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}
			int result = new BoardCommonService().insertEachBoard(b,list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성 완료");
				response.sendRedirect(request.getHeader("Referer"));
			}else {
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
}
