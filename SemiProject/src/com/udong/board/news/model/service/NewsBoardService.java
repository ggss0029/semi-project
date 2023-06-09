package com.udong.board.news.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.food.model.dao.FoodBoardDao;
import com.udong.board.food.model.vo.FoodBoard;
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

	//게시글 하나 조회하는 메소드
	public NewsBoard selectNews(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		NewsBoard nb = new NewsBoardDao().selectNews(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return nb;
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

	//댓글 수정
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

	public ArrayList<NewsBoard> newsBoardSearch(PageInfo pi, String region, String category) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NewsBoard> nlist = new NewsBoardDao().newsBoardSearch(conn, pi, region, category);
		
		JDBCTemplate.close(conn);
		
		return nlist;
	}

	//동네소식 게시글 삭제
	public int deleteNewsBoard(int newsBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NewsBoardDao().deleteNewsBoard(conn, newsBoardNo);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public NewsBoard newsAllCategoryList(String category) {
		Connection conn = JDBCTemplate.getConnection();
		
		NewsBoard nb = new NewsBoardDao().newsAllCategoryList(conn,category);
		
		JDBCTemplate.close(conn);
		
		return nb;
	}

	public ArrayList<NewsBoard> selectNoNewsList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NewsBoard> nlist = new NewsBoardDao().selectNoNewsList(conn);
		
		JDBCTemplate.close(conn);
		
		return nlist;
	}

	public NewsBoard newsRegionCategoryList(String category, String region) {
		Connection conn = JDBCTemplate.getConnection();
		
		NewsBoard nb = new NewsBoardDao().newsRegionCategoryList(conn,category,region);
		
		JDBCTemplate.close(conn);
		
		return nb;
	}

	public ArrayList<NewsBoard> selectRegionNewsList(String region) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NewsBoard> nlist = new NewsBoardDao().selectRegionNewsList(conn,region);
		
		JDBCTemplate.close(conn);
		
		return nlist;
	}

	public int newsLike(int newsBoardNo, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NewsBoardDao().newsLike(conn, newsBoardNo, userNo);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
