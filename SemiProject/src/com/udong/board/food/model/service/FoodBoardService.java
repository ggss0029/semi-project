package com.udong.board.food.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.food.model.dao.FoodBoardDao;
import com.udong.board.food.model.vo.FoodBoard;
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

}
