package com.udong.board.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.udong.board.common.model.vo.BoardCommon;
import com.udong.common.JDBCTemplate;

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
						,rset.getInt("COUNT"),rset.getDate("CREATE_DATE"), rset.getInt("COUNT")));
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
