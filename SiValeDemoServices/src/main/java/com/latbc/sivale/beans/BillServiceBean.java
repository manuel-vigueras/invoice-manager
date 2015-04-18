package com.latbc.sivale.beans;

public class BillServiceBean {
	
	private String url;
	
	public BillServiceBean () {}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "BillParametersBean [url=" + url + "]";
	}
}
