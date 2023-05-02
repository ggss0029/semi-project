package com.udong.board.together.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.buy.model.dao.BuyDao;
import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.buy.model.vo.BuyReply;
import com.udong.board.together.model.dao.TogetherBoardDao;
import com.udong.board.together.model.vo.TogetherBoard;
import com.udong.board.together.model.vo.TogetherReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class TogetherBoardService {

	public int selectTogetherListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new TogetherBoardDao().selectTogetherListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<TogetherBoard> selectTogetherList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<TogetherBoard> list = new TogetherBoardDao().selectTogetherList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public TogetherBoard selectTogether(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		TogetherBoard tb = new TogetherBoardDao().selectTogether(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return tb;
	}

	public int selectTogetherListCount(String s) {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new TogetherBoardDao().selectTogetherListCount(conn, s);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<TogetherBoard> selectTogetherList(PageInfo pi, String[] selectedCategory) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<TogetherBoard> list = new TogetherBoardDao().selectTogetherList(conn, pi, selectedCategory);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int togetherInsertReply(TogetherReply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new TogetherBoardDao().togetherInsertReply(conn, r);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<TogetherReply> togetherSelectReply(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<TogetherReply> list = new TogetherBoardDao().togetherSelectReply(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int togetherDeleteReply(int replyNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new TogetherBoardDao().togetherDeleteReply(conn, replyNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int togetherUpdateReply(int replyNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new TogetherBoardDao().togetherUpdateReply(conn, replyNo, content);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
