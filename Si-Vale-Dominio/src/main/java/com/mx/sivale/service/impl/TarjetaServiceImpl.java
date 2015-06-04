package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.TarjetaDAO;
import com.mx.sivale.service.TarjetaService;
import com.mx.sivale.to.TarjetaTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class TarjetaServiceImpl implements TarjetaService {

	@Autowired
	TarjetaDAO tarjetaDAO;

	public void insert(TarjetaTO tarjetaTO) {
		// TODO Auto-generated method stub
		tarjetaDAO.insert(tarjetaTO);
	}

	public void update(TarjetaTO tarjetaTO) {
		// TODO Auto-generated method stub
		tarjetaDAO.update(tarjetaTO);
	}

	public void delete(TarjetaTO tarjetaTO) {
		// TODO Auto-generated method stub
		tarjetaDAO.delete(tarjetaTO);
	}

	public List<TarjetaTO> getAll() {
		// TODO Auto-generated method stub
		return tarjetaDAO.getAll();
	}

}
