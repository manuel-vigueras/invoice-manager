package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.CategoriaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface CategoriaService {
	
	public void insert(CategoriaTO categoriaTO);

	public void update(CategoriaTO categoriaTO);

	public void delete(CategoriaTO categoriaTO);

	public List<CategoriaTO> getAll();

}
