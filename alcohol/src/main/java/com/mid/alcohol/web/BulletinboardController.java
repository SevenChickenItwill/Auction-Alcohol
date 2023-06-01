package com.mid.alcohol.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.dto.CommentReadDto;
import com.mid.alcohol.repository.BulletinboardRepository;
import com.mid.alcohol.service.BulletinboardService;
import com.mid.alcohol.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@RequiredArgsConstructor 
@RequestMapping("/bulletinboard/board")
@Controller
public class BulletinboardController {
    
    private final BulletinboardService bulletinboardService;
    private final CommentService commentService;
    
    private int count = 0;
    private int searchCount = 0;
    
//    @GetMapping("/search")
//    public void searchList(Model model, 
//            @RequestParam("category") String category,
//            @RequestParam("keyword") String keyword,
//            @RequestParam("pagenum") int num) {
//        log.info("searchList(category= {}, keyword= {})", category, keyword);
//        
//        // 검색한 Deal list값을 저장하는 객체 생성.
//        List<BulletnboardListDto> list = bulletnboardService.search(category, keyword);
//        log.info("list ={}", list);
//        
//        // list의 전체 개수
//        int length = list.size();
//        
//        // 마지막 인덱스
//        int len = 0;
//        
//        if (num < 0) {
//            num = 0;
//        }
//        
//        int pageCount = 10 * num;
//        log.info("num = {}", num);
//        
//        
//        if (pageCount + 10 > length) {
//            len = length;
//        } else {
//            len = pageCount + 10;
//        }
//        
//        // 페이지 쪽수를 매기기 위해 설정한 값.
//        searchCount = num;
//        log.info("count= {}", searchCount);
//        
//        // 페이지 쪽수 마지막 값을 찾기 위해서
//        int listPageMax = (int) ((list.size() / 10) + (list.size() % 10) - 1);
//        log.info("listPageMax ={}", listPageMax);
//        
//        model.addAttribute("pageListCount", searchCount);
//        model.addAttribute("length", length);
//        model.addAttribute("num",num);
//        model.addAttribute("maxIndex", len);
//        model.addAttribute("pageCount", pageCount);
//        model.addAttribute("boards", list);
//        model.addAttribute("listSize", list.size());
//        model.addAttribute("listPageMax", listPageMax);
//    }
    
    @GetMapping("/list")
    public void list(Model model, @RequestParam("num") int num) {
        log.info("list()");
        
        // 전체 Deal list값을 저장하는 객체 생성.
        List<BulletinboardListDto> list = bulletinboardService.selectAll();
        
        // list의 전체 개수
        int length = list.size();
        
        // 마지막 인덱스
        int len = 0;
        
        
        if (num < 0) {
            num = 0;
        }
        
        int pageCount = 10 * num;
        log.info("num = {}", num);
        
        
        if (pageCount + 10 > length) {
            len = length;
        } else {
            len = pageCount + 10;
        }
        
        // 페이지 쪽수를 매기기 위해 설정한 값.
        count = num;
        log.info("count= {}", count);
        
        // 페이지 쪽수 마지막 값을 찾기 위해서
        int listPageMax = (int) ((list.size() / 10) + (list.size() % 10) - 1);
        log.info("listPageMax ={}", listPageMax);
        
        model.addAttribute("pageListCount", count);
        model.addAttribute("length", length);
        model.addAttribute("num",num);
        model.addAttribute("maxIndex", len);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("boards", list);
        model.addAttribute("listSize", list.size());
        model.addAttribute("listPageMax", listPageMax);
        
    }
    
    @GetMapping("/detail")
    public void readById(long id, Model model) {
        log.info("readById(id={})", id);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
        
        model.addAttribute("board", dto);
    }
    
    @GetMapping("/modify")
    public void readByIdModify(long id, Model model) {
        log.info("readByIdModify(id= {})", id);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
        model.addAttribute("board", dto);
    }
    
//    @PostMapping("/update")
//    public String readByIdUpdate(Bulletnboard deal, Model model) {
//        log.info("update(deal={})", deal);
//        
//        int result = dealService.readByIdUpdate(deal);
//        log.info("result= {}", result);
//        
//        BulletnboardDetailDto dto = dealService.selectById(deal.getId());
//        model.addAttribute("deal", dto);
//        
//        return "redirect:/deal/comment/detail?id=" + deal.getId();
//    }
//    
//    @PostMapping("/delete")
//    public String dealDelete(long id) {
//        log.info("dealDelete(id= {})", id);
//        
//        int result = dealService.dealDelete(id);
//        log.info("result = {}", result);
//        
//        return "redirect:/deal/comment/comment-list?num=0";
//    }
    
    @GetMapping("/create")
    public void create() {
        log.info("create()");
    }
    
    @PostMapping("/create")
    public String boardCreate(BulletinboardCreateDto dto) {
        log.info("boardCreate(dto= {}, category= {})", dto, dto.getCategory());
        
        int result = bulletinboardService.create(dto);
        log.info("생성 수 = {}", result);
        
        return "redirect:/bulletinboard/board/list?num=0";
    }
    
    
    
}