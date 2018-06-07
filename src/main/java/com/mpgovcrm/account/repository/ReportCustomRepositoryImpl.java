package com.mpgovcrm.account.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mpgovcrm.account.model.ReportMTotalVo;



@Repository
@Transactional(readOnly = true)
public class ReportCustomRepositoryImpl implements ReportCustomRepository {

	
	 @PersistenceContext
	 EntityManager entityManager;

	@Override
	public List<ReportMTotalVo> findMainReport() {
		Query query = entityManager.createNativeQuery("select "
				+ "sum(r.rem_apr),"    					//0
				+ "sum(r.new_dmd_tl_apr),"				//1
				+ "sum(r.t_rec_apr),"					//2
				+ "sum(r.rem_crr),"						//3
				+ "sum(r.newdmd_crr), "					//4
				+ " sum(r.t_rec_crr),"					//5
				+ "sum(r.rec_ls_yr_tl),"				//6
				+ "sum(r.rem_ls_yr_tl),"				//7
				+ "sum(r.newdmd_ls_yr_tl),"				//8
				+ "sum(r.total_rec), "					//9
				+" r.report_name,"						//10
				+ "rn.report_desc"						//11
				+ " from reportm r , reportname rn where r.report_name = 'bho-rajsv' "
				+" and r.report_name =rn.report_name  and r.month >=2 and r.month<=4 "
				+ " group by r.report_name ");
//        query.setParameter(1, firstName + "%");
		List<ReportMTotalVo> r = new ArrayList<ReportMTotalVo>();
		List<Object[]> results =query.getResultList();
		for (Object[] result : results) {
		    Double rem_apr = (Double) result[0];
		    Double new_dmd_tl_apr = (Double) result[1];
		    Double t_rec_apr = (Double) result[2];
		    Double rem_crr = (Double) result[3];
		    Double newdmd_crr = (Double) result[4];
		    Double t_rec_crr = (Double) result[5];
		    Double rec_ls_yr_tl = (Double) result[6];
		    Double rem_ls_yr_tl = (Double) result[7];
		    Double newdmd_ls_yr_tl = (Double) result[8];
		    Double total_rec = (Double) result[9];
		    String report_desc =(String)result[11];
		    System.out.println("rem_apr   ............"+rem_apr);
		    ReportMTotalVo rvo = new ReportMTotalVo();
		    rvo.setRemAprTT(rem_apr);
		    rvo.setNewDmdTLAprTT(new_dmd_tl_apr);
		    rvo.setTotalRecAprTT(t_rec_apr);
		    rvo.setRemCurrentTT(rem_crr);
		    rvo.setNewDmdCurrentTT(newdmd_crr);
		    rvo.setRemCurrentTT(t_rec_crr);
		    rvo.setRecLastYrTillTT(rec_ls_yr_tl);
		    rvo.setRemLastYrTillTT(rem_ls_yr_tl);
		    rvo.setNewDmd_Last_YrTillTT(newdmd_ls_yr_tl);
		    rvo.setTotalRecTT(total_rec);
		    rvo.setReportDesc(report_desc);
		    r.add(rvo);
		}
		
        return r;
	}

}
