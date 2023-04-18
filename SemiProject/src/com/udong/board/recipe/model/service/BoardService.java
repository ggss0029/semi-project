package com.udong.board.recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.recipe.model.dao.BoardDao;
import com.udong.board.recipe.model.vo.Board;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BoardService {
	
	
	
	//총 게시글 구하는 메소드 
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//처리된 행수가 아닌 총 게시글의 개수
		int listCount = new BoardDao().selectListCount(conn);
		
		return listCount;
	}

	

	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		JDBCTemplate.close(conn);
		
		return list;
	}



	//제목 + 작성자 키워드로 검색하는 기능
	public ArrayList<Board> selectListbyKeyword(PageInfo pi, String keyword) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectListbyKeyword(conn, pi, keyword);
		JDBCTemplate.close(conn);
		
		return list;
	}


}
