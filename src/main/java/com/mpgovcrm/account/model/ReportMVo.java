package com.mpgovcrm.account.model;


public class ReportMVo {

	
	private String userName;
	
	private String location;

	private int month;
	private int year;
	private String reportName;
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
	private Long userId;
	
	private Double remApr;
	private Double newDmdTLApr;
	private Double totalRecApr;
	private Double remCurrent;
	private Double newDmdCurrent;
	private Double totalRecCurrent;
	private Double recLastYrTill;
	private Double remLastYrTill;
	private Double newDmd_Last_YrTill;
	private Double totalRec;
	
	
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Double getRemApr() {
		return remApr;
	}
	public void setRemApr(Double remApr) {
		this.remApr = remApr;
	}
	public Double getNewDmdTLApr() {
		return newDmdTLApr;
	}
	public void setNewDmdTLApr(Double newDmdTLApr) {
		this.newDmdTLApr = newDmdTLApr;
	}
	
	public Double getRemCurrent() {
		return remCurrent;
	}
	public void setRemCurrent(Double remCurrent) {
		this.remCurrent = remCurrent;
	}
	public Double getNewDmdCurrent() {
		return newDmdCurrent;
	}
	public void setNewDmdCurrent(Double newDmdCurrent) {
		this.newDmdCurrent = newDmdCurrent;
	}
	public Double getTotalRecCurrent() {
		return totalRecCurrent;
	}
	public void setTotalRecCurrent(Double totalRecCurrent) {
		this.totalRecCurrent = totalRecCurrent;
	}
	public Double getRecLastYrTill() {
		return recLastYrTill;
	}
	public void setRecLastYrTill(Double recLastYrTill) {
		this.recLastYrTill = recLastYrTill;
	}
	public Double getRemLastYrTill() {
		return remLastYrTill;
	}
	public void setRemLastYrTill(Double remLastYrTill) {
		this.remLastYrTill = remLastYrTill;
	}
	public Double getTotalRec() {
		return totalRec;
	}
	public void setTotalRec(Double totalRec) {
		this.totalRec = totalRec;
	}
	public Double getTotalRecApr() {
		return totalRecApr;
	}

	public void setTotalRecApr(Double totalRecApr) {
		this.totalRecApr = totalRecApr;
	}

	public Double getNewDmd_Last_YrTill() {
		return newDmd_Last_YrTill;
	}

	public void setNewDmd_Last_YrTill(Double newDmd_Last_YrTill) {
		this.newDmd_Last_YrTill = newDmd_Last_YrTill;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	
	
	
}
