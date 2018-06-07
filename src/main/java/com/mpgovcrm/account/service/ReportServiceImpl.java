package com.mpgovcrm.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpgovcrm.account.model.ReportM;
import com.mpgovcrm.account.model.ReportMTotalVo;
import com.mpgovcrm.account.model.ReportNames;
import com.mpgovcrm.account.repository.ReportMRepository;
import com.mpgovcrm.account.repository.ReportNameRepository;

@Service
public class ReportServiceImpl implements ReportService {

	
	@Autowired
	private ReportMRepository reportMRepository;
	
	@Autowired
	private ReportNameRepository reportNameRepository;
	
	
	@Override
	public ReportM findByUserId(Long Id) {
		return reportMRepository.findByUserId(Id);
	}

	@Override
	public void save(ReportM reportM) {
		reportMRepository.save(reportM);
	}

	
	
	@Override
	public List<ReportNames> findReportNames() {
		return reportNameRepository.findAll();
	}

	@Override
	public ReportNames findByReportName(String reportName) {
		return reportNameRepository.findByReportName(reportName);
	}

	

}
