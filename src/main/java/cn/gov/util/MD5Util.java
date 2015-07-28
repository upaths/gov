package cn.gov.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	public static String md5(String s) {
		String result = s;
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			md5.update(s.getBytes());
			result = byte2hex(md5.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static String byte2hex(byte[] b) // 二行制转字符串
	{
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs.toUpperCase();
	}
	
	public static void main(String[] args) {
		System.out.println(MD5Util.md5("admin"));
	}
}
