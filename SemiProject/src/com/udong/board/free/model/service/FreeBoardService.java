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
	//자유게시판 페이지리스트 
	public ArrayList<FreeBoard> getBoardList(String page, String searchContent ,String boardTitle, String boardContent) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<FreeBoard> list = new FreeBoardDao().getBoardList(conn,page,boardTitle,boardContent);
		JDBCTemplate.close(conn);
		
		return list;
	}

	//자유게시판 총 갯수
	public int getboardListCount(String boardTitle, String boardContent) {
		Connection	conn =JDBCTemplate.getConnection();
		
		Integer count = new FreeBoardDao().getBoardListCount(conn,boardTitle,boardContent);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	//자유게시판 게시글삭제
	public int deleteBoard(int bno) {
		Connection conn=JDBCTemplate.getConnection();
		
		int result = new FreeBoardDao().deleteBoard(conn , bno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 추가하기
	public int insertFreeBoard(FreeBoard fnb) {
		Connection conn = JDBCTemplate.getConnection();
		 
		int result = new FreeBoardDao().insertBoard(conn,fnb);
		//첨부파일이 없어도 게시글은 작성해야하니 조건 부합하게 1로	초기화해놓기
	
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;//둘중 하나라도 0이 나오면 0을 반환하게 작성하기 
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

	//자유게시판 댓글리스트
	public ArrayList<FreeReply> selectReply(int freeBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<FreeReply> list = new FreeBoardDao().selectReply(conn,freeBoardNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	//게시글 정보조회
	public FreeBoard selectFree(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		FreeBoard fb = new FreeBoardDao().selectFree(conn, boardNo);
		
		JDBCTemplate.close(conn);
		
		return fb;
	}
	//댓글수정 
	public int freeUpdateReply(int freeReplyNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FreeBoardDao().freeUpdateReply(conn,freeReplyNo,content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	//댓글 삭제
	public int freeDeleteReply(int freeReplyNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new FreeBoardDao().freeDeleteReply(conn, freeReplyNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


}



