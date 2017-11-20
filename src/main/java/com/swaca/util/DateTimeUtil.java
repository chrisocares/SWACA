package com.swaca.util;

import java.sql.Timestamp;
import java.sql.Date;

public class DateTimeUtil {
	
	public Timestamp todayTimestamp(){
		java.util.Date date = new java.util.Date(System.currentTimeMillis());
		Timestamp timestamp = new Timestamp(date.getTime());
		return timestamp;
	}
	
	public Date today(){
		Date date = new Date(System.currentTimeMillis());
		return date;
	}
}