package com.udong.board.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;// NOTICE_NO NUMBER
	private String noticeTitle;// NOTICE_TITLE VARCHAR2(100 BYTE)
	private String noticeContent;// NOTICE_CONTENT VARCHAR2(3900 BYTE)
	private String noticeWriter;// NOTICE_WRITER NUMBER
	private int count;// COUNT NUMBER
	private Date creatDate;// CREATE_DATE DATE
	private String status;// STATUS VARCHAR2(1 BYTE)

	public Notice() {
		super();
	}


	public Notice(String noticeTitle, String noticeContent, String noticeWriter) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
	}



	public Notice(int noticeNo,  String noticeTitle, String noticeWriter, String noticeContent,  Date creatDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.creatDate = creatDate;
	}



	public Notice(int noticeNo, String noticeWriter, String noticeTitle, int count, Date creatDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.count = count;
		this.creatDate = creatDate;
	}



	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, int count,
			Date creatDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.creatDate = creatDate;
		this.status = status;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", count=" + count + ", creatDate=" + creatDate + ", status="
				+ status + "]";
	}

}
