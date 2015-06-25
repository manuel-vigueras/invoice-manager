package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.SubCategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface SubCategoriaService {
	
	public void insert(SubCategoriaTO subCategoriaTO);

	public void update(SubCategoriaTO subCategoriaTO);

	public void delete(SubCategoriaTO subCategoriaTO);

	public List<SubCategoriaTO> getAll();

}
