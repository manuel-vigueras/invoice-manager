package com.latbc.mail;

public class BillParametersBean {

	private String rfcIssuer;
	private String rfcReceiver;
	private String amount;
	private String trxId;
	
	public String getRfcIssuer() {
		return rfcIssuer;
	}
	
	public void setRfcIssuer(String rfcIssuer) {
		this.rfcIssuer = rfcIssuer;
	}
	
	public String getRfcReceiver() {
		return rfcReceiver;
	}
	
	public void setRfcReceiver(String rfcReceiver) {
		this.rfcReceiver = rfcReceiver;
	}
	
	public String getAmount() {
		return amount;
	}
	
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getTrxId() {
		return trxId;
	}
	
	public void setTrxId(String trxId) {
		this.trxId = trxId;
	}
}
