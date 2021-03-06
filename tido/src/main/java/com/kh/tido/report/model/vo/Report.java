package com.kh.tido.report.model.vo;

import java.sql.Date;

public class Report {

		private int rReportNo;
		private int rContentsNo;
		private int rReportType;
		private String rReportContent;
		private Date rReportDate;
		private int rRrno;
		private String rMemberId;
		private	String Reason;
		private String reportStatus;
		
	public Report() {
	
	}

	public Report(int rReportNo, int rContentsNo, int rReportType, String rReportContent, Date rReportDate, int rRrno,
			String rMemberId, String reason, String reportStatus) {
		super();
		this.rReportNo = rReportNo;
		this.rContentsNo = rContentsNo;
		this.rReportType = rReportType;
		this.rReportContent = rReportContent;
		this.rReportDate = rReportDate;
		this.rRrno = rRrno;
		this.rMemberId = rMemberId;
		Reason = reason;
		this.reportStatus = reportStatus;
	}

	public int getrReportNo() {
		return rReportNo;
	}

	public void setrReportNo(int rReportNo) {
		this.rReportNo = rReportNo;
	}

	public int getrContentsNo() {
		return rContentsNo;
	}

	public void setrContentsNo(int rContentsNo) {
		this.rContentsNo = rContentsNo;
	}

	public int getrReportType() {
		return rReportType;
	}

	public void setrReportType(int rReportType) {
		this.rReportType = rReportType;
	}

	public String getrReportContent() {
		return rReportContent;
	}

	public void setrReportContent(String rReportContent) {
		this.rReportContent = rReportContent;
	}

	public Date getrReportDate() {
		return rReportDate;
	}

	public void setrReportDate(Date rReportDate) {
		this.rReportDate = rReportDate;
	}

	public int getrRrno() {
		return rRrno;
	}

	public void setrRrno(int rRrno) {
		this.rRrno = rRrno;
	}

	public String getrMemberId() {
		return rMemberId;
	}

	public void setrMemberId(String rMemberId) {
		this.rMemberId = rMemberId;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Override
	public String toString() {
		return "Report [rReportNo=" + rReportNo + ", rContentsNo=" + rContentsNo + ", rReportType=" + rReportType
				+ ", rReportContent=" + rReportContent + ", rReportDate=" + rReportDate + ", rRrno=" + rRrno
				+ ", rMemberId=" + rMemberId + ", Reason=" + Reason + ", reportStatus=" + reportStatus + "]";
	}

	
		
		
		
		
}


