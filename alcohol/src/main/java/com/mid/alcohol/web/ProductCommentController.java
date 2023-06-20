package com.mid.alcohol.web;

import java.util.List;

import org.apache.catalina.connector.Response;
import org.apache.ibatis.annotations.Delete;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.dto.shop.ProductCommentCreateDto;
import com.mid.alcohol.dto.shop.ProductCommentListDto;
import com.mid.alcohol.dto.shop.ProductCommentReadDto;
import com.mid.alcohol.dto.shop.ProductCommentUpdateDto;
import com.mid.alcohol.service.ProductCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/pdComment")
@RestController
public class ProductCommentController {
	
	private final ProductCommentService productCommentService;
   
	@GetMapping("/all/{pId}") 
	public ResponseEntity<List<ProductCommentListDto>> detail(@PathVariable long pId, Model model) {
		log.info("detail={}", pId);
		
		List<ProductCommentListDto> dto = productCommentService.read(pId);
		log.info("dto= {}", dto);
		
		model.addAttribute("post",dto);
		
		return ResponseEntity.ok(dto);
		
		
		
	}
	
	@PostMapping
	public ResponseEntity<Integer> create(@RequestBody ProductCommentCreateDto dto) {
		log.info("create= {}", dto);
		
		int result = productCommentService.create(dto);
		log.info("result={}", result);
		
		return ResponseEntity.ok(result);
	}

	@GetMapping("/{commentId}")
	public ResponseEntity<ProductCommentReadDto> readByCommentId(@PathVariable long commentId) {
		log.info("readByCommentId=(id={})", commentId);
		
		ProductCommentReadDto dto = productCommentService.readByCommentId(commentId);
		log.info("dto={}", dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@PutMapping("/{commentId}")
	public ResponseEntity<Integer> updateReply(
			@PathVariable long commentId,
			@RequestBody ProductCommentUpdateDto dto) {
		log.info("updateComment(id={}, dto={})", commentId, dto);
		
		 int result = productCommentService.update(commentId, dto);
		 
		 return ResponseEntity.ok(result);
	
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Integer> deleteComment(@PathVariable long id) {
		log.info("deleteComment={}", id);
		
		int result = productCommentService.delete(id);
		
		return ResponseEntity.ok(result);
		
	}
}
