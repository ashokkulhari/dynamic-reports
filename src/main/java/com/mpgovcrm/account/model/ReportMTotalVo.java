package com.mpgovcrm.account.model;

import java.util.List;

public class ReportMTotalVo {

	private String reportDesc;
	
	private String reportName;
	private String monthName;
	private int month;
	private int year ;
	// ----TOTALs
		private Double remAprTT;
		private Double newDmdTLAprTT;
		private Double totalRecAprTT;
		private Double remCurrentTT;
		private Double newDmdCurrentTT;
		private Double totalRecCurrentTT;
		private Double recLastYrTillTT;
		private Double remLastYrTillTT;
		private Double newDmd_Last_YrTillTT;
		private Double totalRecTT;
		
		private List<ReportMVo>  reportMVos;
		
		
		public List<ReportMVo> getReportMVos() {
			return reportMVos;
		}
		public void setReportMVos(List<ReportMVo> reportMVos) {
			this.reportMVos = reportMVos;
		}
		
		
		public Double getRemAprTT() {
			return remAprTT;
		}
		public void setRemAprTT(Double remAprTT) {
			this.remAprTT = remAprTT;
		}
		public Double getNewDmdTLAprTT() {
			return newDmdTLAprTT;
		}
		public void setNewDmdTLAprTT(Double newDmdTLAprTT) {
			this.newDmdTLAprTT = newDmdTLAprTT;
		}
		public Double getTotalRecAprTT() {
			return totalRecAprTT;
		}
		public void setTotalRecAprTT(Double totalRecAprTT) {
			this.totalRecAprTT = totalRecAprTT;
		}
		public Double getRemCurrentTT() {
			return remCurrentTT;
		}
		public void setRemCurrentTT(Double remCurrentTT) {
			this.remCurrentTT = remCurrentTT;
		}
		public Double getNewDmdCurrentTT() {
			return newDmdCurrentTT;
		}
		public void setNewDmdCurrentTT(Double newDmdCurrentTT) {
			this.newDmdCurrentTT = newDmdCurrentTT;
		}
		public Double getTotalRecCurrentTT() {
			return totalRecCurrentTT;
		}
		public void setTotalRecCurrentTT(Double totalRecCurrentTT) {
			this.totalRecCurrentTT = totalRecCurrentTT;
		}
		public Double getRecLastYrTillTT() {
			return recLastYrTillTT;
		}
		public void setRecLastYrTillTT(Double recLastYrTillTT) {
			this.recLastYrTillTT = recLastYrTillTT;
		}
		public Double getRemLastYrTillTT() {
			return remLastYrTillTT;
		}
		public void setRemLastYrTillTT(Double remLastYrTillTT) {
			this.remLastYrTillTT = remLastYrTillTT;
		}
		public Double getTotalRecTT() {
			return totalRecTT;
		}
		public void setTotalRecTT(Double totalRecTT) {
			this.totalRecTT = totalRecTT;
		}
		
		
		public String getReportDesc() {
			return reportDesc;
		}
		public void setReportDesc(String reportDesc) {
			this.reportDesc = reportDesc;
		}
		public Double getNewDmd_Last_YrTillTT() {
			return newDmd_Last_YrTillTT;
		}
		public void setNewDmd_Last_YrTillTT(Double newDmd_Last_YrTillTT) {
			this.newDmd_Last_YrTillTT = newDmd_Last_YrTillTT;
		}
		public String getReportName() {
			return reportName;
		}
		public void setReportName(String reportName) {
			this.reportName = reportName;
		}
		public String getMonthName() {
			return monthName;
		}
		public void setMonthName(String monthName) {
			this.monthName = monthName;
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
		
		
}
