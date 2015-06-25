package com.mx.sivale.dao;

import java.util.List;

import com.mx.sivale.to.PerfilTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface PerfilDAO {
	
	public void insert(PerfilTO perfilTO);

	public void update(PerfilTO perfilTO);

	public void delete(PerfilTO perfilTO);

	public List<PerfilTO> getAll();

}
