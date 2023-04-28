package com.udong.board.food.model.vo;

import java.sql.Date;

public class FoodBoard {

	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardName;
	private String category;
	private String region;
	private int count;
	private Date createDate;
	private String status;
	private int boardReport;
	private int boardLikeNo;
	private int likeCount;
	private String titleImg;
	
	public FoodBoard() {
		super();
	}
	
	

	public FoodBoard(int boardNo, String boardWriter, String boardTitle, String category, String region, int count,
			Date createDate, int boardReport, int likeCount, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.category = category;
		this.region = region;
		this.count = count;
		this.createDate = createDate;
		this.boardReport = boardReport;
		this.likeCount = likeCount;
		this.titleImg = titleImg;
	}



	public FoodBoard(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardName,
			String category, String region, int count, Date createDate, int boardReport, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.region = region;
		this.count = count;
		this.createDate = createDate;
		this.boardReport = boardReport;
		this.likeCount = likeCount;
	}



	public FoodBoard(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardName,
			String category, String region, int count, Date createDate, String status, int boardReport, int boardLikeNo,
			int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.region = region;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.boardReport = boardReport;
		this.boardLikeNo = boardLikeNo;
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getTitleImg() {
		return titleImg;
	}
	
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}



	@Override
	public String toString() {
		return "FoodBoard [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardName=" + boardName + ", category=" + category + ", region="
				+ region + ", count=" + count + ", createDate=" + createDate + ", status=" + status + ", boardReport="
				+ boardReport + ", boardLikeNo=" + boardLikeNo + ", likeCount=" + likeCount + "]";
	}
	
	
}
