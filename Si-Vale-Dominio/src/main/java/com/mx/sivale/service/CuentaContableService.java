package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.CuentaContableTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface CuentaContableService {
	
	public void insert(CuentaContableTO cuentaContableTO);

	public void update(CuentaContableTO cuentaContableTO);

	public void delete(CuentaContableTO cuentaContableTO);

	public List<CuentaContableTO> getAll();

}
