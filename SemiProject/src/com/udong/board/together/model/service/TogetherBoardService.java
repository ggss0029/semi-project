package com.udong.board.together.model.service;

import java.sql.Connection;

import com.udong.board.together.model.dao.TogetherBoardDao;
import com.udong.common.JDBCTemplate;

public class TogetherBoardService {

	public int selectTogetherListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new TogetherBoardDao().selectTogetherListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

}
