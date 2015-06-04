package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.CentroCostoDAO;
import com.mx.sivale.service.CentroCostoService;
import com.mx.sivale.to.CentroCostoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class CentroCostoServiceImpl implements CentroCostoService{
	
	@Autowired
	CentroCostoDAO centroCostoDAO;

	public void insert(CentroCostoTO centroCostoTO) {
		// TODO Auto-generated method stub
		centroCostoDAO.insert(centroCostoTO);
		
	}

	public void update(CentroCostoTO centroCostoTO) {
		// TODO Auto-generated method stub
		centroCostoDAO.update(centroCostoTO);
	}

	public void delete(CentroCostoTO centroCostoTO) {
		// TODO Auto-generated method stub
		centroCostoDAO.delete(centroCostoTO);
	}

	public List<CentroCostoTO> getAll() {
		// TODO Auto-generated method stub
		return centroCostoDAO.getAll();
	}

}
