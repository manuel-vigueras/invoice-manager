package com.mx.sivale.dao;

import java.util.List;

import com.mx.sivale.to.AjusteGeneralTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface AjusteGeneralDAO {
	
	public void insert(AjusteGeneralTO ajusteGeneralTO);
	
	public void update(AjusteGeneralTO ajusteGeneralTO);
	
	public void delete(AjusteGeneralTO ajusteGeneralTO);
	
	public List<AjusteGeneralTO> getAll();

}
