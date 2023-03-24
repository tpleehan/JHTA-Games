package com.semi4.utils;

public class StringUtils {

	/**
	 * 전달받은 문자열이 null이면 빈문자를 반환하는 메소드입니다.
	 * @param str 문자열
	 * @return null인 경우만 빈 문자열을 반환한다.
	 */
	public static String nullToBlank(String str) {
		if (str == null) {
			return "";
		}
		return str.trim();
	}

}
