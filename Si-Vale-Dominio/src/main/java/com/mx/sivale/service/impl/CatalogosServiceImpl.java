package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.CatalogosDAO;
import com.mx.sivale.service.CatalogosService;
import com.mx.sivale.to.CatalogoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class CatalogosServiceImpl implements CatalogosService{
	
	@Autowired
	CatalogosDAO catalogosDAO;

	public void insert(CatalogoTO catalogoTO) {
		// TODO Auto-generated method stub
		catalogosDAO.insert(catalogoTO);
		
	}

	public void update(CatalogoTO catalogoTO) {
		// TODO Auto-generated method stub
		catalogosDAO.update(catalogoTO);
		
	}

	public void delete(CatalogoTO catalogoTO) {
		// TODO Auto-generated method stub
		catalogosDAO.delete(catalogoTO);
		
	}

	public List<CatalogoTO> getAll() {
		// TODO Auto-generated method stub
		return catalogosDAO.getAll();
	}

}
