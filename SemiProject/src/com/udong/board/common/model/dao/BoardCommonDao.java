package com.udong.board.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.udong.board.common.model.vo.Attachment;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.board.common.model.vo.Reply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

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
						,rset.getInt("COUNT"),rset.getDate("CREATE_DATE"), rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<BoardCommon> searchKeyword(Connection conn, String keyword, PageInfo pi) {
		
		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("searchKeyword");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListTitle(Connection conn, PageInfo pi, int time, String searchInput) {
		
		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public ArrayList<BoardCommon> selectSearchListContent(Connection conn, PageInfo pi, int time, String searchInput) {

		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Reply> selectSearchListReply(Connection conn, PageInfo pi, int time, String searchInput) {

		ArrayList<Reply> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO")
								  ,rset.getInt("REF_BNO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("REPLY_CONTENT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getDate("MODIFY_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListWriter(Connection conn, PageInfo pi, int time, String searchInput) {

		ArrayList<BoardCommon> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchListWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
			int endRow = (startRow+pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardCommon(rset.getInt("BOARD_NO")
								  ,rset.getString("NICKNAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("BOARD_NAME")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")
								  ,rset.getInt("LIKECOUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}


	public ArrayList<BoardCommon> lastestPostList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<BoardCommon> list = new ArrayList<>();
		String sql = prop.getProperty("lastestPostList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				BoardCommon bc = new BoardCommon();
				bc.setBoardNo(rset.getInt("BOARD_NO"));
				bc.setBoardTitle(rset.getString("BOARD_TITLE"));
				bc.setBoardName(rset.getString("BOARD_NAME"));
				
				list.add(bc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}

	public int selectKeywordCount(Connection conn, String keyword) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectKeywordCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
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

	public int selectListCountTitleTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountTitleTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
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

	public int selectListCountContentTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountContentTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
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

	public int selectListCountReplyTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountReplyTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
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

	public int selectListCountWriterTime(Connection conn, int time, String searchInput) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectListCountWriterTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, time);
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

	public int selectMyPostList(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = prop.getProperty("selectMyPostList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<BoardCommon> selectMyPost(Connection conn, PageInfo pi, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardCommon> list = new ArrayList<>();
		String sql = prop.getProperty("selectMyPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) -1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardCommon bc = new BoardCommon();
				bc.setBoardNo(rset.getInt("BOARD_NO"));
				bc.setBoardTitle(rset.getString("BOARD_TITLE"));
				bc.setBoardName(rset.getString("BOARD_NAME"));
				bc.setCount(rset.getInt("COUNT"));
				bc.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(bc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int insertEachBoard(Connection conn, BoardCommon b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEachBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardWriter());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardName());
			pstmt.setString(5, b.getCategory());
			pstmt.setString(6, b.getRegion());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertEachAttachment(Connection conn, ArrayList<Attachment> list) {

		int result = 1; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEachAttachment");
		
		try {
			for(Attachment at : list) {
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			result=0;
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, int boardNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public BoardCommon selectBestPostDetail(Connection conn, int boardNo) {
		
		BoardCommon b = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBestPostDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new BoardCommon(rset.getInt("BOARD_NO")
							 ,rset.getString("NICKNAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getString("BOARD_NAME")
							 ,rset.getString("CATEGORY")
							 ,rset.getString("REGION")
							 ,rset.getInt("COUNT")
							 ,rset.getDate("CREATE_DATE")
							 ,rset.getInt("BOARD_REPORT")
							 ,rset.getInt("LIKECOUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	public ArrayList<Attachment> selectAttachment(Connection conn, int boardNo) {
		
		ArrayList<Attachment> alist = new ArrayList<>(); 
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment at = new Attachment(rset.getInt("FILE_NO")
								   ,rset.getInt("REF_BNO")
								   ,rset.getString("ORIGIN_NAME")
								   ,rset.getString("CHANGE_NAME")
								   ,rset.getString("FILE_PATH")
								   ,rset.getInt("FILE_LEVEL"));
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

}
