package com.mid.alcohol.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.domain.Deal;
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
    
    //comment-list.jsp에 Deal Post 목록 전체 보기.
    @GetMapping("/comment-list") 
    public void list(Model model) {
        log.info("list()");
        
        List<DealListDto> list = dealService.selectAll();
        log.info("list= {}", list);
        
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
    
}
