package com.mpgovcrm.account.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mpgovcrm.account.model.ReportMTotalVo;

@Repository
public interface ReportCustomRepository {

	 List<ReportMTotalVo> findMainReport();
}
