package com.udong.board.food.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.udong.board.common.model.vo.Attachment;
import com.udong.board.food.model.vo.FoodBoard;
import com.udong.board.food.model.vo.FoodReply;
import com.udong.board.news.model.vo.NewsReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;


public class FoodBoardDao {
	
	Properties prop = new Properties();
	
	public FoodBoardDao() {
		String filePath = FoodBoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		}  catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int foodSelectListCount(Connection conn) {

		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("foodSelectListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return listCount;
	}

	public ArrayList<FoodBoard> selectFoodList(Connection conn, PageInfo pi) {
		
		ArrayList<FoodBoard> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
		int endRow = (startRow+pi.getBoardLimit()) - 1;
		String sql = prop.getProperty("selectFoodList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FoodBoard fb = new FoodBoard(rset.getInt("BOARD_NO")
											,rset.getString("NICKNAME")
											,rset.getString("BOARD_TITLE")
											,rset.getString("CATEGORY")
											,rset.getString("REGION")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")
											,rset.getInt("BOARD_REPORT")
											,rset.getInt("LIKECOUNT")
											,rset.getString("TITLEIMG"));
				list.add(fb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public FoodBoard foodAllCategoryList(Connection conn, String category) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("foodAllCategoryList");
		FoodBoard fb = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb = new FoodBoard(rset.getInt("BOARD_NO")
						,rset.getString("NICKNAME")
						,rset.getString("BOARD_TITLE")
						,rset.getString("CATEGORY")
						,rset.getString("REGION")
						,rset.getInt("COUNT")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("BOARD_REPORT")
						,rset.getInt("LIKECOUNT")
						,rset.getString("TITLEIMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fb;
}

	public FoodBoard foodRegionCategoryList(Connection conn, String category, String region) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("foodRegionCategoryList");
		FoodBoard fb = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, region);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb =  new FoodBoard(rset.getInt("BOARD_NO")
						,rset.getString("NICKNAME")
						,rset.getString("BOARD_TITLE")
						,rset.getString("CATEGORY")
						,rset.getString("REGION")
						,rset.getInt("COUNT")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("BOARD_REPORT")
						,rset.getInt("LIKECOUNT")
						,rset.getString("TITLEIMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fb;
	}

	public ArrayList<FoodBoard> selectNoCTFoodList(Connection conn) {
		
		ArrayList<FoodBoard> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNoCTFoodList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FoodBoard fb = new FoodBoard(rset.getInt("BOARD_NO")
											,rset.getString("NICKNAME")
											,rset.getString("BOARD_TITLE")
											,rset.getString("CATEGORY")
											,rset.getString("REGION")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")
											,rset.getInt("BOARD_REPORT")
											,rset.getInt("LIKECOUNT")
											,rset.getString("TITLEIMG"));
				list.add(fb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<FoodBoard> selectRegionFoodList(Connection conn, String region) {
		
		ArrayList<FoodBoard> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectRegionFoodList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, region);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FoodBoard fb = new FoodBoard(rset.getInt("BOARD_NO")
											,rset.getString("NICKNAME")
											,rset.getString("BOARD_TITLE")
											,rset.getString("CATEGORY")
											,rset.getString("REGION")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")
											,rset.getInt("BOARD_REPORT")
											,rset.getInt("LIKECOUNT")
											,rset.getString("TITLEIMG"));
				list.add(fb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public FoodBoard selectFoodBoardDetail(Connection conn, int boardNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFoodBoardDetail");
		FoodBoard fb = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb =  new FoodBoard(rset.getInt("BOARD_NO")
						,rset.getString("NICKNAME")
						,rset.getString("BOARD_TITLE")
						,rset.getString("BOARD_CONTENT")
						,rset.getString("CATEGORY")
						,rset.getString("REGION")
						,rset.getInt("COUNT")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("BOARD_REPORT")
						,rset.getInt("LIKECOUNT")
						,rset.getString("TITLEIMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fb;
	}

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int boardNo) {
		
		ArrayList<Attachment> alist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				alist.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return alist;
	}

	public int foodInsertReply(Connection conn, FoodReply fr, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("foodInsertReply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fr.getReplyContent());
			pstmt.setInt(2, fr.getRefBno());
			pstmt.setInt(3, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<FoodReply> foodSelectReply(Connection conn, int boardNo) {
		
		ArrayList<FoodReply> rlist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("foodSelectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				rlist.add(new FoodReply(rset.getInt("REPLY_NO")
										,rset.getString("NICKNAME")
										,rset.getString("REPLY_CONTENT")
										,rset.getDate("CREATE_DATE")
										,rset.getDate("MODIFY_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rlist;
	}

	public int foodDeleteReply(Connection conn, int replyNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("foodDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int foodUpdateReply(Connection conn, int replyNo, String content) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("foodUpdateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, replyNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
