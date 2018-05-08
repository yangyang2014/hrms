package com.hrms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import com.hrms.bean.Msg;

public class commonUtil {
	public static Msg stringToDate(String time) throws ParseException {
		boolean b =Pattern.matches("^\\d{4}\\-\\d{1,2}\\-\\d{1,2}$", time);
		if(!b) {
			return Msg.fail();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date timeDate = sdf.parse(time);
		return Msg.success().add("time", timeDate);
	}
	
	public static Msg dateToString(Date time) throws ParseException {
//		boolean b =Pattern.matches("^\\d{4}\\-\\d{1,2}\\-\\d{1,2}$", time);
//		if(!b) {
//			return Msg.fail();
//		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String timeString = sdf.format(time);
		return Msg.success().add("time", timeString);
	}
}
