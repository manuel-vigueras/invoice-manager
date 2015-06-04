package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.AjusteGeneralDAO;
import com.mx.sivale.service.AjusteGeneralService;
import com.mx.sivale.to.AjusteGeneralTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class AjusteGeneralServiceImpl implements AjusteGeneralService{
	
	@Autowired
	AjusteGeneralDAO ajusteGeneralDAO;

	public void insert(AjusteGeneralTO ajusteGeneralTO) {
		// TODO Auto-generated method stub
		ajusteGeneralDAO.insert(ajusteGeneralTO);
		
	}

	public void update(AjusteGeneralTO ajusteGeneralTO) {
		// TODO Auto-generated method stub
		ajusteGeneralDAO.update(ajusteGeneralTO);
		
	}

	public void delete(AjusteGeneralTO ajusteGeneralTO) {
		// TODO Auto-generated method stub
		ajusteGeneralDAO.update(ajusteGeneralTO);
	}

	public List<AjusteGeneralTO> getAll() {
		// TODO Auto-generated method stub
		return ajusteGeneralDAO.getAll();
	}

}
