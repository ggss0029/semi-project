package com.udong.board.buy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.buy.model.dao.BuyDao;
import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.buy.model.vo.BuyReply;
import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class BuyService {

	//총 게시글 개수 구하기
	public int buySelectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new BuyDao().buySelectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	//게시글 리스트 조회
	public ArrayList<BuyBoard> buySelectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BuyBoard> blist = new BuyDao().buySelectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return blist;
	}

	//게시글 하나 조회하는 메소드
		public BuyBoard selectBuy(int boardNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			BuyBoard buyb = new BuyDao().selectBuy(conn, boardNo);
			
			JDBCTemplate.close(conn);
			
			return buyb;
		}

	//댓글 작성
	public int buyInsertReply(BuyReply r) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BuyDao().buyInsertReply(conn, r);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		}

	//댓글 목록
	public ArrayList<BuyReply> buySelectReply(int buyBoardNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<BuyReply> blist = new BuyDao().buySelectReply(conn, buyBoardNo);
			
			JDBCTemplate.close(conn);
			
			return blist;
		}

	//댓글 삭제
	public int buyDeleteReply(int buyReplyNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BuyDao().buyDeleteReply(conn, buyReplyNo);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			return result;

		}

	public int buyUpdateReply(int buyBoardNo, String content) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BuyDao().buyUpdateReply(conn, buyBoardNo, content);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		}

	public BuyBoard buyAllCategoryList(String category) {
		Connection conn = JDBCTemplate.getConnection();
		
		BuyBoard buyb = new BuyDao().buyAllCategoryList(conn,category);
		
		JDBCTemplate.close(conn);
		
		return buyb;
	}

	public ArrayList<BuyBoard> selectNoBuyList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BuyBoard> blist = new BuyDao().selectNoBuyList(conn);
		
		JDBCTemplate.close(conn);
		
		return blist;
	}

	public BuyBoard buyRegionCategoryList(String category, String region) {
		Connection conn = JDBCTemplate.getConnection();
		
		BuyBoard buyb = new BuyDao().buyRegionCategoryList(conn,category,region);
		
		JDBCTemplate.close(conn);
		
		return buyb;
	}

	public ArrayList<BuyBoard> selectRegionBuyList(String region) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<BuyBoard> blist = new BuyDao().selectRegionBuyList(conn,region);
		
		JDBCTemplate.close(conn);
		
		return blist;
	}

}
