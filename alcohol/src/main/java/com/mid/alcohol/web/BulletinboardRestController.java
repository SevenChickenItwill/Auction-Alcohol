package com.mid.alcohol.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mid.alcohol.domain.RecommendDown;
import com.mid.alcohol.domain.RecommendUp;
import com.mid.alcohol.dto.BulletinboardCreateDto;
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
	public ResponseEntity<Integer> recommendUp(
			@PathVariable long boardId,
			@PathVariable("loginId") String userId) {
		log.info("recommentUp(id= {})", boardId);
		
		RecommendUp up = bulletinboardService.recommendUpSelect(boardId, userId);
		
		int result = bulletinboardService.recommendUp(boardId);
		log.info("result= {}", result);
		
		// 추천업 테이블에 board_id, user_nickname 넣기
		int upResult = bulletinboardService.recommendUpInsert(boardId, userId);
		log.info("upResult= {}", upResult);
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping("/recommenddo/{boardId}")
	public ResponseEntity<Integer> recommendDo(
			@PathVariable long boardId,
			@PathVariable("loginId") String userId) {
		log.info("recommendDo(id= {})", boardId);
		
		RecommendDown down = bulletinboardService.recommendDownSelect(boardId, userId);
		
		int result = bulletinboardService.recommendDo(boardId);
		log.info("result= {}", result);
		
		// 추천다운 테이블에 board_id, user_nickname 넣기
		int upResult = bulletinboardService.recommendDelete(boardId, userId);
		log.info("upResult= {}", upResult);
		
		return ResponseEntity.ok(result);
	}
	
	
}
