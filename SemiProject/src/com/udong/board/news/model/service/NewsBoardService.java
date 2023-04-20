package com.udong.board.news.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class NewsBoardService {


	//총 게시글 개수 구하기
	public int newsSelectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new NewsBoardDao().newsSelectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	//게시글 리스트 조회
	public ArrayList<NewsBoard> newsSelectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NewsBoard> nlist = new NewsBoardDao().newsSelectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return nlist;
	}
}
