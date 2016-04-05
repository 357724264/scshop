package com.wudianyi.wb.scshop.bean;

import com.thoughtworks.xstream.XStream;

public class NoticeRequest {
	private static XStream xstream;

	private String status = "";
	private String billstatus = "";
	private String message = "";
	private Result lastResult = new Result();

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBillstatus() {
		return billstatus;
	}

	public void setBillstatus(String billstatus) {
		this.billstatus = billstatus;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Result getLastResult() {
		return lastResult;
	}

	public void setLastResult(Result lastResult) {
		this.lastResult = lastResult;
	}

	private static XStream getXStream() {
		if (xstream == null) {
			xstream = new XStream();
			xstream.autodetectAnnotations(true);
			xstream.alias("pushRequest", NoticeRequest.class);
			xstream.alias("item", ResultItem.class);
			
		}
		return xstream;
	}

	public String toXml() {
		return "<?xml version='1.0' encoding='UTF-8'?>\r\n" + getXStream().toXML(this);
	}

	public static NoticeRequest fromXml(String sXml) {
		return (NoticeRequest) getXStream().fromXML(sXml);
	}



}
