package com.wudianyi.wb.scshop.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.security.cert.X509Certificate;

import com.Ostermiller.util.Base64;

/**
 * 解密通知报文 RSA使用 RSA/ECB/PKCS1Padding 组合模式补位。
 * 3DES使用DESede/ECB/PKCS5Padding组合模式补位。
 * 
 * @author zhengzhen.wang
 * 
 */
public class NotifyDecoder {

	// private static String msg =
	// "NTEwMTIwMDA3MDAwMzEwMDAwMQ==|cP5U1W2v60kFC9/PojB6E9hEATVc8nVY5O5gOUiZwu45V6AsXeBVTs3YEzIXvSOAw8ldKDPVs6ZarSuqXz58IfRGp1EXgh0fEa3vT3JUH4/vbNUjY2kXEQP3+7T1at1cHqRQz/WBkbzRcJTEbcoQ1drquL4abjezZAQm+ChQdgE=|VV6m600yy1J2phIL/6C70g0a5TZRf/qiXTSohqoFoEFcpTpME9e11HK+4ZsNkgj79WBFAKbcEro+8jIfB/Ltgumv1HwnRwMnVweG51jjDKkGb1e8rjayhZGXmAefSN1hwdYDn5ZoUc0SI73/lLozLWYrj4em9JU0/BFJbbCmjqppsxFR7uV3FcFzCV5FInGC4weAgMO9merDgzZWu0DjOHRAfcrkOgEluBiPeTaElOVffZgcmlBdqkDbtzc3BFZPRdK3DEpV5x3dUPOxWQe92l99mByaUF2qE56NZzOsg17tD1pieWfECWU56+X48vOPqei0e127odmcbpX50ymRIWRfL4Fm0aryKkVLiQoHir1SRcGjSSN/84bS3VNEy49Ee6avKAzu4wmN3RZQq8OfqeWdwgysTRTH69/30ugqM78kMuZjayvB7zNexKSlTAWQdng5TYVQIjkk/ienNsG4IgO08aBrWokAsbrco+HGybvovSqNEZ298kP8GVE47yo28yfG1BUx+YcgbVDnOmHUN0f1GHdFF2VWFkVsBt9nx4MSoJCuRcerI4Ge7urkRfmLZf+yglxqC6V7oQ6/Hlx44A2XIKh+O4FpdGgtNNUTFkDz35OhpeugKiiXiY/MQziOwNhgWZuxFh5f6ajwxjzCrMKnPjYQrf+sMzpu3fi0SvnACEcP19cMk8DYYFmbsRYeoPOsDNMiOkWquiroJpaJVnfXsh9CZ1DrmQcA7+YUukp72F5pXPcdrVPKtrEgUaipgfVEHnMByt84/HPzSWjmeFNHwiXePlWFKLqsazekqjE=";
	// private static Key privateKey;
	private Key publicKey;
	private static NotifyDecoder notifyDecoder = null;

