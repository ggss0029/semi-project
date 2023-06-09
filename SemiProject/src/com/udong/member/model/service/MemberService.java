package com.udong.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.udong.board.common.model.vo.Attachment;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;
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
	public ArrayList<Member> getBlackList(String page) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().getBlackList(conn , page);
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}
	
	public int blackUpdate(String userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().blackUpdate(conn, userNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		return result;
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


	public int getBlackListCount() {
		Connection	conn =JDBCTemplate.getConnection();
		Integer count = new MemberDao().getBlackListCount(conn);
		JDBCTemplate.close(conn);
		
		return count;
	}

	public int userDelete(String userId, String userPwd) {

			Connection conn = JDBCTemplate.getConnection();
			int result = new MemberDao().userDelete(conn,userId,userPwd);
			
			if(result>0) { //DML구문이니 트랜잭션 
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		
	}

	public int MemberListDelete(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().MemberListDelete(conn, userId);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Member> searchNickname() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().searchNickname(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Member findNickname(String inputNickname) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().findNickname(conn,inputNickname);
		JDBCTemplate.close(conn);

		return m;
	}
	
		public Member profile(String myNickname, String nickname) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().profile(conn, nickname);
		int check = new MemberDao().checkRecommend(conn, myNickname, nickname);
		m.setCheckRec(check);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	//개인 정보 수정
	public Member myInfoUpdate(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().myInfoUpdate(conn, m);
		
		//변경된 회원 정보를 세션에 담아야하기 대문에 다시 조회
		Member updateMem = null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			
			//변경된 정보조회 해보기
			updateMem = new MemberDao().myInfoSelectMember(conn, m.getUserId());
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}

	public Member updatePwd(String userId, String updatePwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updatePwd(conn, userId, updatePwd);
		
		Member m = null;
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			m = new MemberDao().myInfoSelectMember(conn, userId); //성공시 갱신할 회원정보 조회
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	public int recommend(String myNickname, String nickname) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().recommend(conn, myNickname, nickname);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		int count = new MemberDao().getRecommend(conn, nickname);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	

	//개인 정보 수정의 닉네임 중복확인
	public int chkNickName(String checkNick) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().chkNickName(conn, checkNick);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	//좋아요한 게시글 총  개수 구하기
	public int likeSelectListCount(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new MemberDao().likeSelectListCount(conn, userNo);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public int unrecommend(String myNickname, String nickname) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().unrecommend(conn, myNickname, nickname);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		int count = new MemberDao().getRecommend(conn, nickname);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

}
