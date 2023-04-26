package com.udong.letter.model.dao;

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

import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;
import com.udong.letter.model.vo.Letter;

public class LetterDao {

	Properties prop = new Properties();
	public LetterDao() {
		
		String filePath = LetterDao.class.getResource("/sql/letter/letter-mapper.xml").getPath();
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
	public int sendLetter(Connection conn, Letter le) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sendLetter");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, le.getLetterWriterNo());
			pstmt.setInt(2, le.getLetterReceiverNo());
			pstmt.setString(3, le.getLetterContent());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectsendLetterListCount(Connection conn, int writerNo) {

		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectsendLetterListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, writerNo);
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
	
	public ArrayList<Letter> sendLetterList(Connection conn, int writerNo, PageInfo pi) {
		
		ArrayList<Letter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sendLetterList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, writerNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Letter(rset.getInt("LETTER_NO"),rset.getString("NICKNAME"),rset.getString("LETTER_CONTENT"),rset.getDate("WRITE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
