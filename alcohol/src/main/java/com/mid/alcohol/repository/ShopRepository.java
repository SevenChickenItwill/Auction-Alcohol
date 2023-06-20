package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.payment.Basket;
import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shop.AdminProductInfoDto;
import com.mid.alcohol.dto.shop.DeliveryDto;
import com.mid.alcohol.dto.shop.ShopDetailDto;
import com.mid.alcohol.dto.shop.ShopSearchDto;

public interface ShopRepository {

	List<Products> searchlist(ShopSearchDto dto);
	
	List<Products> productall(String userid);

	int createpd(Products products);

	Products readdetail(int pid);

	int deletepd(int pid);
	
	int updatepd(ShopDetailDto dto);

	Products readpd(long pid);

	List<AdminProductInfoDto> getAdminProductInfoDto(String userNickname);

	int createBasket(Basket basket);

	void updateDelivery(DeliveryDto dto);

	
}
