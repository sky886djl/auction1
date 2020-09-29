package com.auction.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDateFormat {
	private static SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat dateFormat1=new SimpleDateFormat("yyyyMMddHHmmss");
	
	
	public static Date parse(String date) throws ParseException {
		return dateFormat.parse(date);
	}
	
	public static String format(Date date) {
		return dateFormat.format(date);
	}
	
	public static String format1(Date date) {
		return dateFormat1.format(date);
	}
}
