package com.udong.board.recipe.model.dao;

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

import com.udong.board.recipe.model.vo.Board;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao(){
		
		String filePath = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		}  catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//자취게시판 총게시글  구하는 메소드 
	public int selectListCount(Connection conn) {
	
		int listCount = 0;
		
		ArrayList<Board> list = new ArrayList<>();
		
		ResultSet rset = null;
		
		Statement stmt = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				//listCount = rset.getInt(1); //dao에서 못가져오니? 응  못가져옴 0 
				list.add(b);
				
			}
			System.out.println("selectListCount메소드에서 테스트"+list);
			listCount = list.size();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		return listCount;
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getStartPage()-1)* pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
	
			// BOARD_NO, BOARD_WRITER, BOARD_TITLE, CATEGORY, COUNT, CREATE_DATE, BOARDLIKE_NO
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),rset.getString("NICKNAME")
						,rset.getString("BOARD_TITLE"),rset.getString("CATEGORY")
						,rset.getInt("COUNT"),rset.getDate("CREATE_DATE"), rset.getInt("BOARDLIKE_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Board> selectListbyKeyword(Connection conn, PageInfo pi, String keyword) {
		
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListByKeyword");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			int startRow = (pi.getStartPage()-1)* pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),rset.getString("NICKNAME")
						,rset.getString("BOARD_TITLE"),rset.getString("CATEGORY")
						,rset.getInt("COUNT"),rset.getDate("CREATE_DATE"), rset.getInt("BOARDLIKE_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
