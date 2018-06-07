package com.mpgovcrm.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpgovcrm.account.model.District;
import com.mpgovcrm.account.repository.DistrictRepository;

@Service
public class DistrictServiceImpl implements DistrictService {

	@Autowired
	private DistrictRepository districtRepository;
	@Override
	public District findById(Long Id) {
		return districtRepository.findById(Id);
	}
	@Override
	public List<District> findAll() {
		return districtRepository.findAll();
	}

}
