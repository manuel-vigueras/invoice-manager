package com.mx.sivale.service;

import java.util.List;

import com.mx.sivale.to.BannerTO;

/**
 * @author kevin-mendez, 2Big
 *
 */
public interface BannerService {
	
	public void insert(BannerTO bannerTO);

	public void update(BannerTO bannerTO);

	public void delete(BannerTO bannerTO);

	public List<BannerTO> getAll();

}
