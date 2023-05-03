package com.udong.board.together.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.udong.board.buy.model.vo.BuyReply;
import com.udong.board.together.model.vo.TogetherBoard;
import com.udong.board.together.model.vo.TogetherReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class TogetherBoardDao {
	
	private Properties prop = new Properties();
	
	public TogetherBoardDao() {
		String filePath = TogetherBoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectTogetherListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = prop.getProperty("selectTogetherListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<TogetherBoard> selectTogetherList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<TogetherBoard> list = new ArrayList<>();
		String sql = prop.getProperty("selectTogetherList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				TogetherBoard tb = new TogetherBoard();
				tb.setBoardNo(rset.getInt("BOARD_NO"));
				tb.setBoardTitle(rset.getString("BOARD_TITLE"));
				tb.setCategory(rset.getString("CATEGORY"));
				tb.setBoardWriter(rset.getString("NICKNAME"));
				tb.setCreateDate(rset.getDate("CREATE_DATE"));
				tb.setCount(rset.getInt("COUNT"));
				tb.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				list.add(tb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public TogetherBoard selectTogether(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		TogetherBoard tb = new TogetherBoard();
		String sql = prop.getProperty("selectTogether");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				tb.setBoardNo(rset.getInt("BOARD_NO"));
				tb.setBoardTitle(rset.getString("BOARD_TITLE"));
				tb.setBoardContent(rset.getString("BOARD_CONTENT"));
				tb.setBoardWriter(rset.getString("NICKNAME"));
				tb.setCreateDate(rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return tb;
	}

	public int selectTogetherListCount(Connection conn, String s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = prop.getProperty("selectTogetherListCount2");
		
		try {;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<TogetherBoard> selectTogetherList(Connection conn, PageInfo pi, String[] selectedCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<TogetherBoard> list = new ArrayList<>();
		
		try {
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.*" + 
					" FROM (SELECT BOARD_NO, BOARD_TITLE, NICKNAME, CATEGORY, CREATE_DATE, COUNT, COUNT(BOARDLIKE_NO) LIKE_COUNT" + 
					" FROM BOARD B" + 
					" JOIN MEMBER M ON (BOARD_WRITER = USER_NO)" + 
					" LEFT JOIN BOARD_LIKE ON (BOARDLIKE_NO = BOARD_NO)" + 
					" WHERE BOARD_NAME = '같이 해요' AND (CATEGORY = '";
			
			for(int i=0;i<selectedCategory.length;i++) {
				if(i == selectedCategory.length-1) {
					sql += selectedCategory[i];
				}
				else {
					sql += selectedCategory[i] + "' OR CATEGORY = '";
				}
			}
					
			sql += "')  AND B.STATUS ='Y'" + 
					" GROUP BY BOARD_NO, BOARD_TITLE, NICKNAME, CATEGORY, CREATE_DATE, COUNT" + 
					" ORDER BY BOARD_NO DESC) A )" + 
					" WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				TogetherBoard tb = new TogetherBoard();
				tb.setBoardNo(rset.getInt("BOARD_NO"));
				tb.setBoardTitle(rset.getString("BOARD_TITLE"));
				tb.setCategory(rset.getString("CATEGORY"));
				tb.setBoardWriter(rset.getString("NICKNAME"));
				tb.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(tb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int togetherInsertReply(Connection conn, TogetherReply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("togetherInsertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<TogetherReply> togetherSelectReply(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<TogetherReply> list = new ArrayList<>();
		String sql = prop.getProperty("togetherSelectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				TogetherReply tr = new TogetherReply();
				tr.setReplyNo(rset.getInt("REPLY_NO"));
				tr.setRefBno(rset.getInt("REF_BNO"));
				tr.setReplyWriter(rset.getString("NICKNAME"));
				tr.setCreateDate(rset.getDate("CREATE_DATE"));
				tr.setReplyContent(rset.getString("REPLY_CONTENT"));
				
				list.add(tr);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int togetherDeleteReply(Connection conn, int replyNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("togetherDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int togetherUpdateReply(Connection conn, int replyNo, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("togetherUpdateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, replyNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
