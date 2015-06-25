package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.TarjetaDAO;
import com.mx.sivale.to.TarjetaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class TarjetaDAOImpl extends GenericDAOImpl<TarjetaTO, Long> implements TarjetaDAO{

	public TarjetaDAOImpl() {
		super(TarjetaTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(TarjetaTO tarjetaTO) {
		// TODO Auto-generated method stub
		guardar(tarjetaTO);
	}

	public void update(TarjetaTO tarjetaTO) {
		// TODO Auto-generated method stub
		actualizar(tarjetaTO);
	}

	public void delete(TarjetaTO tarjetaTO) {
		// TODO Auto-generated method stub
		borrar(tarjetaTO);
	}

	public List<TarjetaTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
