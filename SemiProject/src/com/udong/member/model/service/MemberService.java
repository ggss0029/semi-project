package com.udong.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.common.JDBCTemplate;
import com.udong.member.model.dao.MemberDao;
import com.udong.member.model.vo.Member;

public class MemberService {

	public int checkInfo(String inputId,String inputPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().checkInfo(conn,inputId,inputPwd);
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public Member loginMember(String inputId, String inputPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member loginUser = new MemberDao().loginMember(conn,inputId,inputPwd);
		JDBCTemplate.close(conn);
		
		return loginUser;
	}

	public Member checkKakao(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member kakaologinUser = new MemberDao().checkKakao(conn,m);
		JDBCTemplate.close(conn);
		
		return kakaologinUser;
	}

	public Member findId(String inputName, String inputEmail) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member findUser = new MemberDao().findId(conn,inputName,inputEmail);
		JDBCTemplate.close(conn);
		
		return findUser;
	}

	public Member findPwd(String inputId, String inputEmail) {

		Connection conn = JDBCTemplate.getConnection();
		Member findUser = new MemberDao().findPwd(conn,inputId,inputEmail);
		JDBCTemplate.close(conn);
		
		return findUser;
	}

	public int changePwd(String resetPwd, String inputId) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().changePwd(conn,resetPwd,inputId);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Member checkNaver(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member naverloginUser = new MemberDao().checkNaver(conn,m);
		JDBCTemplate.close(conn);
		
		return naverloginUser;
	}
	
	public int checkId(String inputId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().checkId(conn, inputId);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	public int checkNickname(String inputNickname) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().checkNickname(conn, inputNickname);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	
	public int checkEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().checkEmail(conn, email);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	public ArrayList<Member> getMemberList(String page, String userId, String email) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().getMemberList(conn , page ,userId ,email);
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Integer getMemberListCount() {
		Connection	conn =JDBCTemplate.getConnection();
		Integer count = new MemberDao().getMemberListCount(conn);
		JDBCTemplate.close(conn);
		
		return count;
	}

	public int enrollMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().enrollMember(conn, m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Member> getBlackList(String page) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> blacklist = new MemberDao().getBlackList(conn , page);
		JDBCTemplate.close(conn);
		
		return blacklist;

		
	}

	public int getBlackListCount() {
		Connection	conn =JDBCTemplate.getConnection();
		Integer count = new MemberDao().getBlackListCount(conn);
		JDBCTemplate.close(conn);
		
		return count;
	}


}
