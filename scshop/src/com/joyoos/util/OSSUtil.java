package com.joyoos.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;

public class OSSUtil {
	public static final String OSS_ENDPOINT = "http://oss-cn-shenzhen.aliyuncs.com";

	public static final String ACCESS_ID = "PEDRxUZiGsJIGWZY";

	public static final String bucketName = "scshop";
	public static final String ACCESS_KEY = "xmHSooTqRatptXLWDd8YQWP2pSNoLo";

	public static void main(String[] args) throws IOException {
		creatFolder(bucketName, "hello");
	}

	public static void creatFolder(String bucketName, String folder_name)
			throws IOException {
		// 要创建的文件夹名称,在满足Object命名规则的情况下以"/"结尾
		String objectName = folder_name + "/";
		OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID, ACCESS_KEY);
		ObjectMetadata objectMeta = new ObjectMetadata();
		/*
		 * 这里的size为0,注意OSS本身没有文件夹的概念,这里创建的文件夹本质上是一个size为0的Object,dataStream仍然可以有数据
		 * 照样可以上传下载,只是控制台会对以"/"结尾的Object以文件夹的方式展示,用户可以利用这种方式来实现文件夹模拟功能,创建形式上的文件夹
		 */
		byte[] buffer = new byte[0];
		ByteArrayInputStream in = new ByteArrayInputStream(buffer);
		objectMeta.setContentLength(0);
		try {
			client.putObject(bucketName, objectName, in, objectMeta);
		} finally {
			in.close();
		}
	}

	// 上传文件
	public static String uploadFile(String key, File file) throws OSSException,
			ClientException, FileNotFoundException {
		OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID, ACCESS_KEY);
		ObjectMetadata objectMeta = new ObjectMetadata();
		objectMeta.setContentLength(file.length());
		// 可以在metadata中标记文件类型
		objectMeta.setContentType("image/jpeg");

		InputStream input = new FileInputStream(file);
		PutObjectResult objectResult = client.putObject(bucketName, key, input,
				objectMeta);
		return objectResult.getETag();
	}

}
