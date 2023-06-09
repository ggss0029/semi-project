
package com.udong.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.udong.board.news.model.vo.NewsBoard;
import com.udong.common.JDBCTemplate;
import com.udong.common.model.vo.PageInfo;
import com.udong.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		try {
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int checkInfo(Connection conn, String inputId, String inputPwd) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("loginCheck");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,inputId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) { //입력한 아이디가 db에 존재하는 아이디 일때 rset에는 그 아이디에 해당하는 비번이 담겨서 옴
				if(!rset.getString("USER_PWD").equals(inputPwd)) {
					result=1; //비번만 다를때
				}
				if(rset.getString("USER_PWD").equals(inputPwd)) {
					result=2; //로그인 가능
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member loginUser = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(
						 rset.getInt("USER_NO")
						,rset.getString("USER_ID")
						,rset.getString("USER_PWD")
						,rset.getString("USER_NAME")
						,rset.getString("NICKNAME")
						,rset.getString("BIRTHDAY")
						,rset.getString("GENDER")
						,rset.getString("INTRODUCTION")
						,rset.getString("EMAIL")
						,rset.getString("ADDRESS")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("ADMIN")
						,rset.getInt("USER_REPORT")
						,rset.getInt("LOGIN_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return loginUser;
	}

	public Member checkKakao(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member kakaologinUser = null;
		String sql = prop.getProperty("checkKakao");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getEmail());
			pstmt.setInt(2, m.getLoginType());
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				kakaologinUser = new Member(
						 rset.getInt("USER_NO")
						,rset.getString("USER_ID")
						,rset.getString("USER_PWD")
						,rset.getString("USER_NAME")
						,rset.getString("NICKNAME")
						,rset.getString("BIRTHDAY")
						,rset.getString("GENDER")
						,rset.getString("INTRODUCTION")
						,rset.getString("EMAIL")
						,rset.getString("ADDRESS")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("ADMIN")
						,rset.getInt("USER_REPORT")
						,rset.getInt("LOGIN_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return kakaologinUser;
	}

	public Member findId(Connection conn, String inputName, String inputEmail) {

		Member findUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findId");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputName);
			pstmt.setString(2, inputEmail);
			rset=pstmt.executeQuery();
			
			if(rset.next()) { // 입력한 이메일과 이름이 등록 정보와 맞을 경우
				findUser = new Member(
						 rset.getInt("USER_NO")
						,rset.getString("USER_ID")
						,rset.getString("USER_PWD")
						,rset.getString("USER_NAME")
						,rset.getString("NICKNAME")
						,rset.getString("BIRTHDAY")
						,rset.getString("GENDER")
						,rset.getString("INTRODUCTION")
						,rset.getString("EMAIL")
						,rset.getString("ADDRESS")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("ADMIN")
						,rset.getInt("USER_REPORT")
						,rset.getInt("LOGIN_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return findUser;
	}

	public Member findPwd(Connection conn, String inputId, String inputEmail) {

		Member findUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputEmail);
			rset=pstmt.executeQuery();
			
			if(rset.next()) { // 입력한 이메일과 이름이 등록 정보와 맞을 경우
				findUser = new Member(
						 rset.getInt("USER_NO")
						,rset.getString("USER_ID")
						,rset.getString("USER_PWD")
						,rset.getString("USER_NAME")
						,rset.getString("NICKNAME")
						,rset.getString("BIRTHDAY")
						,rset.getString("GENDER")
						,rset.getString("INTRODUCTION")
						,rset.getString("EMAIL")
						,rset.getString("ADDRESS")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("ADMIN")
						,rset.getInt("USER_REPORT")
						,rset.getInt("LOGIN_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return findUser;
	}

	public int changePwd(Connection conn, String resetPwd, String inputId) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changePwd");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, resetPwd);
			pstmt.setString(2, inputId);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member checkNaver(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member naverloginUser = null;
		String sql = prop.getProperty("checkNaver");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getEmail());
			pstmt.setInt(2, m.getLoginType());
			pstmt.setString(3, m.getUserName());
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				naverloginUser = new Member(
						 rset.getInt("USER_NO")
						,rset.getString("USER_ID")
						,rset.getString("USER_PWD")
						,rset.getString("USER_NAME")
						,rset.getString("NICKNAME")
						,rset.getString("BIRTHDAY")
						,rset.getString("GENDER")
						,rset.getString("INTRODUCTION")
						,rset.getString("EMAIL")
						,rset.getString("ADDRESS")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("ADMIN")
						,rset.getInt("USER_REPORT")
						,rset.getInt("LOGIN_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return naverloginUser;
	}
	
	public int checkId(Connection conn, String inputId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}

	public int checkNickname(Connection conn, String inputNickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("checkNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputNickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}

	public int checkEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}
	
	public ArrayList<Member> getMemberList(Connection conn, String page, String userId, String email) {
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Integer offset = 0;
		Integer Limit = 11;
		String sql = prop.getProperty("MemberList");
		
		
		 if(userId != null) {
			sql = prop.getProperty("MemberListWithUserId");
		}
		
		
		  if(email !=null) {
			  sql = prop.getProperty("MemberListWithEmail");
		  }
		 
		
		if(page != null && !page.equals("1")) {
			offset = (Integer.parseInt(page)-1) * 11 + 1;
			Limit = (Integer.parseInt(page)*11);
		}
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			if (userId != null) {
				pstmt.setString(1, userId);
			}else if(email !=null) {
				pstmt.setString(1, email);
			}else {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, Limit);
			}
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Member member = new Member();
				member.setUserNo(rset.getInt("USER_NO"));
				member.setUserId(rset.getString("USER_ID"));
				member.setUserName(rset.getString("USER_NAME"));
				member.setBirthday(rset.getString("BIRTHDAY"));
				member.setEmail(rset.getString("EMAIL"));
				member.setAddress(rset.getString("ADDRESS"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				
				memberList.add(member);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return memberList;
	}

	public Integer getMemberListCount(Connection conn) {
		
		Integer count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMemberListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}

	public int enrollMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getBirthday());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			pstmt.setInt(9, m.getLoginType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> getBlackList(Connection conn, String page) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Integer offset = 0;
		Integer Limit = 15;
		String sql = prop.getProperty("BlackList");
		  
		if(page != null && !page.equals("1")) {
			offset = (Integer.parseInt(page)-1) * 15 + 1;
			Limit = (Integer.parseInt(page)*15);
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, Limit);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUserNo(rset.getInt("USER_NO"));
				member.setEmail(rset.getString("EMAIL"));
				
				list.add(member);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public Integer getBlackListCount(Connection conn) {
		
		Integer count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBlackListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}

	public int userDelete(Connection conn,String userId,String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userDelete");
		
//			이름 성별 생년월일 아이디 비밀번호
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}
	
	public int blackUpdate(Connection conn, String userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("blackUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int MemberListDelete(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("MemberListDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> searchNickname(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();
		String sql = prop.getProperty("searchNickname");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("USER_NO"),rset.getString("NICKNAME"),rset.getString("ADDRESS"),rset.getDate("ENROLL_DATE")));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public Member findNickname(Connection conn, String inputNickname) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String sql = prop.getProperty("findNickname");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputNickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),rset.getString("NICKNAME"),rset.getString("ADDRESS"),rset.getDate("ENROLL_DATE"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	public Member profile(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = new Member();
		String sql = prop.getProperty("profile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m.setNickname(rset.getString("NICKNAME"));
				m.setBirthday(rset.getString("AGE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setIntroduction(rset.getString("INTRODUCTION"));
				m.setRecommended(rset.getInt("RECOMMENDED"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}

	public int myInfoUpdate(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("myInfoUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getAddress());
			pstmt.setString(3, m.getIntroduction());
			pstmt.setString(4, m.getUserId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	
	public Member myInfoSelectMember(Connection conn, String userId) {
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("myInfoSelectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO")
								,rset.getString("USER_ID")
								,rset.getString("USER_PWD")
								,rset.getString("USER_NAME")
								,rset.getString("NICKNAME")
								,rset.getString("BIRTHDAY")
								,rset.getString("GENDER")
								,rset.getString("INTRODUCTION")
								,rset.getString("EMAIL")
								,rset.getString("ADDRESS")
								,rset.getDate("ENROLL_DATE")
								,rset.getString("STATUS")
								,rset.getString("ADMIN")
								,rset.getInt("USER_REPORT")
								,rset.getInt("LOGIN_TYPE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return m;
	}

	public int updatePwd(Connection conn, String userId, String updatePwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int checkRecommend(Connection conn, String myNickname, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int check = 0;
		String sql = prop.getProperty("checkRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, myNickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return check;
	}
	
	//개인 정보 수정의 닉네임 중복확인
		public int chkNickName(Connection conn, String checkNick) {
			int count = 0;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("checkNick");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, checkNick);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					count = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return count;
		}

	public int recommend(Connection conn, String myNickname, String nickname) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("recommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myNickname);
			pstmt.setString(2, nickname);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int getRecommend(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("getRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}

	//내가 좋아요한 게시글 개수 구하기
	public int likeSelectListCount(Connection conn, int userNo) {
		int listCount = 0;
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likeSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int unrecommend(Connection conn, String myNickname, String nickname) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("unrecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myNickname);
			pstmt.setString(2, nickname);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	

	

}
