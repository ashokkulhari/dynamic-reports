package com.mpgovcrm.account.service;

import java.util.List;

import com.mpgovcrm.account.model.ReportM;
import com.mpgovcrm.account.model.ReportMTotalVo;
import com.mpgovcrm.account.model.ReportNames;

public interface ReportService {

	
	ReportM findByUserId(Long Id);
	
	void save(ReportM reportM);
	
	List<ReportNames> findReportNames();
	
	ReportNames  findByReportName(String reportName);
	
}
