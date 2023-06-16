package com.mid.alcohol.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.board.Comment;
import com.mid.alcohol.domain.shop.ProductComment;
import com.mid.alcohol.dto.board.CommentListDto;
import com.mid.alcohol.dto.shop.ProductCommentCreateDto;
import com.mid.alcohol.dto.shop.ProductCommentListDto;
import com.mid.alcohol.dto.shop.ProductCommentReadDto;
import com.mid.alcohol.dto.shop.ProductCommentUpdateDto;
import com.mid.alcohol.repository.CommentRepository;
import com.mid.alcohol.repository.ProductCommentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ProductCommentService {
	
	private final ProductCommentRepository productCommentRepository;

		
		 // 게시글 고유 번호로 댓글을 찾아 list에 저장, 댓글 읽어오기
	    public List<ProductCommentListDto> read(long pId) {
	        log.info("read(pId={})", pId);
	        
	        List<ProductComment> list = productCommentRepository.selectBypId(pId);
	        
	        List<ProductCommentListDto> list2 = new ArrayList<>();
	        for(ProductComment x : list) {
	        	
	        	list2.add(ProductCommentListDto.fromEntity(x));
	        }
	        
	        return list2;
	    }


		public int create(ProductCommentCreateDto dto) {
			log.info("create=(dto={})", dto);
			
			
			return productCommentRepository.insert(dto.toEntity());
		}


		public ProductCommentReadDto readByCommentId(long commentId) {
			log.info("delete(id={})", commentId);
			
			ProductComment entity = productCommentRepository.selectByCommentId(commentId);
			
			return ProductCommentReadDto.fromEntity(entity);
		}


		public int update(long commentId, ProductCommentUpdateDto dto) {
			log.info("update(commentId={}, dto={})", commentId, dto);
			
			ProductComment entity = ProductComment.builder()
					.commentId(commentId)
					.content(dto.getContent())
					.build();
			log.info("entity={}", entity);
			
			return productCommentRepository.update(entity);
		}


		public int delete(long commentId) {
			log.info("delete(id={})", commentId);
			
			return productCommentRepository.delete(commentId);
		}
		


}
