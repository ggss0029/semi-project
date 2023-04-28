package com.udong.board.food.model.service;

import java.sql.Connection;

import com.udong.board.food.model.dao.FoodBoardDao;
import com.udong.common.JDBCTemplate;

public class FoodBoardService {

	public int foodSelectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new FoodBoardDao().foodSelectListCount(conn);
		JDBCTemplate.close(conn);
		return listCount;
	}

}