	public static void main(String[] args) throws Exception {

		String[] re = new String[2];
		NotifyDecoder notifyDecoder = NotifyDecoder.getInstance();

		re = notifyDecoder
				.decode("ODAyMzEwMDQ4OTkyNzkw|aoaQDKg6CdcTqeufrjsdJkeyNQPcJeaMCasyXVb3MvOwFLYTlXtAcMh6nn6y8cEy9vbqdd0jr6jDvOTVhXkz6O2nwUhgEsYYRR+0kqudbYNbBf8qc9+hTyNazIzBs2ICsT+LLLXezuKsi4n+6zvCtRDUmeBE984wF7+UbYOq8Xk=|vBc/P85gPkDZGZMUutI3rSZIdgfx4nWZRzIAENMrNfWp9iJ4oIHpoIz5iULagax5xRlkdJjwFfJ96BOKJ/ANBBY37rIdXfdn2Kqi+zHiOCnsr+3xO+09S0RSqGP2OLzO6zuaXfTSMj0FE9/Qp/Mhxo1CK/5Rpcn25vxlFBgC563T41RaDRCKS53VZZhdl7NvyUM5M4sJ/Tl12OXOvnTYyAXkpu0M7iVWeKCuAnqOYvBVf0t3EWdv+pFVkZR8n+Y9iV8xn8SQ4L2oJ7PNKBp6q/VTYC38Oh+SG0piP9fBU5rUv2OYAw8qgy3ucGhOYZuKffjPQCxHtQlePN3DFf6A24M1VdAxTnkrGPkUmXoKtTA5Em7UIYBnxBtLtEGQE/kis9H6WdIFzbj3pqkc/xp2m4lb+OhRFZ5lbchGcClbn26E7Y0IQ/AJEHWtnCdsPLh01BFu8JpJthbMvSVBf0murc0yGxaHTrLNvrhoGjRwUrOe49EzGiC/b7Sus1/j7ets0H/xiBP3yCTgBcP9qGyJM9SN89euIy7JWpO1+Uc1fkiMx1/5gc/pqb37hDxnD6+JJysbpqcftj3jcgNgSrt+jiV7uZKY0WNM6jfPTocyNu4vXHtSaHZHxYC/VqOWfCAeolEl2+q7xPehG8JpCm86+I80A02kQlEFVTstllIi2DuAv1ajlnwgHk+1Kj41Hvs2cRqQ4mnqYKfFWcAP+BVoHRa94E4AwRo50osjPPrVW+T6F5BJqqyz7akGoRnJPWq1nh0Y0Ok/owWP7Bq8YyNmTA6cIFAGDm8O");

		System.err.println(re[0]);
		System.err.println(re[1]);

		NotifyDecoder notifyDecoder2 = NotifyDecoder.getInstance();

		re = notifyDecoder2
				.decode("ODAyMzEwMDQ4OTkyNzkw|aoaQDKg6CdcTqeufrjsdJkeyNQPcJeaMCasyXVb3MvOwFLYTlXtAcMh6nn6y8cEy9vbqdd0jr6jDvOTVhXkz6O2nwUhgEsYYRR+0kqudbYNbBf8qc9+hTyNazIzBs2ICsT+LLLXezuKsi4n+6zvCtRDUmeBE984wF7+UbYOq8Xk=|vBc/P85gPkDZGZMUutI3rSZIdgfx4nWZRzIAENMrNfWp9iJ4oIHpoIz5iULagax5xRlkdJjwFfJ96BOKJ/ANBBY37rIdXfdn2Kqi+zHiOCnsr+3xO+09S0RSqGP2OLzO6zuaXfTSMj0FE9/Qp/Mhxo1CK/5Rpcn25vxlFBgC563T41RaDRCKS53VZZhdl7NvyUM5M4sJ/Tl12OXOvnTYyAXkpu0M7iVWeKCuAnqOYvBVf0t3EWdv+pFVkZR8n+Y9iV8xn8SQ4L2oJ7PNKBp6q/VTYC38Oh+SG0piP9fBU5rUv2OYAw8qgy3ucGhOYZuKffjPQCxHtQlePN3DFf6A24M1VdAxTnkrGPkUmXoKtTA5Em7UIYBnxBtLtEGQE/kis9H6WdIFzbj3pqkc/xp2m4lb+OhRFZ5lbchGcClbn26E7Y0IQ/AJEHWtnCdsPLh01BFu8JpJthbMvSVBf0murc0yGxaHTrLNvrhoGjRwUrOe49EzGiC/b7Sus1/j7ets0H/xiBP3yCTgBcP9qGyJM9SN89euIy7JWpO1+Uc1fkiMx1/5gc/pqb37hDxnD6+JJysbpqcftj3jcgNgSrt+jiV7uZKY0WNM6jfPTocyNu4vXHtSaHZHxYC/VqOWfCAeolEl2+q7xPehG8JpCm86+I80A02kQlEFVTstllIi2DuAv1ajlnwgHk+1Kj41Hvs2cRqQ4mnqYKfFWcAP+BVoHRa94E4AwRo50osjPPrVW+T6F5BJqqyz7akGoRnJPWq1nh0Y0Ok/owWP7Bq8YyNmTA6cIFAGDm8O");

		System.err.println(re[0]);
		System.err.println(re[1]);
		// Document document =
		// DocumentHelper.parseText("<?xml version='1.0' encoding='UTF-8'?><upbp application='MTransNotify.Req' version ='1.0.0' sendTime ='20140210165239' sendSeqId ='14021016523972082'><transType>01</transType><merchantId>898510148990028</merchantId><merchantOrderId>139202219001013</merchantOrderId><merchantOrderAmt>1</merchantOrderAmt><settleDate>0210</settleDate><setlAmt>1</setlAmt><setlCurrency>156</setlCurrency><converRate>null</converRate><cupsQid>201402101651351606592</cupsQid><cupsTraceNum>160659</cupsTraceNum><cupsTraceTime>0210165135</cupsTraceTime><cupsRespCode>00</cupsRespCode><cupsRespDesc></cupsRespDesc></upbp>");
		//
		//
		// System.err.println(document.getRootElement().attribute("sendSeqId").getText());
	}

