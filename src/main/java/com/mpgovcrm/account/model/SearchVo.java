package com.mpgovcrm.account.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchVo {

	
	private List<ReportNames> reportNames;
	private Map<String , String> mainReportNames;
	private String reportName ;
	private String month;
	private String year ;
	
	
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public List<ReportNames> getReportNames() {
		return reportNames;
	}
	public void setReportNames(List<ReportNames> reportNames) {
		this.reportNames = reportNames;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public Map<String, String> getMainReportNames() {
		
		return mainReportNames;
	}
	public void setMainReportNames(Map<String, String> mainReportNames) {
		
		this.mainReportNames = mainReportNames;
	}

}
