package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.CuentaContableDAO;
import com.mx.sivale.service.CuentaContableService;
import com.mx.sivale.to.CuentaContableTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class CuentaContableServiceImpl implements CuentaContableService{
	
	@Autowired
	CuentaContableDAO cuentaContableDAO;

	public void insert(CuentaContableTO cuentaContableTO) {
		// TODO Auto-generated method stub
		cuentaContableDAO.insert(cuentaContableTO);
		
	}

	public void update(CuentaContableTO cuentaContableTO) {
		// TODO Auto-generated method stub
		cuentaContableDAO.update(cuentaContableTO);
	}

	public void delete(CuentaContableTO cuentaContableTO) {
		// TODO Auto-generated method stub
		cuentaContableDAO.delete(cuentaContableTO);
	}

	public List<CuentaContableTO> getAll() {
		// TODO Auto-generated method stub
		return cuentaContableDAO.getAll();
	}

}
