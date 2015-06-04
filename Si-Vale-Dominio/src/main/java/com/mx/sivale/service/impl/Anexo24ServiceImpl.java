package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.Anexo24DAO;
import com.mx.sivale.service.Anexo24Service;
import com.mx.sivale.to.Anexo24TO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class Anexo24ServiceImpl implements Anexo24Service {
	
	@Autowired
	Anexo24DAO anexo24DAO;

	public void insert(Anexo24TO anexo24TO) {
		// TODO Auto-generated method stub
		anexo24DAO.insert(anexo24TO);
	}

	public void update(Anexo24TO anexo24TO) {
		// TODO Auto-generated method stub
		anexo24DAO.update(anexo24TO);
	}

	public void delete(Anexo24TO anexo24TO) {
		// TODO Auto-generated method stub
		anexo24DAO.delete(anexo24TO);
		
	}

	public List<Anexo24TO> getAll() {
		// TODO Auto-generated method stub
		return anexo24DAO.getAll();
	}

}
