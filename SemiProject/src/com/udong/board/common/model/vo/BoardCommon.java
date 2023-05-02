package com.udong.board.common.model.vo;

import java.sql.Date;

public class BoardCommon {

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
	private String nickname;
	private int likeCount;
	private String img;
	
	public BoardCommon() {
		super();
	}

	
	
	public BoardCommon(String boardTitle, String boardContent, String boardName, String category, String region) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.region = region;
	}



	public BoardCommon(String boardWriter, String boardTitle, String boardContent, String boardName, String category, String region) {
		super();
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.region = region;
	}

	public BoardCommon(String boardContent, int boardNo, String boardWriter, String boardName, int count, Date createDate,
			int likeCount) {
		super();
		this.boardContent = boardContent;
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardName = boardName;
		this.count = count;
		this.createDate = createDate;
		this.likeCount = likeCount;
	}

	public BoardCommon(int boardNo, String boardWriter, String boardTitle, String boardName, int count, Date createDate,
			int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardName = boardName;
		this.count = count;
		this.createDate = createDate;
		this.likeCount = likeCount;
	}



	public BoardCommon(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardName,
			String category, int count, Date createDate, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.category = category;
		this.count = count;
		this.createDate = createDate;
		this.likeCount = likeCount;
	}

	public BoardCommon(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardName,
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

	public BoardCommon(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardName,
			String category, int count, Date createDate, String status, int boardReport, int boardLikeNo,
			String nickname, int likeCount) {
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
		this.nickname = nickname;
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getLikeCount() {
		return likeCount;
	}



	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}



	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardName=" + boardName + ", category=" + category + ", count="
				+ count + ", createDate=" + createDate + ", status=" + status + ", boardReport=" + boardReport
				+ ", boardLikeNo=" + boardLikeNo + ", nickname=" + nickname + "]";
	}
	
	
}
