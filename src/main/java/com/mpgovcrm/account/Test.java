package com.mpgovcrm.account;

import javax.inject.Provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.linkedin.api.LinkedIn;

public class Test {

	@Autowired
	private  Provider<ConnectionRepository> connectionRepositoryProvider;
	
	public static void main(String[] args) {
		Test t = new Test();
		t.linkedin();
	}
	public void linkedin(){
	org.springframework.social.connect.Connection<LinkedIn> connection = connectionRepositoryProvider.get().findPrimaryConnection(LinkedIn.class);;
	if (connection != null) {
	    LinkedIn linkedin = connection.getApi();

	    // ... use LinkedIn API binding
	    System.out.println("FirstName = "+linkedin.profileOperations().getUserProfile().getFirstName());
	}
}
}
