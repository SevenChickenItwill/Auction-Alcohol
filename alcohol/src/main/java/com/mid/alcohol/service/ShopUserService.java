package com.mid.alcohol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.auction.AuctionListDto;
import com.mid.alcohol.dto.auction.AuctionSearchDto;
import com.mid.alcohol.dto.board.BulletinboardListDto;
import com.mid.alcohol.dto.shopuser.ShopCategoryDto;
import com.mid.alcohol.dto.shopuser.ShopUserReadDto;
import com.mid.alcohol.dto.shopuser.ShopUserSearchDto;
import com.mid.alcohol.repository.ShopUserRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ShopUserService {

	@Autowired
	private ShopUserRepository shopUserRepository;
	
	// 상품 리스트 읽기..
	public List<ShopUserReadDto> read() {
		log.info("read()");
		return shopUserRepository.readProductsInfo();
	}
	
	
	// 상품 카테고리 별로..
	public List<Products> category(int category) {
		log.info("category(category= {})", category);
		
		return shopUserRepository.category(category);
	}

	// 상품 검색..
	public List<ShopUserReadDto> search(String category, String keyword) {
        log.info("searech(category= {}, keyword= {})", category, keyword);
        
        if (category.equals("pname")) {
        	
        	 List<ShopUserReadDto> list = shopUserRepository.searchProductname(keyword);

             
             return list;
        } else if (category.equals("brand")) {
        	
        	List<ShopUserReadDto> list = shopUserRepository.searchBrand(keyword);

            
            return list;
        } else if (category.equals("pnamebrand")) {
            String keywordPname = keyword;
            String keywordBrand = keywordPname;
            
            ShopUserSearchDto dto = new ShopUserSearchDto(keyword, keywordPname);
            
            List<ShopUserReadDto> list = shopUserRepository.searchProductnameAndBrand(dto);

            
            return list;
        }  
        
        return null;
    }	
}
