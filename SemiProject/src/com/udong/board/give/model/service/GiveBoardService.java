package com.udong.board.give.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.vo.Attachment;
import com.udong.board.give.model.dao.GiveBoardDao;
import com.udong.board.give.model.vo.GiveBoard;
import com.udong.board.give.model.vo.GiveReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class GiveBoardService {

	public int giveSelectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new GiveBoardDao().giveSelectListCount(conn);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public ArrayList<GiveBoard> selectGiveList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<GiveBoard> list = new GiveBoardDao().selectGiveList(conn,pi);
		JDBCTemplate.close(conn);
		return list;
	}

	public GiveBoard giveAllCategoryList(String category) {
		
		Connection conn = JDBCTemplate.getConnection();
		GiveBoard fb = new GiveBoardDao().giveAllCategoryList(conn,category);
		JDBCTemplate.close(conn);
		return fb;
	}

	public GiveBoard giveRegionCategoryList(String category, String region) {
		
		Connection conn = JDBCTemplate.getConnection();
		GiveBoard fb = new GiveBoardDao().giveRegionCategoryList(conn,category,region);
		JDBCTemplate.close(conn);
		return fb;
	}

	public ArrayList<GiveBoard> selectNoCTGiveList() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<GiveBoard> list = new GiveBoardDao().selectNoCTGiveList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<GiveBoard> selectRegionGiveList(String region) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<GiveBoard> list = new GiveBoardDao().selectRegionGiveList(conn,region);
		JDBCTemplate.close(conn);
		return list;
	}

	public GiveBoard selectGiveBoardDetail(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		GiveBoard fb = new GiveBoardDao().selectGiveBoardDetail(conn,boardNo);
		JDBCTemplate.close(conn);
		return fb;
	}

	public ArrayList<Attachment> selectAttachmentList(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Attachment> alist = new GiveBoardDao().selectAttachmentList(conn,boardNo);
		JDBCTemplate.close(conn);
		return alist;
	}

	public int giveInsertReply(GiveReply gr, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new GiveBoardDao().giveInsertReply(conn, gr, userNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<GiveReply> giveSelectReply(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<GiveReply> rlist = new GiveBoardDao().giveSelectReply(conn, boardNo);
		JDBCTemplate.close(conn);
		return rlist;
	}

	public int giveDeleteReply(int replyNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new GiveBoardDao().giveDeleteReply(conn, replyNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int giveUpdateReply(int replyNo, String content) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new GiveBoardDao().giveUpdateReply(conn, replyNo, content);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
