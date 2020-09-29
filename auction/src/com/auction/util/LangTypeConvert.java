package com.auction.util;

import java.util.Iterator;
import java.util.Set;

public class LangTypeConvert {
	public static int[] setConvertToArrayInt(Set<Integer> set) {
		int[]ids=new int[set.size()];
		Iterator<Integer> iterator = set.iterator();
		int i=0;
		while(iterator.hasNext()) {
			ids[i++]=iterator.next();
		}
		return ids;
	}
	
}
