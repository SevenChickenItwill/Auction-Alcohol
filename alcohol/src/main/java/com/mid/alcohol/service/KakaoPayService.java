package com.mid.alcohol.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.mid.alcohol.dto.KakaoPayDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class KakaoPayService {
	static final String cid = "TC0ONETIME"; // 가맹점 테스트 코드
    static final String admin_Key = "${29d188600c88b0df6eff8f9932a4b71d}"; // 어드민 키
    private KakaoPayDto kakaoPayDto;
    
    public KakaoPayDto kakaoPayDtoReady() {

       // 카카오페이 요청 양식
       MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
       parameters.add("cid", cid);
       parameters.add("partner_order_id", "가맹점 주문 번호");
       parameters.add("partner_user_id", "가맹점 회원 ID");
       parameters.add("item_name", "상품명");
       parameters.add("quantity", "주문 수량");
       parameters.add("total_amount", "총 금액");
       parameters.add("vat_amount", "부가세");
       parameters.add("tax_free_amount", "상품 비과세 금액");
       parameters.add("approval_url", "http://localhost:8080/payment/success"); // 성공 시 redirect url
       parameters.add("cancel_url", "http://localhost:8080/payment/cancel"); // 취소 시 redirect url
       parameters.add("fail_url", "http://localhost:8080/payment/fail"); // 실패 시 redirect url
       
       // 파라미터, 헤더
       HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
       
       // 외부에 보낼 url
       RestTemplate restTemplate = new RestTemplate();

       kakaoPayDto = restTemplate.postForObject(
               "https://kapi.kakao.com/v1/payment/ready",
               requestEntity,
               KakaoPayDto.class);
               
       return kakaoPayDto;
   }
   
   /**
    * 카카오 요구 헤더값
    */
   private HttpHeaders getHeaders() {
       HttpHeaders httpHeaders = new HttpHeaders();

       String auth = "KakaoAK " + admin_Key;

       httpHeaders.set("Authorization", auth);
       httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

       return httpHeaders;
   }
}


