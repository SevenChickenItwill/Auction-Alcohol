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

import com.mid.alcohol.domain.board.Bulletinboard;
import com.mid.alcohol.domain.board.RecommendDown;
import com.mid.alcohol.domain.board.RecommendUp;
import com.mid.alcohol.dto.board.BulletinboardCreateDto;
import com.mid.alcohol.dto.board.BulletinboardDetailDto;
import com.mid.alcohol.dto.board.BulletinboardListDto;
import com.mid.alcohol.dto.board.BulletinboardUpdateDto;
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
		log.info("recommentUp(board_id= {}, login_id= {})", boardId, loginId);
		
		RecommendUp recommend = new RecommendUp(boardId, loginId);
		
		// 추천 업, 테이블 추가 전 중복 검색
		int recommendUpSelect = bulletinboardService.recommendUpSelect(recommend);
		log.info("recommendUpSelect= {}", recommendUpSelect);
		
		if (recommendUpSelect != 0) {
			log.info("중복 추천 입니다.");
			
			return ResponseEntity.ok(recommendUpSelect);
		}
		
		// 추천 업시 게시글 추천 +1
		int result = bulletinboardService.recommendUp(boardId);
		log.info("result= {}", result);
		
		// 추천 업시 COMMMENDUP 테이블에 객체 추가
		int recommendUpInsert = bulletinboardService.recommendUpInsert(recommend);
		log.info("recommendUpInsert= {}", recommendUpInsert);
		
		return ResponseEntity.ok(recommendUpSelect);
	}
	
	@PostMapping("/recommenddo/{boardId},{loginId}")
	public ResponseEntity<Integer> recommendDo(
			@PathVariable long boardId,
			@PathVariable String loginId) {
		log.info("recommendDo(board_id= {}, login_id= {})", boardId, loginId);
		
		RecommendDown recommend = new RecommendDown(boardId, loginId);
		
		// 추천 다운, 테이블 추가 전 중복 검색
		int recommendDownSelect = bulletinboardService.recommendDownSelect(recommend);
		log.info("recommendDownSelect= {}", recommendDownSelect);
		
		if (recommendDownSelect != 0) {
			log.info("중복 비추천 입니다.");
			
			return ResponseEntity.ok(recommendDownSelect);
		}
		
		// 추천 다운시 게시글 추천 -1
		int result = bulletinboardService.recommendDo(boardId);
		log.info("result= {}", result);
		
		// 추천 다운시 COMMENDDOWN테이블에 객체 추가
		int recommendDownInsert = bulletinboardService.recommendDownInsert(recommend);
		log.info("recommendDownInsert= {}", recommendDownInsert);
		
		return ResponseEntity.ok(recommendDownSelect);
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
