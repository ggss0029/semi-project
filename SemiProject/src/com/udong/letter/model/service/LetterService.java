package com.udong.letter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;
import com.udong.letter.model.dao.LetterDao;
import com.udong.letter.model.vo.Letter;

public class LetterService {

	public int sendLetter(Letter le) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new LetterDao().sendLetter(conn,le);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int selectsendLetterListCount(int writerNo) {

		Connection conn = JDBCTemplate.getConnection();
		int listCount = new LetterDao().selectsendLetterListCount(conn,writerNo);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public ArrayList<Letter> sendLetterList(int writerNo, PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Letter> list = new LetterDao().sendLetterList(conn,writerNo,pi);
		JDBCTemplate.close(conn);
		return list;
	}


}
