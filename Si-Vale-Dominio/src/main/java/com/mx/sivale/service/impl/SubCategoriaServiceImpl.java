package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.SubCategoriaDAO;
import com.mx.sivale.service.SubCategoriaService;
import com.mx.sivale.to.SubCategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class SubCategoriaServiceImpl implements SubCategoriaService {

	@Autowired
	SubCategoriaDAO subCategoriaDAO;

	public void insert(SubCategoriaTO subCategoriaTO) {
		// TODO Auto-generated method stub
		subCategoriaDAO.insert(subCategoriaTO);
		
	}

	public void update(SubCategoriaTO subCategoriaTO) {
		// TODO Auto-generated method stub
		subCategoriaDAO.update(subCategoriaTO);
	}

	public void delete(SubCategoriaTO subCategoriaTO) {
		// TODO Auto-generated method stub
		subCategoriaDAO.delete(subCategoriaTO);
	}

	public List<SubCategoriaTO> getAll() {
		// TODO Auto-generated method stub
		return subCategoriaDAO.getAll();
	}

}
