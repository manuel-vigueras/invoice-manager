package com.latbc.sivale.beans;

import java.util.Date;

public class InvoiceBean {

	String taxRecord;
	String rfcIssuer;
	String rfcReceiver;
	Date date;
	double amount;
	
	
	
	public InvoiceBean(String taxRecord, String rfcIssuer, String rfcReceiver, Date date, double amount) {
		this.taxRecord = taxRecord;
		this.rfcIssuer = rfcIssuer;
		this.rfcReceiver = rfcReceiver;
		this.date = date;
		this.amount = amount;
	}
	
	/**
	 * @return the taxRecord
	 */
	public String getTaxRecord() {
		return taxRecord;
	}
	/**
	 * @param taxRecord the taxRecord to set
	 */
	public void setTaxRecord(String taxRecord) {
		this.taxRecord = taxRecord;
	}
	/**
	 * @return the rfcIssuer
	 */
	public String getRfcIssuer() {
		return rfcIssuer;
	}
	/**
	 * @param rfcIssuer the rfcIssuer to set
	 */
	public void setRfcIssuer(String rfcIssuer) {
		this.rfcIssuer = rfcIssuer;
	}
	/**
	 * @return the rfcReceiver
	 */
	public String getRfcReceiver() {
		return rfcReceiver;
	}
	/**
	 * @param rfcReceiver the rfcReceiver to set
	 */
	public void setRfcReceiver(String rfcReceiver) {
		this.rfcReceiver = rfcReceiver;
	}
	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return the amount
	 */
	public double getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
}
