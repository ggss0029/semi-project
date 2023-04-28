package com.udong.board.news.model.dao;

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

import com.udong.board.news.model.vo.NewsAttachment;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.board.news.model.vo.NewsReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class NewsBoardDao {
	
	private Properties prop = new Properties();
	
	public NewsBoardDao() {
		String filePath = NewsBoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
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

	//총 게시글 개수 구하는 메소드
	public int newsSelectListCount(Connection conn) {
		int listCount =0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("newsSelectListCount");
		
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
	
	//게시글 리스트 조회
	public ArrayList<NewsBoard> newsSelectList(Connection conn, PageInfo pi) {
		ArrayList<NewsBoard> nlist = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newsSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				nlist.add(new NewsBoard(rset.getInt("BOARD_NO")
										,rset.getString("NICKNAME")
										,rset.getString("BOARD_TITLE")
										,rset.getInt("COUNT")
										,rset.getDate("CREATE_DATE")
										,rset.getInt("LIKE_COUNT")));
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
		return nlist;
	}

	//게시글 하나 조회하는 메소드
	public NewsBoard selectNews(Connection conn, int boardNo) {
		NewsBoard nb = new NewsBoard();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nb = new NewsBoard(rset.getInt("BOARD_NO")
									,rset.getString("BOARD_TITLE")
									,rset.getString("NICKNAME")
									,rset.getString("BOARD_CONTENT")			
									,rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return nb;
	}

	//첨부파일 정보 조회
	public NewsAttachment selectNewsAttachment(Connection conn, int newsBoardNo) {
		NewsAttachment na = new NewsAttachment();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectNewsAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newsBoardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				na = new NewsAttachment(rset.getInt("FILE_NO")
										,rset.getString("ORIGIN_NAME")
										,rset.getString("CHANGE_NAME")
										,rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return na;
	}

	//댓글 작성
	public int newsInsertReply(Connection conn, NewsReply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newsInsertReply");
		
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

	//댓글 목록 조회
	public ArrayList<NewsReply> newsSelectReply(Connection conn, int newsBoardNo) {
		ArrayList<NewsReply> rlist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newsSelectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newsBoardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rlist.add(new NewsReply(rset.getInt("REPLY_NO")
										,rset.getInt("REF_BNO")
										,rset.getString("NICKNAME")
										,rset.getDate("CREATE_DATE")
										,rset.getString("REPLY_CONTENT")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rlist;
	}

	//댓글 삭제 메소드
	public int newsDeleteReply(Connection conn, int newsReplyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newsDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newsReplyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int newsUpdateReply(Connection conn, int newsReplyNo, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newsUpdateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, content);
			pstmt.setInt(2, newsReplyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<NewsBoard> newsBoardSearch(Connection conn, PageInfo pi, String region, String category) {
		ArrayList<NewsBoard> nlist = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newsBoardSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			
			pstmt.setString(1, region);
			pstmt.setString(2, category);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				nlist.add(new NewsBoard(rset.getInt("BOARD_NO")
										,rset.getString("NICKNAME")
										,rset.getString("BOARD_TITLE")
										,rset.getInt("COUNT")
										,rset.getDate("CREATE_DATE")
										,rset.getInt("LIKE_COUNT")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return nlist;
	}


	//동네소식 게시글 삭제
	public int deleteNewsBoard(Connection conn, int newsBoardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNewsBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newsBoardNo); 
			
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
