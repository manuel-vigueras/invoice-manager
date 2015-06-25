package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.PerfilDAO;
import com.mx.sivale.service.PerfilService;
import com.mx.sivale.to.PerfilTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class PerfilServiceImpl implements PerfilService{
	
	@Autowired
	PerfilDAO perfilDAO;

	public void insert(PerfilTO perfilTO) {
		// TODO Auto-generated method stub
		perfilDAO.insert(perfilTO);
		
	}

	public void update(PerfilTO perfilTO) {
		// TODO Auto-generated method stub
		perfilDAO.update(perfilTO);
	}

	public void delete(PerfilTO perfilTO) {
		// TODO Auto-generated method stub
		perfilDAO.delete(perfilTO);
	}

	public List<PerfilTO> getAll() {
		// TODO Auto-generated method stub
		return perfilDAO.getAll();
	}

}
