package kh.spring.Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	public static String dateformat(String target) throws Exception {
		SimpleDateFormat fm1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date d1 = fm1.parse(target);
		String d2 = fm2.format(d1);
		return 	d2;
	}
}
