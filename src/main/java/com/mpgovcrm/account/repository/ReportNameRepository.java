package com.mpgovcrm.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mpgovcrm.account.model.ReportNames;

public interface ReportNameRepository extends JpaRepository<ReportNames, Long> {

	@Query("SELECT e FROM ReportNames e WHERE e.reportName =:reportName")
	ReportNames findByReportName(@Param("reportName") String reportName);
}
