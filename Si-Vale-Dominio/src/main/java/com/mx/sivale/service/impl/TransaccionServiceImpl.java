package com.mx.sivale.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mx.sivale.service.TransaccionService;
import com.mx.sivale.to.TransaccionTO;
import com.mx.sivale.to.UsuarioTO;

@Service
public class TransaccionServiceImpl implements TransaccionService {

	public List<TransaccionTO> getAllTransacciones() {

		List<TransaccionTO> transactionDataList = new ArrayList<TransaccionTO>();

		TransaccionTO data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("POLMAL SA CV");
		data.setMonto(1345.00);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		return transactionDataList;
	}

	public List<TransaccionTO> getTransaccionesByUsuario(UsuarioTO usuarioTO) {
		List<TransaccionTO> transactionDataList = new ArrayList<TransaccionTO>();

		TransaccionTO data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		return transactionDataList;
	}

	public List<TransaccionTO> getTransaccionesByJustificante(
			String justificantes) {

		List<TransaccionTO> transactionDataList = new ArrayList<TransaccionTO>();

		TransaccionTO data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		return transactionDataList;

	}

	public List<TransaccionTO> getTransaccionesByPeriodo(String periodo) {

		List<TransaccionTO> transactionDataList = new ArrayList<TransaccionTO>();

		TransaccionTO data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		data = new TransaccionTO();
		data.setUsuario("Alfonso López Alcántara");
		data.setTarjeta("23640015 38164532");
		data.setId("7549448");
		data.setFecha("01/05/2015");
		data.setConcepto("CAPITAL JEANS SA CV");
		data.setMonto(170.20);
		data.setSaldo(200.00);
		data.setJustificante("Monterrey");
		data.setEstatus("No conciliado");
		transactionDataList.add(data);

		return transactionDataList;
	}

}
