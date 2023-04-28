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

import com.udong.board.free.model.vo.FreeAttachment;
import com.udong.board.free.model.vo.FreeBoard;
import com.udong.board.free.model.vo.FreeReply;
import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;
import com.udong.member.model.vo.Member;

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
	

	public ArrayList<FreeBoard> getBoardList(Connection conn, String page , String searchContent) {

		ArrayList<FreeBoard> list = new ArrayList<FreeBoard>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Integer offset = 0;
		Integer Limit = 11;
		String sql = prop.getProperty("getBoardFreeList");
		
		if(searchContent != null) {
			sql = prop.getProperty("BoardFreeWithSearch");
		}
	
		
		if(page != null && !page.equals("1")) {
			offset = (Integer.parseInt(page)-1) * 11 + 1;
			Limit = (Integer.parseInt(page)*11);
		}
//		NO.	제목	작성자	작성일	조회	추천수
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(searchContent != null) {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, Limit);
				pstmt.setString(3, searchContent);
				pstmt.setString(4, searchContent);
			}else {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, Limit);
			}
			
			rset= pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new FreeBoard(rset.getInt("BOARD_NO")
										,rset.getString("BOARD_TITLE")
										,rset.getString("NICKNAME")
										,rset.getDate("CREATE_DATE")
										,rset.getInt("COUNT")
										,rset.getInt("LIKE_CNT")));
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

	public Integer getBoardListCount(Connection conn , String searchContent) {
		
		Integer count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBoardFreeListCount");
		
//		if(searchContent) {
//			
//		}
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


	public int insertAttachment(Connection conn, FreeAttachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


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
	public ArrayList<FreeReply> selectReply(Connection conn, int bno) {
		
		ArrayList<FreeReply> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FreeReply(rset.getInt("REPLY_NO")
								   ,rset.getString("REPLY_CONTENT")
								   ,rset.getInt("REF_BNO")
								   ,rset.getString("REPLY_WRITER")
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
	public FreeBoard selectBoard(Connection conn, int bno) {
		
		FreeBoard fb = null;
		ResultSet rset = null;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("selectFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb = new FreeBoard(rset.getInt("BOARD_NO")
									,rset.getString("BOARD_TITLE")
									,rset.getString("NICKNAME")
									,rset.getDate("CREATE_DATE")
									,rset.getInt("COUNT")
									,rset.getInt("LIKE_CNT"));
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

	//첨부파일 조회
	public FreeAttachment selectAttachment(Connection conn, int bno) {
		
		FreeAttachment fat = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fat = new FreeAttachment(rset.getInt("FILE_NO")
						   ,rset.getString("ORIGIN_NAME")
						   ,rset.getString("CHANGE_NAME")
						   ,rset.getString("FILE_PATH"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fat;
		
	}

	//게시글
	public int increaseCount(Connection conn, int bno) {
		
		int result = 0;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("increaseFreeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	

}
