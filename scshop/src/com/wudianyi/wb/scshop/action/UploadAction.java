package com.wudianyi.wb.scshop.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;

import com.joyoos.util.OSSUtil;

public class UploadAction extends BaseAction {
	private File file;
	private String fileFileName;
	private File upfile;
	private String upfileFileName;
	private Long limit;
	private String image;

	public String str() {
		String filename = "";
		// 对字节数组字符串进行Base64解码并生成图片
		if (image == null) // 图像数据为空
			return null;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(image);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}

			String fExt = ".jpg";
			StringBuilder fileSb = new StringBuilder();
			fileSb.append(System.currentTimeMillis());
			filename = fileSb + fExt;
			// 生成jpeg图片
			String imgFilePath = getRequest().getRealPath("") + "/" + filename;// 新生成的图片
			System.err.println(imgFilePath);
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
		} catch (Exception e) {
			return null;
		}
		return ajax("{\"success\":true,\"url\":\"http://localhost:8080/"
				+ filename + "\",\"bigurl\":\"http://static.123mfl.com/"
				+ filename + "\"}", "text/html");

	}

	@Override
	public String execute() throws Exception {

		if (file == null) {
			file = upfile;
			fileFileName = upfileFileName;
		}

		if (limit != null) {
			if ((file.length() / 1024) > limit) {
				return ajax("{\"success\":false,\"msg\":\"上传文件不能大于" + limit
						+ "KB\"}", "text/html");
			}
		}

		String fExt = fileFileName.substring(fileFileName.lastIndexOf("."));
		StringBuilder fileSb = new StringBuilder();
		fileSb.append(System.currentTimeMillis());
		String filename = fileSb + fExt;
		OSSUtil.uploadFile(filename, file);
		return ajax("{\"success\":true,\"url\":\"http://static.123mfl.com/"
				+ filename + "\",\"bigurl\":\"http://static.123mfl.com/"
				+ filename + "\"}", "text/html");

	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public File getUpfile() {
		return upfile;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public String getUpfileFileName() {
		return upfileFileName;
	}

	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}

	public Long getLimit() {
		return limit;
	}

	public void setLimit(Long limit) {
		this.limit = limit;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
