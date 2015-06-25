package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.CategoriaDAO;
import com.mx.sivale.service.CategoriaService;
import com.mx.sivale.to.CategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class CategoriaServiceImpl implements CategoriaService {
	
	@Autowired
	CategoriaDAO categoriaDAO;

	public void insert(CategoriaTO categoriaTO) {
		// TODO Auto-generated method stub
		
		categoriaDAO.insert(categoriaTO);
		
	}

	public void update(CategoriaTO categoriaTO) {
		// TODO Auto-generated method stub
		categoriaDAO.update(categoriaTO);
		
	}

	public void delete(CategoriaTO categoriaTO) {
		// TODO Auto-generated method stub
		categoriaDAO.delete(categoriaTO);
		
	}

	public List<CategoriaTO> getAll() {
		// TODO Auto-generated method stub
		return categoriaDAO.getAll();
	}

}
