package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.CentroCostoTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface CentroCostoService {
	
	public void insert(CentroCostoTO centroCostoTO);

	public void update(CentroCostoTO centroCostoTO);

	public void delete(CentroCostoTO centroCostoTO);

	public List<CentroCostoTO> getAll();

}
