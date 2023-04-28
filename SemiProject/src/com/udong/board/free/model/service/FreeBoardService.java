package com.udong.board.free.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.free.model.dao.FreeBoardDao;
import com.udong.board.free.model.vo.FreeAttachment;
import com.udong.board.free.model.vo.FreeBoard;
import com.udong.board.free.model.vo.FreeReply;
import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;

public class FreeBoardService {

	public ArrayList<FreeBoard> getBoardList(String page, String searchContent) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<FreeBoard> list = new FreeBoardDao().getBoardList(conn,page,searchContent);
		JDBCTemplate.close(conn);
		
		return list;
	}


	public int getboardListCount(String searchContent) {
		Connection	conn =JDBCTemplate.getConnection();
		Integer count = new FreeBoardDao().getBoardListCount(conn , searchContent);
		JDBCTemplate.close(conn);
		
		return count;
	}


	public int deleteBoard(int boardNo) {
		Connection conn=JDBCTemplate.getConnection();
		
		int result = new FreeBoardDao().deleteBoard(conn , boardNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 추가하기
	public int insertFreeBoard(FreeBoard nb, FreeAttachment at) {
		Connection conn = JDBCTemplate.getConnection();
		 
		int result = new FreeBoardDao().insertBoard(conn,nb);
		//첨부파일이 없어도 게시글은 작성해야하니 조건 부합하게 1로	초기화해놓기
		int result2 = 1;
	
		if(at!=null) {
			result2 = new FreeBoardDao().insertAttachment(conn,at);		
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;//둘중 하나라도 0이 나오면 0을 반환하게 작성하기 
	}

	//댓글 작성 기능
	public int FreeInsertReply(FreeReply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FreeBoardDao().FreeInsertReply(conn,r);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public ArrayList<FreeReply> selectReply(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<FreeReply> list = new FreeBoardDao().selectReply(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return null;
	}


	public FreeBoard selectFreeBoard(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		FreeBoard fb = new FreeBoardDao().selectBoard(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return fb;
	}


	public FreeAttachment selectFreeAttachment(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		FreeAttachment fat = new FreeBoardDao().selectAttachment(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return fat;
	}


	public int increaseCount(int bno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FreeBoardDao().increaseCount(conn,bno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.close(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}



}



