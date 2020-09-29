package com.auction.util;

import com.auction.entity.User;

public class UserCode {
	public static void telCode(User u) {
		if(u==null)
			return;
		String string=u.getTel();
		if(string==null||string.length()!=11)
			return;
		u.setTelCode(string.substring(0, 3)+"****"+string.substring(7));
	}
	public static void emailCode(User u) {
		if(u==null)
			return;
		String string=u.getEmail();
		if(string==null||string.indexOf('@')==-1)
			return;
		u.setEmailCode(string.substring(0, 3)+"****"+string.substring(string.indexOf('@')));
	}
	
	public static void encode(User u) {
		telCode(u);
		emailCode(u);
	}

}
