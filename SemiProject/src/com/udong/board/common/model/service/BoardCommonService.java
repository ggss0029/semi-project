package com.udong.board.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.dao.BoardCommonDao;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.board.common.model.vo.Reply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BoardCommonService {
	
	//인기글 조회해오기
	public ArrayList<BoardCommon> bestPostList() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().bestPostList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BoardCommon> searchKeyword(String keyword, PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().searchKeyword(conn,keyword,pi);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<BoardCommon> selectSearchListTitle(PageInfo pi, int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().selectSearchListTitle(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListContent(PageInfo pi, int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().selectSearchListContent(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Reply> selectSearchListReply(PageInfo pi, int time, String searchInput) {
			
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reply> list = new BoardCommonDao().selectSearchListReply(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BoardCommon> selectSearchListWriter(PageInfo pi, int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().selectSearchListWriter(conn,pi,time,searchInput);
		JDBCTemplate.close(conn);
		return list;
		
	}

	public int selectKeywordCount(String keyword) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectKeywordCount(conn,keyword);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountTitleTime(int time, String searchInput) {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountTitleTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountContentTime(int time, String searchInput) {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountContentTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountReplyTime(int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountReplyTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public int selectListCountWriterTime(int time, String searchInput) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new BoardCommonDao().selectListCountWriterTime(conn,time,searchInput);
		JDBCTemplate.close(conn);
		return listCount;
	}

}
