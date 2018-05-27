package com.hrms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import com.hrms.bean.Msg;

import sun.security.util.Length;

public class commonUtil {
	public static boolean isNullOrEmpty(List<Object> values) {
		for (Object value : values) {
			if (value == null) {
				return true;
			}
			if (value instanceof CharSequence) {
				return ((CharSequence) value).length() == 0;
			}
		}
		return false;

	}

	public static Msg stringToDate(String time) throws ParseException {
		boolean b = Pattern.matches("^\\d{4}\\-\\d{1,2}\\-\\d{1,2}$", time);
		if (!b) {
			return Msg.fail();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date timeDate = sdf.parse(time);
		return Msg.success().add("time", timeDate);
	}

	public static Msg dateToString(Date time) throws ParseException {
		// boolean b =Pattern.matches("^\\d{4}\\-\\d{1,2}\\-\\d{1,2}$", time);
		// if(!b) {
		// return Msg.fail();
		// }
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String timeString = sdf.format(time);
		return Msg.success().add("time", timeString);
	}

	public static String generateJobNO(String jobName, String deptNO) {
		String JobNO = deptNO.replaceFirst("DEPT", "JOB")
				.concat("-" + Chinese2Alph.String2Alpha(jobName) + new Random().nextInt(100));
		return JobNO;

	}
	/*生成员工编号*/
	public static String generateEmpNO(String empname) {
		String empNO = Chinese2Alph.String2Alpha(empname)+new Random().nextInt(1000);
		return empNO;
	}

	public static Integer[] analyze(String jobsId) {
		String[] IdsString =jobsId.split("_");
		Integer[] IdsInt = new Integer[IdsString.length] ;
		for(int i=0;i<IdsString.length-1;i++) {
			IdsInt[i] = Integer.valueOf(IdsString[i+1]);
		}
		System.out.println(IdsInt.toString());
		return IdsInt;
	}
	
	public static String getCurrentTime() {
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(day);
	}
	
	public static void main(String[] args) {
		
	}
}
