package com.udong.board.recipe.model.vo;

import java.sql.Date;

public class Board {

//	BOARD_NO	NUMBER
//	BOARD_WRITER	NUMBER
//	BOARD_TITLE	VARCHAR2(100 BYTE)
//	BOARD_CONTENT	VARCHAR2(3900 BYTE)
//	BOARD_NAME	VARCHAR2(50 BYTE)
//	CATEGORY	VARCHAR2(50 BYTE)
//	COUNT	NUMBER
//	CREATE_DATE	DATE
//	REGION	VARCHAR2(200 BYTE) 안씀
//	FOOD_TYPE	VARCHAR2(100 BYTE)  안씀
//	STATUS	VARCHAR2(1 BYTE)
//	BOARD_REPORT	NUMBER
	
	//자취게시판 VO 
	
	private int boardNo;
	private int boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardName;
	private String category;
	private int count;
	private Date createDate;
	private String status;
	private int boardReport;
	
	//좋아요 갯수 vo
	private int boardLikeNo;
	//유저닉네임
	private String nickName;
	
	public Board() {
		super();
	}

	public Board(int boardNo, int boardWriter, String boardTitle, String boardContent, String boardName,
			String category, int count, Date createDate, String status, int boardReport, int boardLikeNo) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.boardReport = boardReport;
		this.boardLikeNo = boardLikeNo;
	}



	public Board(int boardNo, String nickName, String boardTitle, String category, int count, Date createDate, int boardLikeNo) {
		super();
		this.boardNo = boardNo;
		this.nickName = nickName;
		this.boardTitle = boardTitle;
		this.category = category;
		this.count = count;
		this.createDate = createDate;
		this.boardLikeNo = boardLikeNo;
	}
	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public String getBoardName() {
		return boardName;
	}


	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getBoardReport() {
		return boardReport;
	}


	public void setBoardReport(int boardReport) {
		this.boardReport = boardReport;
	}

	
	
	

	public int getBoardLikeNo() {
		return boardLikeNo;
	}


	public void setBoardLikeNo(int boardLikeNo) {
		this.boardLikeNo = boardLikeNo;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardName=" + boardName + ", category=" + category + ", count="
				+ count + ", createDate=" + createDate + ", status=" + status + ", boardReport=" + boardReport
				+ ", boardLikeNo=" + boardLikeNo + "]";
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
