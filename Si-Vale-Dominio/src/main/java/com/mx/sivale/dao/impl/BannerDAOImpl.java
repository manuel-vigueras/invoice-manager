package com.mx.sivale.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mx.sivale.dao.BannerDAO;
import com.mx.sivale.to.BannerTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Repository
public class BannerDAOImpl extends GenericDAOImpl<BannerTO, Long> implements BannerDAO{

	public BannerDAOImpl() {
		super(BannerTO.class);
		// TODO Auto-generated constructor stub
	}

	public void insert(BannerTO bannerTO) {
		// TODO Auto-generated method stub
		guardar(bannerTO);
	}

	public void update(BannerTO bannerTO) {
		// TODO Auto-generated method stub
		actualizar(bannerTO);
	}

	public void delete(BannerTO bannerTO) {
		// TODO Auto-generated method stub
		borrar(bannerTO);
	}

	public List<BannerTO> getAll() {
		// TODO Auto-generated method stub
		return buscar();
	}

}
