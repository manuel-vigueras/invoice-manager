package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.CuentaContableDAO;
import com.mx.sivale.to.CuentaContableTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class CuentaContableDAOImpl extends
		GenericDAOImpl<CuentaContableTO, Long> implements CuentaContableDAO {

	public CuentaContableDAOImpl() {
		super(CuentaContableTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(CuentaContableTO cuentaContableTO) {
		// TODO Auto-generated method stub
		guardar(cuentaContableTO);
	}

	public void update(CuentaContableTO cuentaContableTO) {
		// TODO Auto-generated method stub
		actualizar(cuentaContableTO);
	}

	public void delete(CuentaContableTO cuentaContableTO) {
		// TODO Auto-generated method stub
		borrar(cuentaContableTO);
	}

	public List<CuentaContableTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
