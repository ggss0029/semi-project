package com.udong.board.faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.buy.model.dao.BuyDao;
import com.udong.board.buy.model.vo.BuyBoard;
import com.udong.board.faq.model.dao.FaqDao;
import com.udong.board.faq.model.vo.FaqBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class FaqService {

	public int faqSelectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new FaqDao().faqSelectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
		
	}

	public ArrayList<FaqBoard> faqSelectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<FaqBoard> flist = new FaqDao().faqSelectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return flist;
	}

	public int faqInsertBoard(FaqBoard fb) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FaqDao().faqInsertBoard(conn, fb);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int faqDeleteBoard(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FaqDao().faqDeleteBoard(conn, boardNo);
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 하나 조회
	public FaqBoard selectFaq(int faqNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		FaqBoard fb = new FaqDao().selectFaq(conn, faqNo);
		
		JDBCTemplate.close(conn);
		
		return fb;
	}

	public int updateFaq(FaqBoard fb) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FaqDao().updateFaq(conn, fb);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

}
