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

import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.together.model.vo.TogetherBoard;
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
		String sql = prop.getProperty("selectTogetherList2");
		
		try {
			String str = "'OR 1=1) AND (CATEGORY = '"+selectedCategory[0]+"' OR CATEGORY = '"+selectedCategory[1];
			System.out.println(str);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "게임' OR CATEGORY = '기타");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				TogetherBoard tb = new TogetherBoard();
				tb.setBoardNo(rset.getInt("BOARD_NO"));
				tb.setBoardTitle(rset.getString("BOARD_TITLE"));
				tb.setCategory(rset.getString("CATEGORY"));
				tb.setBoardWriter(rset.getString("NICKNAME"));
				tb.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(tb);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

}
