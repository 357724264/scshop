package com.wudianyi.wb.scshop.action.admin;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPalette;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.util.StringUtils;

@Results({ @Result(name = "excel", type = "stream", params = { "contentType",
		"application/vnd.ms-excel", "inputName", "excelFile",
		"contentDisposition", "attachment;filename=\"${downloadFileName}\"",
		"bufferSize", "1024" }) })
public class ExcelAction extends BaseAction {

//	static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//	@Resource
//	private OrderService orderService;
//	private Integer uid;
//	private String begin;
//	private String end;
//	private String type;
//
//	private InputStream excelFile;
//
//	private String downloadFileName;
//
//	public String order() throws ParseException {
//		System.err.println("-=============");
//		Date bb = null;
//		Date ee = null;
//		QueryParam params = new QueryParam(4);
//		PaymentStatus stat = null;
//		if (!StringUtils.isEmpty(type)) {
//			stat = PaymentStatus.valueOf(type);
//		}
//		if (!StringUtils.isEmpty(begin)) {
//			bb = sdf.parse(begin);
//		}
//		if (!StringUtils.isEmpty(end)) {
//			ee = sdf.parse(end);
//
//		}
//
//		System.err.println("stat===" + stat);
//		params.add(Const.SYSTEMCLASS_KEY, getSession(Const.SESSION_ADMIN_NAME))
//				.add("paymentStatus", stat).add("userid", uid)
//				.add("isagent", 0);
//		java.util.List<Order> list = orderService.getStaticsLikeList(pro,
//				keyword, params, "createDate", bb, ee, null, null,
//				"createDate", "desc");
//
//		try {
//			System.err.println(1111111111);
//			// 第一步，创建一个webbook，对应一个Excel文件
//			HSSFWorkbook wb = new HSSFWorkbook();
//			// 第二步，在webbook中添加一个sheet，对应Excel文件中的 sheet
//			HSSFSheet sheet = wb.createSheet("测试表格1");
//			// 第三步，在sheet中添加表头第0行，注意老版本poi对Excel的行数列数有限制
//			HSSFRow row = sheet.createRow(0);
//			// 第四步，创建单元格样式：居中
//			HSSFCellStyle style = wb.createCellStyle();
//			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//			// 第五步，创建表头单元格，并设置样式
//			HSSFCell cell;
//			cell = row.createCell(0);
//			cell.setCellValue("订单编号");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(1);
//			cell.setCellValue("产品名字");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(2);
//			cell.setCellValue("订单内容");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(3);
//			cell.setCellValue("总价格");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(4);
//			cell.setCellValue("使用积分");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(5);
//			cell.setCellValue("收货人");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(6);
//			cell.setCellValue("收货地址");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(7);
//			cell.setCellValue("收货电话");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(8);
//			cell.setCellValue("下单时间");
//			cell.setCellStyle(style);
//
//			cell = row.createCell(9);
//			cell.setCellValue("订单状态");
//			cell.setCellStyle(style);
//
//			int length = list.size();
//			for (int i = 0; i < length; i++) {
//				System.err.println(2222);
//				Order order = list.get(i);
//				HSSFRow row2 = sheet.createRow(i + 1);
//				// 第五步，创建表头单元格，并设置样式
//				HSSFCell cell2;
//				cell2 = row2.createCell(0);
//				cell2.setCellValue(order.getOrderSn());
//				cell2.setCellStyle(style);
//				cell2 = row2.createCell(1);
//				cell2.setCellValue(order.getPageName());
//				cell2.setCellStyle(style);
//
//				cell2 = row2.createCell(2);
//				String itemdesc = "";
//				java.util.List<String> colors = new ArrayList<>();
//				for (OrderItem item : order.getOrderItemSet()) {
//					itemdesc = itemdesc + item.getProductName() + "*"
//							+ item.getProductQuantity() + "(";
//
//					if (!StringUtils.isEmpty(item.getSize())) {
//						itemdesc = itemdesc + item.getSize() + ",";
//					}
//
//					if (!StringUtils.isEmpty(item.getColor())
//							&& item.getColor().indexOf("#") > -1) {
//						itemdesc = itemdesc + "■";
//						colors.add(item.getColor());
//
//					}
//					itemdesc = itemdesc + ")\r\n";
//				}
//
//				HSSFRichTextString ts = new HSSFRichTextString(itemdesc);
//				Matcher slashMatcher = Pattern.compile("■").matcher(itemdesc);
//				int mIdx = 0;
//				while (slashMatcher.find()) {
//					String str = colors.get(mIdx);
//					System.err.println(str);
//					int[] color = new int[3];
//					color[0] = Integer.parseInt(str.substring(1, 3), 16);
//					color[1] = Integer.parseInt(str.substring(3, 5), 16);
//					color[2] = Integer.parseInt(str.substring(5, 7), 16);
//					// 自定义颜色
//					HSSFFont font = wb.createFont();
//					HSSFPalette palette = wb.getCustomPalette();
//					palette.setColorAtIndex((short) (8 + mIdx),
//							(byte) color[0], (byte) color[1], (byte) color[2]);
//					font.setColor((short) (8 + mIdx));
//					int indexx = slashMatcher.start();
//					ts.applyFont(indexx, indexx + 1, font);
//					mIdx++;
//				}
//
//				cell2.setCellValue(ts);
//
//				cell2 = row2.createCell(3);
//				cell2.setCellValue(order.getMoney());
//				cell2.setCellStyle(style);
//
//				cell2 = row2.createCell(4);
//				cell2.setCellValue(order.getPoint() == null ? 0 : order
//						.getPoint());
//				cell2.setCellStyle(style);
//
//				cell2 = row2.createCell(5);
//				cell2.setCellValue(order.getName());
//				cell2.setCellStyle(style);
//
//				cell2 = row2.createCell(6);
//				cell2.setCellValue(order.getAddress());
//				cell2.setCellStyle(style);
//
//				cell2 = row2.createCell(7);
//				cell2.setCellValue(order.getPhone());
//				cell2.setCellStyle(style);
//
//				cell2 = row2.createCell(8);
//				cell2.setCellValue(sdf.format(order.getCreateDate()));
//				cell2.setCellStyle(style);
//
//				String paystat = "未支付";
//				if (order.getPaymentStatus() == PaymentStatus.paid) {
//					paystat = "已支付";
//				} else if (order.getPaymentStatus() == PaymentStatus.send) {
//					paystat = "已发货";
//				} else if (order.getPaymentStatus() == PaymentStatus.free) {
//					paystat = "已取消";
//				} else if (order.getPaymentStatus() == PaymentStatus.deal) {
//					paystat = "已成交";
//				}
//
//				cell2 = row2.createCell(9);
//				cell2.setCellValue(paystat);
//				cell2.setCellStyle(style);
//			}
//
//			ByteArrayOutputStream output = new ByteArrayOutputStream();
//			wb.write(output);
//
//			byte[] ba = output.toByteArray();
//
//			excelFile = new ByteArrayInputStream(ba);
//
//			output.flush();
//
//			output.close();
//
//			return "excel";
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}
//
//	public InputStream getExcelFile() {
//		return excelFile;
//	}
//
//	public void setExcelFile(InputStream excelFile) {
//		this.excelFile = excelFile;
//	}
//
//	public String getDownloadFileName() {
//		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd ");
//
//		String downloadFileName = (sf.format(new Date()).toString()) + ".xls";
//
//		try {
//
//			downloadFileName = new String(downloadFileName.getBytes(),
//
//			"ISO8859-1");
//
//		} catch (UnsupportedEncodingException e) {
//
//			e.printStackTrace();
//
//		}
//
//		return downloadFileName;
//	}
//
//	public void setDownloadFileName(String downloadFileName) {
//		this.downloadFileName = downloadFileName;
//	}
//
//	public Integer getUid() {
//		return uid;
//	}
//
//	public void setUid(Integer uid) {
//		this.uid = uid;
//	}
//
//	public String getBegin() {
//		return begin;
//	}
//
//	public void setBegin(String begin) {
//		this.begin = begin;
//	}
//
//	public String getEnd() {
//		return end;
//	}
//
//	public void setEnd(String end) {
//		this.end = end;
//	}
//
//	public String getType() {
//		return type;
//	}
//
//	public void setType(String type) {
//		this.type = type;
//	}

}
