package com.udong.board.need.vo;

import java.sql.Date;

public class NeedAttachment {
	private int fileNo; // FILE_NO NUMBER
	private int refBno; // REF_BNO NUMBER
	private String originName; // ORIGIN_NAME VARCHAR2(255 BYTE)
	private String changeName; // CHANGE_NAME VARCHAR2(255 BYTE)
	private String filePath; // FILE_PATH VARCHAR2(1000 BYTE)
	private Date uploadDate; // UPLOAD_DATE DATE
	private int fileLevel; // FILE_LEVEL NUMBER
	private String status; // STATUS VARCHAR2(1 BYTE)
	private int refUno; // REF_UNO NUMBER

	public NeedAttachment() {
		super();
	}

	public NeedAttachment(int fileNo, int refBno, String originName, String changeName, String filePath,
			Date uploadDate, int fileLevel, String status, int refUno) {
		super();
		this.fileNo = fileNo;
		this.refBno = refBno;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
		this.refUno = refUno;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRefUno() {
		return refUno;
	}

	public void setRefUno(int refUno) {
		this.refUno = refUno;
	}

	@Override
	public String toString() {
		return "NeedAttachment [fileNo=" + fileNo + ", refBno=" + refBno + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", status=" + status + ", refUno=" + refUno + "]";
	}

	
	
}