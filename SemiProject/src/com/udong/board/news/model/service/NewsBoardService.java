package com.udong.board.news.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;

public class NewsBoardService {

	public ArrayList<NewsBoard> newsSelectList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NewsBoard> nlist = new NewsBoardDao().newsSelectList(conn);
		
		JDBCTemplate.close(conn);
		
		return nlist;
	}

}
