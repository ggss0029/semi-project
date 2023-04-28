package com.udong.board.clean.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.clean.model.dao.CleanDao;
import com.udong.board.clean.model.vo.CleanBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class CleanService {

	//총 게시글 개수 구하기
	public int cleanSelectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new CleanDao().cleanSelectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
		
	}
	
	//게시글 리스트 조회
	public ArrayList<CleanBoard> cleanSelectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CleanBoard> clist = new CleanDao().cleanSelectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return clist;
	}

	//게시글 하나 조회하는 메소드
	public CleanBoard selectClean(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		CleanBoard cb = new CleanDao().selectClean(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return cb;
	}


}
