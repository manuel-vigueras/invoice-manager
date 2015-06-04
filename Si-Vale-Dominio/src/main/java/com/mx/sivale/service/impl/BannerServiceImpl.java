package com.mx.sivale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.sivale.dao.BannerDAO;
import com.mx.sivale.service.BannerService;
import com.mx.sivale.to.BannerTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
@Service
public class BannerServiceImpl implements BannerService{
	
	@Autowired
	BannerDAO bannerDAO;

	public void insert(BannerTO bannerTO) {
		// TODO Auto-generated method stub
		bannerDAO.insert(bannerTO);
		
	}

	public void update(BannerTO bannerTO) {
		// TODO Auto-generated method stub
		bannerDAO.update(bannerTO);
		
	}

	public void delete(BannerTO bannerTO) {
		// TODO Auto-generated method stub
		bannerDAO.delete(bannerTO);
		
	}

	public List<BannerTO> getAll() {
		// TODO Auto-generated method stub
		return bannerDAO.getAll();
	}

}
