package com.mpgovcrm.account.service;

import java.util.List;

import com.mpgovcrm.account.model.District;

public interface DistrictService {

	District findById(Long Id);
	
	List<District> findAll();
}
