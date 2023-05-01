package com.udong.board.food.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.vo.Attachment;
import com.udong.board.food.model.dao.FoodBoardDao;
import com.udong.board.food.model.vo.FoodBoard;
import com.udong.board.food.model.vo.FoodReply;
import com.udong.board.news.model.dao.NewsBoardDao;
import com.udong.board.news.model.vo.NewsReply;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;

public class FoodBoardService {

	public int foodSelectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new FoodBoardDao().foodSelectListCount(conn);
		JDBCTemplate.close(conn);
		return listCount;
	}

	public ArrayList<FoodBoard> selectFoodList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FoodBoard> list = new FoodBoardDao().selectFoodList(conn,pi);
		JDBCTemplate.close(conn);
		return list;
	}

	public FoodBoard foodAllCategoryList(String category) {
		
		Connection conn = JDBCTemplate.getConnection();
		FoodBoard fb = new FoodBoardDao().foodAllCategoryList(conn,category);
		JDBCTemplate.close(conn);
		return fb;
	}

	public FoodBoard foodRegionCategoryList(String category, String region) {
		
		Connection conn = JDBCTemplate.getConnection();
		FoodBoard fb = new FoodBoardDao().foodRegionCategoryList(conn,category,region);
		JDBCTemplate.close(conn);
		return fb;
	}

	public ArrayList<FoodBoard> selectNoCTFoodList() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FoodBoard> list = new FoodBoardDao().selectNoCTFoodList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<FoodBoard> selectRegionFoodList(String region) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FoodBoard> list = new FoodBoardDao().selectRegionFoodList(conn,region);
		JDBCTemplate.close(conn);
		return list;
	}

	public FoodBoard selectFoodBoardDetail(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		FoodBoard fb = new FoodBoardDao().selectFoodBoardDetail(conn,boardNo);
		JDBCTemplate.close(conn);
		return fb;
	}

	public ArrayList<Attachment> selectAttachmentList(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Attachment> alist = new FoodBoardDao().selectAttachmentList(conn,boardNo);
		JDBCTemplate.close(conn);
		return alist;
	}

	public int foodInsertReply(FoodReply fr, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new FoodBoardDao().foodInsertReply(conn, fr, userNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<FoodReply> foodSelectReply(int boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FoodReply> rlist = new FoodBoardDao().foodSelectReply(conn, boardNo);
		JDBCTemplate.close(conn);
		return rlist;
	}

	public int foodDeleteReply(int replyNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new FoodBoardDao().foodDeleteReply(conn, replyNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int foodUpdateReply(int replyNo, String content) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new FoodBoardDao().foodUpdateReply(conn, replyNo, content);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
