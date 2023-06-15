package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shop.ShopSearchDto;

public interface ShopRepository {

	List<Products> searchlist(ShopSearchDto dto);
	
	List<Products> productall();

	int createpd(Products products);
	
}
