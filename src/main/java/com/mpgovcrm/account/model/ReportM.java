package com.mpgovcrm.account.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reportm")
public class ReportM {

	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="user_id")
	private Long userId;
	
	@Column(name="month")
	private int month;
	
	@Column(name="year")
	private int year;
	
	
	@Column(name="report_name")
	private String reportName;
	
	@Column(name="rem_apr")
	private Double remApr;
	@Column(name="new_dmd_tl_apr")
	private Double newDmdTLApr;
	@Column(name="t_rec_apr")
	private Double totalRecApr;
	
	@Column(name="rem_crr")
	private Double remCurrent;
	@Column(name="newdmd_crr")
	private Double newDmdCurrent;
	@Column(name="t_rec_crr")
	private Double totalRecCurrent;
	@Column(name="rec_ls_yr_tl")
	private Double recLastYrTill;
	@Column(name="rem_ls_yr_tl")
	private Double remLastYrTill;
	
	@Column(name="newdmd_ls_yr_tl")
	private Double newDmd_Last_YrTill;
	
	@Column(name="total_rec")
	private Double totalRec;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public Double getTotalRecApr() {
		return totalRecApr;
	}
	public void setTotalRecApr(Double totalRecApr) {
		this.totalRecApr = totalRecApr;
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
