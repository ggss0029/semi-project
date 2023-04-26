package com.udong.letter.model.vo;

import java.sql.Date;

public class Letter {

	private int letterNo; //LETTER_NO	NUMBER
	private String letterWriter; //LETTER_WRITER	NUMBER
	private String letterReceiver; //LETTER_RECEIVER	NUMBER
	private String letterContent; //LETTER_CONTENT	VARCHAR2(900 BYTE)
	private Date writeDate; //WRITE_DATE	DATE
	
	public Letter() {
		super();
	}

	public Letter(int letterNo, String letterWriter, String letterReceiver, String letterContent, Date writeDate) {
		super();
		this.letterNo = letterNo;
		this.letterWriter = letterWriter;
		this.letterReceiver = letterReceiver;
		this.letterContent = letterContent;
		this.writeDate = writeDate;
	}

	public int getLetterNo() {
		return letterNo;
	}

	public void setLetterNo(int letterNo) {
		this.letterNo = letterNo;
	}

	public String getLetterWriter() {
		return letterWriter;
	}

	public void setLetterWriter(String letterWriter) {
		this.letterWriter = letterWriter;
	}

	public String getLetterReceiver() {
		return letterReceiver;
	}

	public void setLetterReceiver(String letterReceiver) {
		this.letterReceiver = letterReceiver;
	}

	public String getLetterContent() {
		return letterContent;
	}

	public void setLetterContent(String letterContent) {
		this.letterContent = letterContent;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Letter [letterNo=" + letterNo + ", letterWriter=" + letterWriter + ", letterReceiver=" + letterReceiver
				+ ", letterContent=" + letterContent + ", writeDate=" + writeDate + "]";
	}
	
	
}
