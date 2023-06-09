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
	// 요청 헤더
	static final String cid = "TC0ONETIME"; // 테스트용 가맹점 코드
    static final String admin_Key = "${29d188600c88b0df6eff8f9932a4b71d}"; // myAdminKey
    private KakaoPayDto kakaoPayDto;
    
    public KakaoPayDto kakaoPayDtoReady() {

       // 카카오페이 요청(본문) 양식
       MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
       parameters.add("cid", "TC0ONETIME");
       parameters.add("partner_order_id", "aaa");
       parameters.add("partner_user_id", "aa");
       parameters.add("item_name", "11111");
       parameters.add("quantity", "1");
       parameters.add("total_amount", "1111");
       parameters.add("vat_amount", "111");
       parameters.add("tax_free_amount", "0");
       parameters.add("approval_url", "http://localhost:8081/payment/kakaopaysuccess"); // 성공 시 redirect url
       parameters.add("cancel_url", "http://localhost:8081/payment/kakaopaycancel"); // 취소 시 redirect url
       parameters.add("fail_url", "http://localhost:8081/payment/kakaopayfail"); // 실패 시 redirect url
       
       // 파라미터, 헤더
       HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
       
       // 외부에 보낼 url
       RestTemplate restTemplate = new RestTemplate();

       kakaoPayDto = restTemplate.postForObject(
               "https://kapi.kakao.com/v1/payment/ready", // url
               requestEntity,
               KakaoPayDto.class);
               
       		return kakaoPayDto;
   }
   
   /**
    * 카카오 요구 헤더값
    */
   private HttpHeaders getHeaders() {
       HttpHeaders httpHeaders = new HttpHeaders();

       httpHeaders.set("Authorization", "KakaoAK 29d188600c88b0df6eff8f9932a4b71d");
       httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

       return httpHeaders;
   }
}


