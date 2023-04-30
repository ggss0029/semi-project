package com.udong.board.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.dao.BoardCommonDao;
import com.udong.board.faq.model.dao.FaqDao;
import com.udong.board.notice.model.dao.NoticeDao;
import com.udong.board.notice.model.vo.Notice;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class NoticeService {

	public int noticeSelectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new NoticeDao().noticeSelectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<Notice> noticeSelectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Notice> nlist = new NoticeDao().noticeSelectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return nlist;
	}

	public Notice selectNotice(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return n;
	}

	public int noticeInsertBoard(Notice n, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().noticeInsertBoard(conn, n, userNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int noticeIncreaseCount(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().noticeIncreaseCount(conn, noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int noticeDeleteBoard(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().noticeDeleteBoard(conn, boardNo);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
