package com.mid.alcohol.domain.auction;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class AuctionProducts {
    // 경매물품 테이블
	
	private String userId; // 상품을 등록한 ID
    private int productId; // 상품코드
    private String pName; // 상품명
    private int category; // 분류
    private String constructor; // 제조사(생산자)
    private String brandName; // 브랜드명
    private long cost; // 경매품 원가(매입가)
    
    
    public void toWildcard(AuctionProducts entity) {
    	if (!brandName.equals("")) {
    		entity.setBrandName("%"+brandName+"%");
    	}
    	
    	if (!constructor.equals("")) {
    		entity.setConstructor("%"+constructor+"%");
    	}
    	
    	if (!pName.equals("")) {
    		entity.setPName("%"+pName+"%");
    	}
    	
    }
}

