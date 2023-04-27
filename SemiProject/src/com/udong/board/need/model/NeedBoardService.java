package com.udong.board.need.model;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.need.dao.NeedBoardDao;
import com.udong.board.need.vo.NeedAttachment;
import com.udong.board.need.vo.NeedBoard;
import com.udong.board.need.vo.NeedReply;
import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;

public class NeedBoardService {

	public ArrayList<NeedBoard> getBoardList(String page, String searchContent) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<NeedBoard> list = new NeedBoardDao().getBoardList(conn,page,searchContent);
		JDBCTemplate.close(conn);
		
		return list;
	}


	public int getboardListCount(String searchContent) {
		Connection	conn =JDBCTemplate.getConnection();
		Integer count = new NeedBoardDao().getBoardListCount(conn , searchContent);
		JDBCTemplate.close(conn);
		
		return count;
	}


	public int deleteBoard(int boardNo) {
		Connection conn=JDBCTemplate.getConnection();
		
		int result = new NeedBoardDao().deleteBoard(conn , boardNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 추가하기
	public int insertNeedBoard(NeedBoard nb, NeedAttachment at) {
		Connection conn = JDBCTemplate.getConnection();
		 
		int result = new NeedBoardDao().insertBoard(conn,nb);
		//첨부파일이 없어도 게시글은 작성해야하니 조건 부합하게 1로	초기화해놓기
		int result2 = 1;
	
		if(at!=null) {
			result2 = new NeedBoardDao().insertAttachment(conn,at);		
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
	public int needInsertReply(NeedReply r) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NeedBoardDao().needInsertReply(conn,r);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public ArrayList<NeedReply> selectReply(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<NeedReply> list = new NeedBoardDao().selectReply(conn,bno);
		
		JDBCTemplate.close(conn);
		
		return null;
	}
}



