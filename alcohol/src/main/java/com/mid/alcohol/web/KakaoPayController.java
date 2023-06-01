package com.mid.alcohol.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.KakaoPay;
import com.mid.alcohol.dto.KakaoPayDto;
import com.mid.alcohol.service.KakaoPayService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class KakaoPayController {
	 
    /**
     * 결제요청
     */
  
    /**
     * 결제 진행 중 취소
     */


    /**
     * 결제 실패
     */

}
