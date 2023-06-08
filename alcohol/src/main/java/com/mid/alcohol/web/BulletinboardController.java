package com.mid.alcohol.web;

import java.awt.Image;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardImageDetailDto;
import com.mid.alcohol.dto.BulletinboardImageListDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.service.BulletinboardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@RequiredArgsConstructor 
@RequestMapping("/bulletinboard/board")
@Controller
public class BulletinboardController {
    
    private final BulletinboardService bulletinboardService;
    
    private int count = 0;
    private int searchCount = 0;
    
    @GetMapping("/search")
    public void searchList(Model model, 
            @RequestParam("category") String category,
            @RequestParam("keyword") String keyword,
            @RequestParam("pagenum2") int pagenum) {
        log.info("searchList(category= {}, keyword= {}, pagenum= {})", category, keyword, pagenum);
        
        // 검색한 Deal list값을 저장하는 객체 생성.
        List<BulletinboardListDto> list = bulletinboardService.search(category, keyword);
        
        // 이미지를 저장하는 리스트 생성
        List<BulletinboardImageListDto> dtos = new ArrayList<>();
        
     // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		BulletinboardImageListDto dto = new BulletinboardImageListDto(
        				list.get(i).getBoard_id()
        				, list.get(i).getCategory()
        				, list.get(i).getTitle()
        				, bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage()))
        				, list.get(i).getNickname()
        				, list.get(i).getUser_id()
        				, list.get(i).getTime()
        				, list.get(i).getViews()
        				, list.get(i).getRecommend()
        				, list.get(i).getRcnt()
        				, list.get(i).getContent());
        		
        		dtos.add(dto);
        		
			} catch (Exception e) {
				e.printStackTrace();
			} 
        	
        }
        
        // list의 전체 개수
        int length = list.size();
        
        // 마지막 인덱스
        int len = 0;
        
        if (pagenum < 0) {
            pagenum = 0;
        }
        
        int pageCount = 10 * pagenum;
        log.info("num = {}", pagenum);
        
        
        if (pageCount + 10 > length) {
            len = length;
        } else {
            len = pageCount + 10;
        }
        
        // 페이지 쪽수를 매기기 위해 설정한 값.
        searchCount = pagenum;
        log.info("count= {}", searchCount);
        
        // 페이지 쪽수 마지막 값을 찾기 위해서
        int listPageMax = (int) ((list.size() / 10) + 1);
        log.info("listPageMax ={}", listPageMax);
        
        model.addAttribute("pageListCount", searchCount);
        model.addAttribute("length", length);
        model.addAttribute("num",pagenum);
        model.addAttribute("maxIndex", len);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("boards", dtos);
        model.addAttribute("listSize", list.size());
        model.addAttribute("listPageMax", listPageMax);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category", category);
    }
    
    @GetMapping("/list")
    public void list(Model model, @RequestParam("num") int num) {
        log.info("list()");
        
        // 전체 Deal list값을 저장하는 객체 생성.
        List<BulletinboardListDto> list = bulletinboardService.selectAll();
        
        // 이미지를 저장하는 리스트 생성
        List<BulletinboardImageListDto> dtos = new ArrayList<>();
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		BulletinboardImageListDto dto = new BulletinboardImageListDto(
        				list.get(i).getBoard_id()
        				, list.get(i).getCategory()
        				, list.get(i).getTitle()
        				, bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage()))
        				, list.get(i).getNickname()
        				, list.get(i).getUser_id()
        				, list.get(i).getTime()
        				, list.get(i).getViews()
        				, list.get(i).getRecommend()
        				, list.get(i).getRcnt()
        				, list.get(i).getContent());
        		
        		dtos.add(dto);
        		
			} catch (Exception e) {
				e.printStackTrace();
			} 
        	
        }
        
        
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
        int listPageMax = (int) ((list.size() / 10) + 1);
        log.info("listPageMax ={}", listPageMax);
        
        model.addAttribute("pageListCount", count);
        model.addAttribute("length", length);
        model.addAttribute("num",num);
        model.addAttribute("maxIndex", len);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("boards", dtos);
        model.addAttribute("listSize", list.size());
        model.addAttribute("listPageMax", listPageMax);
    }
    
    @GetMapping("/detail")
    public void readById(long id, Model model) {
        log.info("readById(id={})", id);
        
        int result = bulletinboardService.viewsUp(id);
        log.info("result = {}", result);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
        String image = "";
        
        try {
			image = bulletinboardService.toTagImage(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
        model.addAttribute("image", image);
        model.addAttribute("board", dto);
    }
    
    @GetMapping("/modify")
    public void readByIdModify(long id, Model model) {
        log.info("readByIdModify(id= {})", id);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
        BulletinboardImageDetailDto imageDto = new BulletinboardImageDetailDto();
		try {
			imageDto = new BulletinboardImageDetailDto(0
					, bulletinboardService.listToTagImage(bulletinboardService.resizeImage(dto.getImage()))
					, dto.getTitle()
					, dto.getNickname()
					, dto.getUser_id()
					, dto.getTime()
					, dto.getViews()
					, dto.getRecommend()
					, dto.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        model.addAttribute("board", imageDto);
    }
    
    @PostMapping("/update")
    public String readByIdUpdate(Bulletinboard board, String file, Model model) {
        log.info("update(deal={})", board);
        
        String path = "C:/workspace/lab-midproject/middlePj/alcohol/src/main/webapp/static/images/";
        log.info("fileName= {}", path + file);
        byte[] image = new byte[1024];
        
        try {
			image = bulletinboardService.imageToByteArray(path + file);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        board.setImage(image);
        
        int result = bulletinboardService.readByIdUpdate(board);
        log.info("result= {}", result);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(board.getBoard_id());
        
        model.addAttribute("deal", dto);
        
        return "redirect:/bulletinboard/board/detail?id=" + dto.getBoard_id();
    }
    
    @PostMapping("/delete")
    public String dealDelete(long board_id) {
        log.info("dealDelete(id= {})", board_id);
        
        int result = bulletinboardService.bulletinboardDelete(board_id);
        log.info("result = {}", result);
        
        return "redirect:/bulletinboard/board/list?num=0";
    }
    
    @GetMapping("/create")
    public void create() {
        log.info("create()");
    }
    
    @PostMapping("/create")
    public String boardCreate(BulletinboardCreateDto dto, String file) {
        log.info("boardCreate(dto= {})", dto);
        
        
        String path = "C:/workspace/lab-midproject/middlePj/alcohol/src/main/webapp/static/images/";
        log.info("fileName= {}", path + file);
        byte[] image = new byte[1024];
        
        try {
			image = bulletinboardService.imageToByteArray(path + file);
		} catch (Exception e) {
			e.printStackTrace();
		}
        dto.setImage(image);
        
        
        int result = bulletinboardService.create(dto);
        log.info("생성 수 = {}", result);
        
        
        
        return "redirect:/bulletinboard/board/list?num=0";
    }
    
    @GetMapping("/announcement")
    public void announcementList(Model model, @RequestParam("num") int num) {
    	log.info("announcementList()");
        
        // 공지사항을 저장하는 리스트 생성
        List<BulletinboardListDto> list = bulletinboardService.selectAnnouncement();
        
        // 이미지를 저장하는 리스트 생성
        List<BulletinboardImageListDto> dtos = new ArrayList<>();
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		BulletinboardImageListDto dto = new BulletinboardImageListDto(
        				list.get(i).getBoard_id()
        				, list.get(i).getCategory()
        				, list.get(i).getTitle()
        				, bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage()))
        				, list.get(i).getNickname()
        				, list.get(i).getUser_id()
        				, list.get(i).getTime()
        				, list.get(i).getViews()
        				, list.get(i).getRecommend()
        				, list.get(i).getRcnt()
        				, list.get(i).getContent());
        		
        		dtos.add(dto);
        		
			} catch (Exception e) {
				e.printStackTrace();
			} 
        	
        }
        
        
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
        int listPageMax = (int) ((list.size() / 10) + 1);
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
    
    @GetMapping("/recommend")
    public void recommendOrderByReommend(Model model, @RequestParam("num") int num) {
    	log.info("announcementList()");
        
        // 공지사항을 저장하는 리스트 생성
        List<BulletinboardListDto> list = bulletinboardService.selectOrderByRecommend();
        
        // 이미지를 저장하는 리스트 생성
        List<BulletinboardImageListDto> dtos = new ArrayList<>();
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		BulletinboardImageListDto dto = new BulletinboardImageListDto(
        				list.get(i).getBoard_id()
        				, list.get(i).getCategory()
        				, list.get(i).getTitle()
        				, bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage()))
        				, list.get(i).getNickname()
        				, list.get(i).getUser_id()
        				, list.get(i).getTime()
        				, list.get(i).getViews()
        				, list.get(i).getRecommend()
        				, list.get(i).getRcnt()
        				, list.get(i).getContent());
        		
        		dtos.add(dto);
        		
			} catch (Exception e) {
				e.printStackTrace();
			} 
        	
        }
        
        
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
        int listPageMax = (int) ((list.size() / 10) + 1);
        log.info("listPageMax ={}", listPageMax);
        
        model.addAttribute("pageListCount", count);
        model.addAttribute("length", length);
        model.addAttribute("num",num);
        model.addAttribute("maxIndex", len);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("boards", dtos);
        model.addAttribute("listSize", list.size());
        model.addAttribute("listPageMax", listPageMax);
    }
    
}
