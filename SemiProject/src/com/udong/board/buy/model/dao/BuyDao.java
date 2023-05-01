package com.udong.board.buy.model.dao;

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
import com.udong.board.buy.model.vo.BuyReply;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BuyDao {
	private Properties prop = new Properties();
	
	public BuyDao() {
		String filePath = BuyDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
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

	public int buySelectListCount(Connection conn) {
		int listCount =0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("buySelectListCount");
		
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

	public ArrayList<BuyBoard> buySelectList(Connection conn, PageInfo pi) {
		ArrayList<BuyBoard> blist = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("buySelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				blist.add(new BuyBoard(rset.getInt("BOARD_NO")
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
		return blist;
	}

	public BuyBoard selectBuy(Connection conn, int boardNo) {
		BuyBoard buyb = new BuyBoard();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectBuy");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				buyb = new BuyBoard(rset.getInt("BOARD_NO")
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
		return buyb;
	}
	
	//댓글 작성
	public int buyInsertReply(Connection conn, BuyReply r) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("buyInsertReply");
			
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
	public ArrayList<BuyReply> buySelectReply(Connection conn, int buyBoardNo) {
			ArrayList<BuyReply> blist = new ArrayList<>();
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("buySelectReply");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, buyBoardNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					blist.add(new BuyReply(rset.getInt("REPLY_NO")
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
			return blist;
		}

	//댓글 삭제
	public int buyDeleteReply(Connection conn, int buyReplyNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("buyDeleteReply");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, buyReplyNo);
				
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
	public int buyUpdateReply(Connection conn, int buyBoardNo, String content) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("buyUpdateReply");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, content);
				pstmt.setInt(2, buyBoardNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

	public BuyBoard buyAllCategoryList(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("buyAllCategoryList");
		BuyBoard buyb = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				buyb = new BuyBoard(rset.getInt("BOARD_NO")
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
		return buyb;
	}

	public ArrayList<BuyBoard> selectNoBuyList(Connection conn) {
		ArrayList<BuyBoard> blist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNoBuyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BuyBoard buyb = new BuyBoard(rset.getInt("BOARD_NO")
											,rset.getString("NICKNAME")
											,rset.getString("BOARD_TITLE")
											,rset.getString("CATEGORY")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")
											,rset.getInt("LIKECOUNT"));
				blist.add(buyb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return blist;
	}

}
