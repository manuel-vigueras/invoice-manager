//package com.mx.sivale.actions;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.apache.struts2.convention.annotation.Action;
//import org.apache.struts2.convention.annotation.Namespace;
//import org.apache.struts2.convention.annotation.Namespaces;
//import org.apache.struts2.convention.annotation.ParentPackage;
//import org.apache.struts2.convention.annotation.Result;
//
//import com.mx.sivale.to.TransactionTO;
//
//@ParentPackage(value = "json-default")
//@Action(value = "angularAction", results = {
//		@Result(name = "SUCCESS", type = "json", params = { "root",
//				"transactionData", "excludeNullProperties", "true", "noCache",
//				"true" }), @Result(name = "ERROR", location = "/error.jsp") })
//@Namespaces(value = { @Namespace("/User"), @Namespace("/") })
//public class AngularAction {
//
//	private List<TransactionTO> transactionData = new ArrayList<TransactionTO>();
//
//	public String execute() {
//
//		TransactionTO data = new TransactionTO();
//		data.setId("7549448");
//		data.setFecha("01/05/2015");
//		data.setEstablecimiento("SUSHI ROLL SA DE CV");
//		data.setMonto(170.20);
//		data.setSaldo(200.00);
//		data.setJustificante(null);
//		data.setEstatus("No conciliado");
//		transactionData.add(data);
//
//		data = new TransactionTO();
//		data.setId("7549445");
//		data.setFecha("28/04/2015");
//		data.setEstablecimiento("RETIRO DE EFECTIVO");
//		data.setMonto(2000.00);
//		data.setSaldo(14564.00);
//		data.setJustificante("MONTERREY");
//		data.setEstatus("No conciliado");
//		transactionData.add(data);
//
//		data = new TransactionTO();
//		data.setId("8649501");
//		data.setFecha("27/04/2015");
//		data.setEstablecimiento("RETIRO DE EFECTIVO");
//		data.setMonto(1500.00);
//		data.setSaldo(16564.00);
//		data.setJustificante("MONTERREY");
//		data.setEstatus("Conciliada");
//		transactionData.add(data);
//
//		data = new TransactionTO();
//		data.setId("8649501");
//		data.setFecha("27/04/2015");
//		data.setEstablecimiento("RETIRO DE EFECTIVO");
//		data.setMonto(1500.00);
//		data.setSaldo(16564.00);
//		data.setJustificante("MONTERREY");
//		data.setEstatus("Conciliada");
//		transactionData.add(data);
//
//		return "SUCCESS";
//	}
//
//	public List<TransactionTO> getTransactionData() {
//		return transactionData;
//	}
//
//	public void setTransactionData(List<TransactionTO> transactionData) {
//		this.transactionData = transactionData;
//	}
//}
