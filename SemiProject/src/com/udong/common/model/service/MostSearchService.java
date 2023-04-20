package com.udong.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.common.JDBCTemplate;
import com.udong.common.model.dao.MostSearchDao;

public class MostSearchService {

	public ArrayList<String> getKeyword() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<String> mostSearch = new MostSearchDao().getKeyword(conn);
		JDBCTemplate.close(conn);
		return mostSearch;
	}

}
