package com.udong.board.need.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.udong.board.need.vo.NeedAttachment;
import com.udong.board.need.vo.NeedBoard;
import com.udong.board.need.vo.NeedReply;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;
import com.udong.member.model.vo.Member;

public class NeedBoardDao {
	
private Properties prop = new Properties();
	
	public NeedBoardDao() {
		
		String filePath = MemberDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		try {
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<NeedBoard> getBoardList(Connection conn, String page , String searchContent) {

		ArrayList<NeedBoard> list = new ArrayList<NeedBoard>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Integer offset = 0;
		Integer Limit = 10;
		String sql = prop.getProperty("getBoardNeedList");
		
		if(searchContent != null) {
			sql = prop.getProperty("BoardNeedWithSearch");
		}
	
		
		if(page != null && !page.equals("1")) {
			offset = (Integer.parseInt(page)-1) * 10 + 1;
			Limit = (Integer.parseInt(page)*10);
		}
//		NO.	제목	작성자	작성일	조회	추천수
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(searchContent != null) {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, Limit);
				pstmt.setString(3, searchContent);
				pstmt.setString(4, searchContent);
			}else {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, Limit);
			}
			
			rset= pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new NeedBoard(rset.getInt("BOARD_NO")
										,rset.getString("BOARD_TITLE")
										,rset.getString("NICKNAME")
										,rset.getDate("CREATE_DATE")
										,rset.getInt("COUNT")
										,rset.getInt("LIKE_CNT")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public Integer getBoardListCount(Connection conn , String searchContent) {
		
		Integer count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBoardNeedListCount");
		
//		if(searchContent) {
//			
//		}
			try {
				pstmt=conn.prepareStatement(sql);
				rset =pstmt.executeQuery();
				
				
				if(rset.next()) {
					count=rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		return count;
	}


	public int deleteBoard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNeedBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


	public int insertBoard(Connection conn, NeedBoard nb) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNeedBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(nb.getCategory()));
			pstmt.setString(2, nb.getBoardTitle());
			pstmt.setString(3, nb.getBoardContent());
			pstmt.setInt(4,Integer.parseInt(nb.getBoardWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}


	public int insertAttachment(Connection conn, NeedAttachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNeedAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


	public int needInsertReply(Connection conn, NeedReply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("needInsertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  r.getReplyContent());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setInt(3,  Integer.parseInt(r.getReplyWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


	public ArrayList<NeedReply> selectReply(Connection conn, int bno) {
		
		ArrayList<NeedReply> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new NeedReply(rset.getInt("REPLY_NO")
								   ,rset.getString("REPLY_CONTENT")
								   ,rset.getInt("REF_BNO")
								   ,rset.getString("REPLY_WRITER")
								   ,rset.getDate("CREATE_DATE")));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	

}
