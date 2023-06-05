package com.mid.alcohol.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.service.BulletinboardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController 
@RequiredArgsConstructor
@RequestMapping("/api/recommend")
public class BulletinboardRestController {
	
	private final BulletinboardService bulletinboardService;
	
	@GetMapping("/all/{boardId}")
	public ResponseEntity<BulletinboardDetailDto> read(@PathVariable long boardId) {
		log.info("read(id= {})", boardId);
		
		BulletinboardDetailDto dto = bulletinboardService.selectById(boardId);
		log.info("dto= {}", dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@PostMapping("/recommendup/{boardId}")
	public ResponseEntity<Integer> recommendUp(@PathVariable long boardId) {
		log.info("recommentUp(id= {})", boardId);
		
		int result = bulletinboardService.recommendUp(boardId);
		log.info("result= {}", result);
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping("/recommenddo/{boardId}")
	public ResponseEntity<Integer> recommendDo(@PathVariable long boardId) {
		log.info("recommendDo(id= {})", boardId);
		
		int result = bulletinboardService.recommendDo(boardId);
		log.info("result= {}", result);
		
		return ResponseEntity.ok(result);
	}
	
}
