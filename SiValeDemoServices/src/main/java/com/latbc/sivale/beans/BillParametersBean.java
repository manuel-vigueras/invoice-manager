package com.latbc.sivale.beans;

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
	
	public static BillParametersBean parseUrl(String url) {
		
		String[] wordsArray = url.split("&");
		String[] results;
		
		BillParametersBean billParametersBean = new BillParametersBean();
		
		for (String word : wordsArray) {
			
			results = word.split("=");
			
			if (word.matches(".*\\bre=\\b.*")) {
				billParametersBean.setRfcIssuer(results[1]);
			} else if (word.matches(".*\\brr=\\b.*")) {
				billParametersBean.setRfcReceiver(results[1]);
			} else if (word.matches(".*\\btt=\\b.*")) {
				
				String amount = results[1];
				amount = amount.replaceFirst("^0+(?!$)", "");
				amount = amount.replaceFirst("(?!$)0+$", "");
				billParametersBean.setAmount(amount);
			} else if (word.matches(".*\\bid=\\b.*")) {
				billParametersBean.setTrxId(results[1]);
			}
		}
		
		return billParametersBean;
	}
}
