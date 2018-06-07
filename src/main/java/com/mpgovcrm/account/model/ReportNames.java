package com.mpgovcrm.account.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reportname")

public class ReportNames {

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	 	private Long id;
	 	
	 	@Column(name="report_name")
	    private String reportName;
	    
	 	@Column(name="report_desc")
	    private String discription;
	 	
	 	@Column(name="report_type")
	    private String reportType;
	 	
}
