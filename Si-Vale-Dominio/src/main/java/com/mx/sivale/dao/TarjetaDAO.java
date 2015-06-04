package com.mx.sivale.dao;

import java.util.List;

import com.mx.sivale.to.TarjetaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface TarjetaDAO {
	
	public void insert(TarjetaTO tarjetaTO);

	public void update(TarjetaTO tarjetaTO);

	public void delete(TarjetaTO tarjetaTO);

	public List<TarjetaTO> getAll();

}
