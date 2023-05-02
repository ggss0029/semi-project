package com.udong.board.buy.model.vo;

import java.sql.Date;

public class BuyBoard {
	private int boardNo;// BOARD_NO NUMBER
	private String boardWriter;// BOARD_WRITER NUMBER --String 으로 하기
	private String boardTitle; // BOARD_TITLE VARCHAR2(100 BYTE)
	private String boardContent;// BOARD_CONTENT VARCHAR2(3900 BYTE)
	private String boardName;// BOARD_NAME VARCHAR2(50 BYTE)
	private String category;// CATEGORY VARCHAR2(50 BYTE)
	private int count;// COUNT NUMBER
	private Date createDate;// CREATE_DATE DATE
	private String region;// REGION VARCHAR2(200 BYTE)
	private String foodType;// FOOD_TYPE VARCHAR2(100 BYTE)
	private String status;// STATUS VARCHAR2(1 BYTE)
	private int boardReport;// BOARD_REPORT NUMBER
	private int likeCount; // 좋아요 수

	public BuyBoard() {
		super();
	}
	
	
	public BuyBoard(int boardNo, String boardWriter, String boardTitle, String category, String region, int count, Date createDate,
			int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.category = category;
		this.region = region;
		this.count = count;
		this.createDate = createDate;
		this.likeCount = likeCount;
	}


	//게시글 하나 조회 멤버 변수
	public BuyBoard(int boardNo, String boardTitle, String boardWriter, String boardContent, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.createDate = createDate;
	}



	//게시글 리스트 멤버변수
	public BuyBoard(int boardNo, String boardWriter, String boardTitle, int count, Date createDate, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.count = count;
		this.createDate = createDate;
		this.likeCount = likeCount;
	}



	public BuyBoard(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardName,
			String category, int count, Date createDate, String region, String foodType, String status, int boardReport,
			int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.count = count;
		this.createDate = createDate;
		this.region = region;
		this.foodType = foodType;
		this.status = status;
		this.boardReport = boardReport;
		this.likeCount = likeCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "BuyBoard [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardName=" + boardName + ", category=" + category + ", count="
				+ count + ", createDate=" + createDate + ", region=" + region + ", foodType=" + foodType + ", status="
				+ status + ", boardReport=" + boardReport + ", likeCount=" + likeCount + "]";
	}

}
