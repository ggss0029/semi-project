package com.udong.board.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.dao.BoardCommonDao;
import com.udong.board.common.model.vo.BoardCommon;
import com.udong.common.JDBCTemplate;

public class BoardCommonService {
	
	//인기글 조회해오기
	public ArrayList<BoardCommon> bestPostList() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardCommon> list = new BoardCommonDao().bestPostList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
