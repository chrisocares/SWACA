package com.swaca.util;

import java.sql.Timestamp;
import java.util.Date;
import java.text.SimpleDateFormat;

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
	
	public String dateTimeMYSQL (Date Variable){
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTime = f.format(Variable); 
		return dateTime;
	}
}