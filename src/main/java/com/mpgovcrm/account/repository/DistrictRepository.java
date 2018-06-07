package com.mpgovcrm.account.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mpgovcrm.account.model.District;


	
public interface DistrictRepository extends JpaRepository<District, Long> {

	District findById(Long Id);
	
}