	private NotifyDecoder() {
		InputStream stream = NotifyDecoder.class
				.getResourceAsStream("/898510148990028.cer");
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[4096];
		int count = -1;
		try {
			while ((count = stream.read(b)) != -1) {
				baos.write(b, 0, count);
			}
			X509Certificate cert = X509Certificate.getInstance(baos
					.toByteArray());
			publicKey = cert.getPublicKey();
			System.err.println(publicKey);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != baos) {
					baos.close();
				}
				if (null != stream) {
					stream.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public synchronized static NotifyDecoder getInstance() {
		if (notifyDecoder == null) {
			notifyDecoder = new NotifyDecoder();
		}
		return notifyDecoder;
	}

	/**
	 * 初始化密钥
	 * 
	 * @return
	 */
	// public static boolean init() {
	//
	// boolean flag = false;
	// InputStream stream = NotifyDecoder.class
	// .getResourceAsStream("/898510148990028.cer");
	// ByteArrayOutputStream baos = new ByteArrayOutputStream();
	// byte[] b = new byte[4096];
	// int count = -1;
	// try {
	// while ((count = stream.read(b)) != -1) {
	// baos.write(b, 0, count);
	// }
	// X509Certificate cert = X509Certificate.getInstance(baos
	// .toByteArray());
	// publicKey = cert.getPublicKey();
	// System.err.println("publicKey" + publicKey);
	//
	// flag = true;
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// try {
	// if (null != baos) {
	// baos.close();
	// }
	// if (null != stream) {
	// stream.close();
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	// return flag;
	// }

	/**
	 * 解密 BASE64(商户号)| BASE64(RSA(报文加密密钥))| BASE64(3DES(报文原文))
	 * 
	 * @throws NoSuchPaddingException
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeyException
	 * @throws BadPaddingException
	 * @throws IllegalBlockSizeException
	 * @throws InvalidKeySpecException
	 */
	public String[] decode(String msg) throws NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidKeyException,
			IllegalBlockSizeException, BadPaddingException,
			InvalidKeySpecException {
		String[] re = new String[2];
		String[] segment = msg.split("\\|");
		String cMerNo = segment[0];
		String cKey = segment[1];
		String cMsg = segment[2];

		String merchantNo = Base64.decode(cMerNo);
		System.out.println("商户号：" + merchantNo);
		re[0] = merchantNo;
		Cipher c1 = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		c1.init(Cipher.DECRYPT_MODE, publicKey);
		DESedeKeySpec desSpec = new DESedeKeySpec(c1.doFinal(Base64
				.decodeToBytes(cKey)));
		SecretKey secretKey = SecretKeyFactory.getInstance("DESede")
				.generateSecret(desSpec);

		Cipher c2 = Cipher.getInstance("DESede/ECB/PKCS5Padding");
		c2.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] b = c2.doFinal(Base64.decodeToBytes(cMsg));
		re[1] = new String(b);
		System.out.println("报文：" + new String(b));
		return re;
	}

}