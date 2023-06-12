package com.mid.alcohol.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardHistoryDto;
import com.mid.alcohol.service.BulletinboardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@RequiredArgsConstructor 
@RequestMapping("/bulletinboard/board")
@Controller

// 게시글 이력 불러오기 컨트롤러
public class historyController {
	private final BulletinboardService bulletinboardService;

	@GetMapping("/historylist") 
	public void list(String nickname, Model model) {
		log.info("list()");
		
		List<BulletinboardHistoryDto> dto = bulletinboardService.historyReadByBoardId(nickname);
		
		// 뷰에 BulletinBoardHistoryDto를 전달
		model.addAttribute("histories", dto);
			
	}
	
	@GetMapping("/historydetail") 
    public void historydetail(long id, Model model) {
        log.info("readById(id={})", id);
        
        int result = bulletinboardService.viewsUp(id);
        log.info("result = {}", result);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
        String image = "";
        
        try {
			image = bulletinboardService.listToTagImage(bulletinboardService.resizeImage(dto.getImage()));
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
        model.addAttribute("image", image);
        model.addAttribute("board", dto);
    }
}
