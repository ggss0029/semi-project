package com.udong.board.news.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsAttachment;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.board.news.model.vo.NewsReply;
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

	//조회수 증가 메소드
	public int newsIncreaseCount(int newsBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NewsBoardDao().newsIncreaseCount(conn, newsBoardNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	//게시글 하나 조회하는 메소드
	public NewsBoard selectNews(int newsBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		NewsBoard nb = new NewsBoardDao().selectNews(conn, newsBoardNo);
		
		JDBCTemplate.close(conn);
		
		return nb;
	}

	public NewsAttachment selectNewsAttachment(int newsBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		NewsAttachment na = new NewsBoardDao().selectNewsAttachment(conn, newsBoardNo);
		
		JDBCTemplate.close(conn);
		
		return na;
	}

	//댓글 작성
	public int newsInsertReply(NewsReply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NewsBoardDao().newsInsertReply(conn, r);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 목록 조회 메소드
	public ArrayList<NewsReply> newsSelectReply(int newsBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NewsReply> rlist = new NewsBoardDao().newsSelectReply(conn, newsBoardNo);
		
		JDBCTemplate.close(conn);
		
		return rlist;
	}

	//댓글 삭제 메소드
	public int newsDeleteReply(int newsReplyNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NewsBoardDao().newsDeleteReply(conn, newsReplyNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int newsUpdateReply(int newsReplyNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NewsBoardDao().newsUpdateReply(conn, newsReplyNo, content);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
