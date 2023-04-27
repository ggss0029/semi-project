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
import com.udong.board.common.model.vo.Attachment;
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
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String boardCategory = multiRequest.getParameter("boardCategory");
			String detailCategory = multiRequest.getParameter("detailCategory");
			String restaurantName = multiRequest.getParameter("restaurantName");
			String restaurantAddress = multiRequest.getParameter("restaurantAddress");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			System.out.println(userNo+" "+boardCategory+" "+detailCategory+" "+restaurantName+" "+restaurantAddress+" "+title+" "+content);
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "file"+i;
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/");
					
					if(i==1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					
					list.add(at);
				}
			}
		}else {
			
		}
	}

}
