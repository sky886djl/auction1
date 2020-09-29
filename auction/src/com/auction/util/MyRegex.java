package com.auction.util;

import java.util.regex.Pattern;

public class MyRegex {
	/**
	 * 手机号
	 */
	public static final String REGEX_MOBILE = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
	/**
	 * 邮箱
	 */
	public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	
	public static boolean isMobile(String mobile) {
        return Pattern.matches(REGEX_MOBILE, mobile);
    }
	
	public static boolean isEmail(String email) {
        return Pattern.matches(REGEX_EMAIL, email);
    }
	
}