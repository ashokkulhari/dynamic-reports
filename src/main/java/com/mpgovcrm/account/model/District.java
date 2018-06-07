package com.mpgovcrm.account.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "district")
public class District {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	 	private Long id;
	 	
	 	@Column(name="d_name")
	    private String name;
	    
	 	@Column(name="d_discription")
	    private String discription;

	 	
	 	
	 	

		public Long getId() {
			return id;
		}
		
		public void setId(Long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDiscription() {
			return discription;
		}

		public void setDiscription(String discription) {
			this.discription = discription;
		}
}
