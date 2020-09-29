package com.auction.util;

public class MoneyFormat {
	public static String moneyFormatToWan(String pricesrc) {
		double price=Double.parseDouble(pricesrc);
		StringBuilder ini=new StringBuilder();
		if(price>=10000) {
			ini.append((int)(price/10000)).append("万");
		} else {
			ini.append((int)price);
		}
		return ini.toString();
	}
	public static void main(String[] args) {
		String price="15263042";
		System.out.println(moneyFormatToWan(price));
	}
}
