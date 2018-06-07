package com.mpgovcrm.account.model;

import java.util.List;

public class ContactForm {

	private List<Contact> contacts;
	
	private String reportName;
	private String reportNameDesc;
	

	public List<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getReportNameDesc() {
		return reportNameDesc;
	}

	public void setReportNameDesc(String reportNameDesc) {
		this.reportNameDesc = reportNameDesc;
	}
	
	
}
