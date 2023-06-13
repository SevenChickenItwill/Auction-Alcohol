package com.mid.alcohol.web;

import java.io.File;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.domain.RecommendDown;
import com.mid.alcohol.domain.RecommendUp;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.dto.BulletinboardUpdateDto;
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
	
	@PostMapping("/recommendup/boardId={boardId},loginId={loginId}")
	public ResponseEntity<Integer> recommendUp(
			@PathVariable long boardId,
			@PathVariable String loginId) {
		log.info("recommentUp(id= {})", boardId);
		
		RecommendUp recommend = new RecommendUp(boardId, loginId);
		
		int selectResult = bulletinboardService.recommendUpSelect(recommend);
		
		if (selectResult == 1) {
			return ResponseEntity.ok(selectResult);
		}
		
		int result = bulletinboardService.recommendUp(boardId);
		log.info("result= {}", result);
		
		int insertResult = bulletinboardService.recommendUpInsert(recommend);
		log.info("insertResult= {}", insertResult);
		
		return ResponseEntity.ok(selectResult);
	}
	
	@PostMapping("/recommenddo/{boardId},{loginId}")
	public ResponseEntity<Integer> recommendDo(
			@PathVariable long boardId,
			@PathVariable String loginId) {
		log.info("recommendDo(id= {})", boardId);
		
		RecommendDown recommend = new RecommendDown(boardId, loginId);
		
		int selectResult = bulletinboardService.recommendDownSelect(recommend);
		
		if (selectResult == 1) {
			return ResponseEntity.ok(selectResult);
		}
		
		int result = bulletinboardService.recommendDo(boardId);
		log.info("result= {}", result);
		
		int insertRresult = bulletinboardService.recommendDownInsert(recommend);
		log.info("insertRresult= {}", insertRresult);
		
		return ResponseEntity.ok(selectResult);
	}
	
	@PostMapping("/create/{category}/{nickname}/{user_id}/{title}/{content}")
	public ResponseEntity<Bulletinboard> boardDtoCreate(
			@PathVariable int category,
			@PathVariable String nickname,
			@PathVariable String user_id,
			@PathVariable String title,
			@PathVariable String content
		) {
		BulletinboardCreateDto dto = new BulletinboardCreateDto(category, nickname, user_id, title, content);
		log.info("boardCreate(dto= {})", dto);
		
		int result = bulletinboardService.create(dto);
		log.info("생성 수 = {}", result);
		
		Bulletinboard board = bulletinboardService.selectNicknameOrderByboardId(dto.getNickname());
		
		return ResponseEntity.ok(board);
	}
	
	@PostMapping("/update/{board_id}/{title}/{content}")
	public ResponseEntity<Long> boardDtoCreate(
			@PathVariable long board_id,
			@PathVariable String title,
			@PathVariable String content
		) {
		BulletinboardUpdateDto dto = new BulletinboardUpdateDto(board_id, title, content);
		log.info("boardCreate(dto= {})", dto);
		
		int result = bulletinboardService.readByIdUpdate(dto);
		log.info("생성 수 = {}", result);
		
		return ResponseEntity.ok(board_id);
	}
	
}
