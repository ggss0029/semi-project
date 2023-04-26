package com.udong.letter.model.vo;

import java.sql.Date;

public class Letter {

	private int letterNo; //LETTER_NO	NUMBER
	private String letterWriter; //LETTER_WRITER	NUMBER
	private int letterWriterNo; //값 전달용
	private String letterReceiver; //LETTER_RECEIVER	NUMBER
	private int letterReceiverNo; //값 전달용
	private String letterContent; //LETTER_CONTENT	VARCHAR2(900 BYTE)
	private Date writeDate; //WRITE_DATE	DATE
	
	public Letter() {
		super();
	}

	
	
	public Letter(int letterNo, String letterReceiver, String letterContent, Date writeDate) {
		super();
		this.letterNo = letterNo;
		this.letterReceiver = letterReceiver;
		this.letterContent = letterContent;
		this.writeDate = writeDate;
	}

	public Letter(String letterWriter, int letterNo, String letterContent, Date writeDate) {
		super();
		this.letterWriter = letterWriter;
		this.letterNo = letterNo;
		this.letterContent = letterContent;
		this.writeDate = writeDate;
	}



	public Letter(int letterWriterNo, int letterReceiverNo, String letterContent) {
		super();
		this.letterWriterNo = letterWriterNo;
		this.letterReceiverNo = letterReceiverNo;
		this.letterContent = letterContent;
	}

	public Letter(int letterNo, String letterWriter, int letterWriterNo, String letterReceiver, int letterReceiverNo,
			String letterContent, Date writeDate) {
		super();
		this.letterNo = letterNo;
		this.letterWriter = letterWriter;
		this.letterWriterNo = letterWriterNo;
		this.letterReceiver = letterReceiver;
		this.letterReceiverNo = letterReceiverNo;
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

	public int getLetterWriterNo() {
		return letterWriterNo;
	}

	public void setLetterWriterNo(int letterWriterNo) {
		this.letterWriterNo = letterWriterNo;
	}

	public String getLetterReceiver() {
		return letterReceiver;
	}

	public void setLetterReceiver(String letterReceiver) {
		this.letterReceiver = letterReceiver;
	}

	public int getLetterReceiverNo() {
		return letterReceiverNo;
	}

	public void setLetterReceiverNo(int letterReceiverNo) {
		this.letterReceiverNo = letterReceiverNo;
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
		return "Letter [letterNo=" + letterNo + ", letterWriter=" + letterWriter + ", letterWriterNo=" + letterWriterNo
				+ ", letterReceiver=" + letterReceiver + ", letterReceiverNo=" + letterReceiverNo + ", letterContent="
				+ letterContent + ", writeDate=" + writeDate + "]";
	}
	
}
