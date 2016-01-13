package cn.gov.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

public class FileUtil {

	public static String uploadFile(File file, String fileFileName, HttpServletRequest request) {
		try {
			InputStream in = new FileInputStream(file);
			String uuid = UUID.randomUUID().toString();
			String path = "/upload/" + uuid + fileFileName.substring(fileFileName.lastIndexOf("."));
			String realPath = request.getSession().getServletContext().getRealPath("") + path;
			File outFile = new File(realPath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();
			}
			OutputStream out = new FileOutputStream(outFile);
			byte[] buf = new byte[1024];
			int length = 0;
			while ((length = in.read(buf)) > 0) {
				out.write(buf, 0, length);
			}
			out.flush();
			in.close();
			out.close();
			return path;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String uploadBytesToFile(byte[] bytes, String suffix, HttpServletRequest request) {
		try {
			String uuid = UUID.randomUUID().toString();
			String path = "/upload/" + uuid + "." + suffix;
			String realPath = request.getSession().getServletContext().getRealPath("") + path;
			File outFile = new File(realPath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();
			}
			OutputStream out = new FileOutputStream(outFile);
			out.write(bytes);
			out.flush();
			out.close();
			return path;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
