package com.udong.board.clean.model.dao;

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

import com.udong.board.clean.model.vo.CleanBoard;
import com.udong.board.clean.model.vo.CleanReply;
import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.board.news.model.vo.NewsReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class CleanDao {
private Properties prop = new Properties();
	
	public CleanDao() {
		String filePath = CleanDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
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

	public int cleanSelectListCount(Connection conn) {
		int listCount =0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("cleanSelectListCount");
		
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

	public ArrayList<CleanBoard> cleanSelectList(Connection conn, PageInfo pi) {
		ArrayList<CleanBoard> clist = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("cleanSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new CleanBoard(rset.getInt("BOARD_NO")
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
		return clist;
	}

	public CleanBoard selectClean(Connection conn, int boardNo) {
		CleanBoard cb = new CleanBoard();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectClean");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cb = new CleanBoard(rset.getInt("BOARD_NO")
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
		return cb;
	}

	//댓글 작성
	public int cleanInsertReply(Connection conn, CleanReply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("cleanInsertReply");
		
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

	//댓글 목록
	public ArrayList<CleanReply> cleanSelectReply(Connection conn, int cleanBoardNo) {
		ArrayList<CleanReply> rlist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("cleanSelectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cleanBoardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rlist.add(new CleanReply(rset.getInt("REPLY_NO")
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

	//댓글 삭제
	public int cleanDeleteReply(Connection conn, int cleanReplyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("cleanDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cleanReplyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//댓글 수정
	public int cleanUpdateReply(Connection conn, int cleanBoardNo, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("cleanUpdateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, content);
			pstmt.setInt(2, cleanBoardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public CleanBoard cleanAllCategoryList(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("cleanAllCategoryList");
		CleanBoard cb = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cb = new CleanBoard(rset.getInt("BOARD_NO")
									,rset.getString("NICKNAME")
									,rset.getString("BOARD_TITLE")
									,rset.getString("CATEGORY")
									,rset.getInt("COUNT")
									,rset.getDate("CREATE_DATE")
									,rset.getInt("LIKECOUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cb;
	}

	public ArrayList<CleanBoard> selectNocleanList(Connection conn) {
		ArrayList<CleanBoard> clist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNocleanList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CleanBoard cb = new CleanBoard(rset.getInt("BOARD_NO")
											,rset.getString("NICKNAME")
											,rset.getString("BOARD_TITLE")
											,rset.getString("CATEGORY")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")
											,rset.getInt("LIKECOUNT"));
				clist.add(cb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}
		
}
