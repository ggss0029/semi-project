package com.udong.board.faq.model.dao;

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
import com.udong.board.faq.model.vo.FaqBoard;
import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class FaqDao {
private Properties prop = new Properties();
	
	public FaqDao() {
		String filePath = FaqDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
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

	public int faqSelectListCount(Connection conn) {
		int listCount =0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("faqSelectListCount");
		
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

	public ArrayList<FaqBoard> faqSelectList(Connection conn, PageInfo pi) {
		ArrayList<FaqBoard> flist = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("faqSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				flist.add(new FaqBoard(rset.getInt("FAQ_NO")
										,rset.getString("FAQ_TITLE")
										,rset.getString("FAQ_CONTENT")));
				//순서가 적으면 아래처럼 요롷게 하기
//				NewsBoard nb = new NewsBoard();
//				nb.set
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return flist;
	}

	public int faqInsertBoard(Connection conn, FaqBoard fb) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("faqInsertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fb.getFaqTitle());
			pstmt.setString(2, fb.getFaqContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int faqDeleteBoard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("faqDeleteBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public FaqBoard selectFaq(Connection conn, int faqNo) {
		FaqBoard fb = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, faqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb = new FaqBoard(rset.getInt("FAQ_NO")
								,rset.getString("FAQ_TITLE")
								,rset.getString("FAQ_CONTENT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return fb;
	}

	public int updateFaq(Connection conn, FaqBoard fb) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fb.getFaqTitle());
			pstmt.setString(2, fb.getFaqContent());
			pstmt.setInt(3, fb.getFaqNo());
			
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
