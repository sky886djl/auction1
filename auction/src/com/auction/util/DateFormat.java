package com.auction.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	public static SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	public static String format(Date date) {
		return sdf.format(date);
	}
}
