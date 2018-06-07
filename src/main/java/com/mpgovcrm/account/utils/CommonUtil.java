package com.mpgovcrm.account.utils;

import java.util.HashMap;
import java.util.Map;

public class CommonUtil {

	
	public static String  getMonthName (int month){
		
		Map<Integer , String> monthMapping = new HashMap<>();
		
		monthMapping.put(1, "जनवरी");
		monthMapping.put(2, "फरवरी");
		monthMapping.put(3, "मार्च");
		monthMapping.put(4, "अप्रैल");
		monthMapping.put(5, "मई");
		monthMapping.put(6, "जून");
		monthMapping.put(7, "");
		monthMapping.put(8, "");
		monthMapping.put(9, "");
		monthMapping.put(10, "");
		monthMapping.put(11, "");
		monthMapping.put(12, "");
		
		
		
		return monthMapping.get(month);
	}



}
