package com.udong.board.together.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.buy.model.dao.BuyDao;
import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.together.model.dao.TogetherBoardDao;
import com.udong.board.together.model.vo.TogetherBoard;
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

}
