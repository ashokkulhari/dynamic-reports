package com.mpgovcrm.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mpgovcrm.account.model.ReportM;

public interface ReportMRepository extends JpaRepository<ReportM, Long> {

	
	@Query("SELECT e FROM ReportM e WHERE e.userId =:userId")
	ReportM findByUserId(@Param("userId") Long userId);
}

