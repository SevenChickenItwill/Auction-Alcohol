package com.mid.alcohol.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.domain.Deal;
import com.mid.alcohol.dto.DealCreateDto;
import com.mid.alcohol.dto.DealDetailDto;
import com.mid.alcohol.dto.DealListDto;
import com.mid.alcohol.service.DealService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@RequiredArgsConstructor 
@RequestMapping("/deal/comment")
@Controller
public class DealController {
    
    private final DealService dealService;
    
    @GetMapping("/comment-list")
    public void list(Model model, @RequestParam("num") int num) {
        log.info("list()");
        
        // 전체 Deal list값을 저장하는 객체 생성.
        List<DealListDto> list = dealService.selectAll();
        
        // list의 전체 개수
        int length = list.size();
        
        // 마지막 인덱스
        int len = 0;
        
        if (num < 0) {
            num = 0;
        }
        
        int pageCount = 10 * num;
        
        if (pageCount + 10 > length) {
            len = length;
        } else {
            len = pageCount + 10;
        }
        
        model.addAttribute("length", length);
        model.addAttribute("num",num);
        model.addAttribute("maxIndex", len);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("deals", list);
        
    }
    
    @GetMapping("/detail")
    public void readById(long id, Model model) {
        log.info("readById(id={})", id);
        
        DealDetailDto dto = dealService.selectById(id);
        log.info("dto= {}", dto);
        
        model.addAttribute("deal", dto);
    }
    
    @GetMapping("/modify")
    public void readByIdModify(long id, Model model) {
        log.info("readByIdModify(id= {})", id);
        
        DealDetailDto dto = dealService.selectById(id);
        log.info("dto= {}", dto);
        
        model.addAttribute("deal", dto);
    }
    
    @PostMapping("/update")
    public String readByIdUpdate(Deal deal, Model model) {
        log.info("update(deal={})", deal);
        
        int result = dealService.readByIdUpdate(deal);
        log.info("result= {}", result);
        
        DealDetailDto dto = dealService.selectById(deal.getId());
        model.addAttribute("deal", dto);
        
        return "redirect:/deal/comment/detail?id=" + deal.getId();
    }
    
    @PostMapping("/delete")
    public String dealDelete(long id) {
        log.info("dealDelete(id= {})", id);
        
        int result = dealService.dealDelete(id);
        log.info("result = {}", result);
        
        return "redirect:/deal/comment/comment-list";
    }
    
    @GetMapping("/create")
    public void create() {
        log.info("create()");
    }
    
    @PostMapping("/create")
    public String postCreate(DealCreateDto dto) {
        log.info("postCreate(dto= {})", dto);
        
        int result = dealService.create(dto);
        log.info("생성 수 = {}", result);
        
        return "redirect:/deal/comment/comment-list";
    }
    
}
