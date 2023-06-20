package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shopuser.ShopUserReadDto;
import com.mid.alcohol.dto.shopuser.ShopUserSearchDto;

public interface ShopUserRepository {
	// 상품 정보 읽기
	List<ShopUserReadDto> readProductsInfo();
	
	
	// 상품 종류별로(카테고리) 보기
	List<Products> category(int category);
	
	
	// 상품별 / 브랜드별 검색
	List<ShopUserReadDto> searchProductname(String productname);	    
	List<ShopUserReadDto> searchBrand(String brand);    
	List<ShopUserReadDto> searchProductnameAndBrand(ShopUserSearchDto dto);
	
	
}
