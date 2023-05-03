package com.udong.board.free.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.udong.board.free.model.vo.FreeBoard;
import com.udong.board.free.model.vo.FreeReply;
import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;

public class FreeBoardDao {
	
private Properties prop = new Properties();
	
	public FreeBoardDao() {
		
		String filePath = MemberDao.class.getResource("/sql/board/board-mapper.xml").getPath();
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
	
	//게시글 리스트
	public ArrayList<FreeBoard> getBoardList(Connection conn, String page , String boardTitle , String boardContent) {

		ArrayList<FreeBoard> list = new ArrayList<FreeBoard>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Integer offset = 0;
		Integer Limit = 10;
		String sql = prop.getProperty("getBoardFreeList");
		
		if(boardContent != null && boardTitle != null) {
			sql = prop.getProperty("BoardFreeWithSearch");
		}
		
		
		if(page != null && !page.equals("1")) {
			offset = (Integer.parseInt(page)-1) * 10 + 1;
			Limit = (Integer.parseInt(page)*10);
		}
//		NO.	제목	작성자	작성일	조회	추천수
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(boardContent != null && boardTitle != null) {
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, boardContent);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, Limit);
			}else {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, Limit);
			}
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				FreeBoard fb = new FreeBoard();
				fb.setBoardNo(rset.getInt("BOARD_NO"));
				fb.setBoardTitle(rset.getString("BOARD_TITLE"));
				fb.setBoardWriter(rset.getString("NICKNAME"));
				fb.setCreateDate(rset.getDate("CREATE_DATE"));
				fb.setCount(rset.getInt("COUNT"));
				fb.setLikeCnt(rset.getInt("LIKE_CNT"));
				
				list.add(fb);
				
//				list.add(new FreeBoard(rset.getInt("BOARD_NO")
//										,rset.getString("BOARD_TITLE")
//										,rset.getString("NICKNAME")
//										,rset.getDate("CREATE_DATE")
//										,rset.getInt("COUNT")
//										,rset.getInt("LIKE_CNT")));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	//총페이지 
	public Integer getBoardListCount(Connection conn, String boardTitle, String boardContent) {
		
		Integer count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBoardFreeListCount");
		
			try {
				pstmt=conn.prepareStatement(sql);
				rset =pstmt.executeQuery();
				
				
				if(rset.next()) {
					count=rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		return count;
	}

	//게시글 삭제
	public int deleteBoard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//게시글 작성
	public int insertBoard(Connection conn, FreeBoard nb) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(nb.getCategory()));
			pstmt.setString(2, nb.getBoardTitle());
			pstmt.setString(3, nb.getBoardContent());
			pstmt.setInt(4,Integer.parseInt(nb.getBoardWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	//댓글 작성
	public int FreeInsertReply(Connection conn, FreeReply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("FreeInsertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  r.getReplyContent());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setInt(3,  Integer.parseInt(r.getReplyWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//댓글 조회
	public ArrayList<FreeReply> selectReply(Connection conn, int freeBoardNo) {
		
		ArrayList<FreeReply> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, freeBoardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FreeReply(rset.getInt("REPLY_NO")
										,rset.getInt("REF_BNO")
										,rset.getString("NICKNAME")
										,rset.getString("REPLY_CONTENT")
										,rset.getDate("CREATE_DATE")));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}


	//게시글 정보조회
	public FreeBoard selectFree(Connection conn, int boardNo) {
		
		FreeBoard fb = null;
		ResultSet rset = null;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("selectFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb = new FreeBoard();
				fb.setBoardNo(rset.getInt("BOARD_NO"));
				fb.setBoardTitle(rset.getString("BOARD_TITLE"));
				fb.setBoardWriter(rset.getString("NICKNAME"));
				fb.setCreateDate(rset.getDate("CREATE_DATE"));
				fb.setBoardContent(rset.getString("BOARD_CONTENT"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			 JDBCTemplate.close(pstmt);
		}
		return fb;
		
	}
	//댓글 수정
	public int freeUpdateReply(Connection conn, int freeReplyNo, String content) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("freeUpdateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, content);
			pstmt.setInt(2, freeReplyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}
	
	//댓글 삭제
	public int freeDeleteReply(Connection conn, int freeReplyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("freeDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, freeReplyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

		
	


	

}
