package com.mx.sivale.to;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mx.sivale.service.impl.FacturaService;

@Service
public class FacturaServiceImpl implements FacturaService {

	public List<FacturaTO> getAllFacturas() {

		List<FacturaTO> listaFacturas = new ArrayList<FacturaTO>();

		FacturaTO to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);

		listaFacturas.add(to);

		return listaFacturas;
	}

	public List<FacturaTO> getFacturasByUsuario(UsuarioTO usuarioTO) {
		List<FacturaTO> listaFacturas = new ArrayList<FacturaTO>();

		FacturaTO to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);

		listaFacturas.add(to);

		return listaFacturas;
	}

	public List<FacturaTO> getFacturasVinculadas() {

		List<FacturaTO> listaFacturas = new ArrayList<FacturaTO>();

		FacturaTO to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		return listaFacturas;
	}

	public List<FacturaTO> getFacturasVinculadasByPeriodo(String periodo) {
		List<FacturaTO> listaFacturas = new ArrayList<FacturaTO>();

		FacturaTO to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		return listaFacturas;
	}

	public FacturaTO getFacturaByFolio(String folio) {

		FacturaTO to = new FacturaTO();

		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		return to;
	}

	public List<FacturaTO> getFacturasNoVinculadas() {
		List<FacturaTO> listaFacturas = new ArrayList<FacturaTO>();

		FacturaTO to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		to = new FacturaTO();
		to.setUsuario("Mariana Ram??rez Cant??");
		to.setTarjeta("2364001538145683");
		to.setFolio("23712");
		to.setFecha("03/05/2015");
		to.setRfcEmisor("SORIANA BLVD");
		to.setMonto(105.00);
		to.setEstatusSat("Valido");

		listaFacturas.add(to);

		return listaFacturas;
	}

}
