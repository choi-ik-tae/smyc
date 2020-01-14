package kh.spring.Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	public static String dateformat(String target) throws Exception {
		SimpleDateFormat fm1 = new SimpleDateFormat("yyyy-mm-dd hh:MM:ss.s");
		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-mm-dd");
		
		Date d1 = fm1.parse(target);
		return fm2.format(d1);	
	}	
}
