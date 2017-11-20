package com.swaca.util;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ParseStringToDate {
	
	public Date parseD(String datex){
		java.sql.Date sql=null;
		try {
			 SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy");
			 Date parsed = format.parse(datex);
			 sql = new java.sql.Date(parsed.getTime());
			 return sql;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sql;
	}
}
