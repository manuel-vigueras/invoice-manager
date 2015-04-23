package com.latbc.sivale.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TransactionBean {

	String id;
	Date date;
	String concept;
	double amount;
	double balance;
	String status;
	List<InvoiceBean> invoiceList;
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
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
	 * @return the concept
	 */
	public String getConcept() {
		return concept;
	}
	/**
	 * @param concept the concept to set
	 */
	public void setConcept(String concept) {
		this.concept = concept;
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
	/**
	 * @return the balance
	 */
	public double getBalance() {
		return balance;
	}
	/**
	 * @param balance the balance to set
	 */
	public void setBalance(double balance) {
		this.balance = balance;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the invoiceList
	 */
	public List<InvoiceBean> getInvoiceList() {
		return invoiceList;
	}
	/**
	 * @param invoiceList the invoiceList to set
	 */
	public void setInvoiceList(List<InvoiceBean> invoiceList) {
		this.invoiceList = invoiceList;
	}
	
	/**
	 * @param invoice
	 */
	public void addInvoice(InvoiceBean invoice) {
		if (this.invoiceList==null) {
			this.invoiceList = new ArrayList<InvoiceBean>();
		}
		invoiceList.add(invoice);
	}
	
}
