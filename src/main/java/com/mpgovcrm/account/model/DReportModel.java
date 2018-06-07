package com.mpgovcrm.account.model;

import java.util.List;

public class DReportModel {

	List<ContactForm> conactForms;

	public DReportModel(){
		
	}
	
	public DReportModel(List<ContactForm> conactForms){
		this.conactForms =conactForms;
	}
	private List<Contact> contacts;

	public List<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}
	
	public List<ContactForm> getConactForms() {
		return conactForms;
	}

	public void setConactForms(List<ContactForm> conactForms) {
		this.conactForms = conactForms;
	}
	
	public void add(List<ContactForm> conactForms){
		this.conactForms = conactForms;
	}
}
