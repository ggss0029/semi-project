package com.udong.board.faq.model.vo;

import java.sql.Date;

public class FaqBoard {
	private int faqNo;// FAQ_NO NUMBER
	private String faqTitle;// FAQ_TITLE VARCHAR2(100 BYTE)
	private String faqContent;// FAQ_CONTENT VARCHAR2(3900 BYTE)
	private Date createDate;// CREATE_DATE DATE
	private String status;// STATUS VARCHAR2(1 BYTE)

	public FaqBoard() {
		super();
	}
	

	public FaqBoard(int faqNo, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}


	public FaqBoard(int faqNo, String faqTitle, String faqContent, Date createDate, String status) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.createDate = createDate;
		this.status = status;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
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

	@Override
	public String toString() {
		return "FaqBoard [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", createDate="
				+ createDate + ", status=" + status + "]";
	}

}
