package com.udong.board.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.udong.board.common.model.vo.BoardCommon;
import com.udong.board.common.model.vo.Reply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BoardCommonDao {
	
	private Properties prop = new Properties();
	
	public BoardCommonDao(){
		
		String filePath = BoardCommonDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		}  catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<BoardCommon> bestPostList(Connection conn) {
		
		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("bestPostList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO"),rset.getString("NICKNAME")
						,rset.getString("BOARD_TITLE"),rset.getString("BOARD_CONTENT"),rset.getString("BOARD_NAME"),rset.getString("CATEGORY")
						,rset.getInt("COUNT"),rset.getDate("CREATE_DATE"), rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<BoardCommon> searchKeyword(Connection conn, String keyword, PageInfo pi) {
		
		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("searchKeyword");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListTitle(Connection conn, PageInfo pi, int time, String searchInput) {
		
		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public ArrayList<BoardCommon> selectSearchListContent(Connection conn, PageInfo pi, int time, String searchInput) {

		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Reply> selectSearchListReply(Connection conn, PageInfo pi, int time, String searchInput) {

		ArrayList<Reply> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO")
								  ,rset.getInt("REF_BNO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("REPLY_CONTENT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getDate("MODIFY_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListWriter(Connection conn, PageInfo pi, int time, String searchInput) {

		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int selectKeywordCount(Connection conn, String keyword) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectKeywordCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int selectListCountTitleTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountTitleTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int selectListCountContentTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountContentTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int selectListCountReplyTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountReplyTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int selectListCountWriterTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountWriterTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

}
