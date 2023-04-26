package com.udong.board.need.model;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.need.dao.NeedBoardDao;
import com.udong.board.need.vo.NeedBoard;
import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;

public class NeedBoardService {

	public ArrayList<NeedBoard> getBoardList(String page, String searchContent) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<NeedBoard> list = new NeedBoardDao().getBoardList(conn,page,searchContent);
		JDBCTemplate.close(conn);
		
		return list;
	}


	public int getboardListCount(String searchContent) {
		Connection	conn =JDBCTemplate.getConnection();
		Integer count = new NeedBoardDao().getBoardListCount(conn , searchContent);
		JDBCTemplate.close(conn);
		
		return count;
	}



}
