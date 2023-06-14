package com.mid.alcohol.web;

import java.awt.Image;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.mid.alcohol.dto.BulletinboardUpdateDto;
import com.mid.alcohol.service.BulletinboardService;
import com.mid.alcohol.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bulletinboard/board")
@Controller
public class BulletinboardController {
<<<<<<< HEAD

	private final BulletinboardService bulletinboardService;
	private final CommentService commentService;

	private int count = 0;
	private int searchCount = 0;

	@GetMapping("/search")
	public void searchList(Model model, @RequestParam("category") String category,
			@RequestParam("keyword") String keyword, @RequestParam("pagenum2") int pagenum) {
		log.info("searchList(category= {}, keyword= {}, pagenum= {})", category, keyword, pagenum);

		// 검색한 Deal list값을 저장하는 객체 생성.
		List<BulletinboardListDto> list = bulletinboardService.search(category, keyword);

		// 이미지 크기 조정후 이미지를 view에 보내주기
		for (int i = 0; i < list.size(); i++) {

			try {

				list.get(i).setImage(
						bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));

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
		model.addAttribute("num", pagenum);
		model.addAttribute("maxIndex", len);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("boards", list);
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
		log.info("list = {}", list);

		// 이미지 크기 조정후 이미지를 view에 보내주기
		for (int i = 0; i < list.size(); i++) {

			try {

				list.get(i).setImage(
						bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));

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
		model.addAttribute("num", num);
		model.addAttribute("maxIndex", len);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("boards", list);
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
=======
    
    private final BulletinboardService bulletinboardService;
    private final CommentService commentService;
    
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
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		list.get(i).setImage(bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));
        		
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
        model.addAttribute("boards", list);
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
        log.info("list = {}", list);
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		list.get(i).setImage(bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));
        		
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
    
    @GetMapping("/detail")
    public void readById(long id, Model model) {
        log.info("readById(id={})", id);
        
        int result = bulletinboardService.viewsUp(id);
        log.info("result = {}", result);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
        String image = "";
        
        try {
>>>>>>> origin/Taewook5
			image = bulletinboardService.listToTagImage(bulletinboardService.resizeImage(dto.getImage()));
		} catch (Exception e) {
			e.printStackTrace();
		}
<<<<<<< HEAD

		model.addAttribute("image", image);
		model.addAttribute("board", dto);
	}

	@GetMapping("/modify")
	public void readByIdModify(long id, Model model) {
		log.info("readByIdModify(id= {})", id);

		BulletinboardDetailDto dto = bulletinboardService.selectById(id);
		log.info("dto= {}", dto);

		try {

			dto.setImage(bulletinboardService.listToTagImage(bulletinboardService.resizeImage(dto.getImage())));

=======
        
        
        model.addAttribute("image", image);
        model.addAttribute("board", dto);
    }
    
    @GetMapping("/modify")
    public void readByIdModify(long id, Model model) {
        log.info("readByIdModify(id= {})", id);
        
        BulletinboardDetailDto dto = bulletinboardService.selectById(id);
        log.info("dto= {}", dto);
        
		try {
			
			dto.setImage(bulletinboardService.listToTagImage(bulletinboardService.resizeImage(dto.getImage())));
			
>>>>>>> origin/Taewook5
		} catch (Exception e) {
			e.printStackTrace();
		}
		
<<<<<<< HEAD
		
		model.addAttribute("board", dto);
	}

//    @PostMapping("/update")
//    public String readByIdUpdate(BulletinboardUpdateDto dto, String file, Model model) {
//        log.info("update(dto={})", dto);
=======
        model.addAttribute("board", dto);
    }
    
    @PostMapping("/update")
    public String readByIdUpdate(BulletinboardUpdateDto dto, String file, Model model) {
        log.info("update(dto={})", dto);
        
        String path = "C:/workspace4/middlePj/alcohol/src/main/webapp/static/images/";
        log.info("fileName= {}", path + file);
        
        try {
        	dto.setImage(path + file);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        int result = bulletinboardService.readByIdUpdate(dto);
        log.info("result= {}", result);
        
        BulletinboardDetailDto Detaildto = bulletinboardService.selectById(dto.getBoard_id());
        
        model.addAttribute("deal", Detaildto);
        
        return "redirect:/bulletinboard/board/detail?id=" + Detaildto.getBoard_id();
    }
    
    @PostMapping("/delete")
    public String dealDelete(long board_id) {
        log.info("dealDelete(id= {})", board_id);
        
        int result = bulletinboardService.bulletinboardDelete(board_id);
        log.info("result = {}", result);
        
        int commentResult = commentService.deleteCommentByBoardId(board_id);
        
        return "redirect:/bulletinboard/board/list?num=0";
    }
    
    @GetMapping("/create")
    public void create() {
        log.info("create()");
    }
    
    @PostMapping("/create")
    public String boardCreate(BulletinboardCreateDto dto, String file) {
        log.info("boardCreate()");
        
        
        String path = "C:/workspace4/middlePj/alcohol/src/main/webapp/static/images/";
        log.info("fileName= {}", path + file);
        
        try {
        	dto.setImage(path + file);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        int result = bulletinboardService.create(dto);
        log.info("생성 수 = {}", result);
        
        
        
        return "redirect:/bulletinboard/board/list?num=0";
    }
    
//    @PostMapping("")
//    public String boardCreate(
//    		MultipartFile file,
//    		@RequestParam("category") String category,
//    		@RequestParam("nickname")  String nickname,
//    		@RequestParam("userId")  String user_id,
//    		@RequestParam("title")  String title,
//    		@RequestParam("content") String content
//    ) {
//    	
//        log.info("boardCreate()");
>>>>>>> origin/Taewook5
//        
//        String path = "C:/workspace/lab-midproject/middlePj/alcohol/src/main/webapp/static/images/";
//        log.info("fileName= {}", path + file);
//        
//        try {
//        	dto.setImage(path + file);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//        
//        int result = bulletinboardService.readByIdUpdate(dto);
//        log.info("result= {}", result);
//        
//        BulletinboardDetailDto Detaildto = bulletinboardService.selectById(dto.getBoard_id());
//        
//        model.addAttribute("deal", Detaildto);
//        
//        return "redirect:/bulletinboard/board/detail?id=" + Detaildto.getBoard_id();
//    }
<<<<<<< HEAD

	@PostMapping("/delete")
	public String dealDelete(long board_id) {
		log.info("dealDelete(id= {})", board_id);

		int commentResult = commentService.deleteCommentByBoardId(board_id);
		log.info("댓글 삭제 완료");

		int recommendUpResult = bulletinboardService.recommendUpDelete(board_id);
		log.info("추천업 삭제 완료");

		int recommendDownResult = bulletinboardService.recommendDownDelete(board_id);
		log.info("추천다운 삭제 완료");

		int result = bulletinboardService.bulletinboardDelete(board_id);
		log.info("result = {}", result);

		return "redirect:/bulletinboard/board/list?num=0";
	}

	@GetMapping("/create")
	public void create() {
		log.info("create()");
	}

	@GetMapping("/announcement")
	public void announcementList(Model model, @RequestParam("num") int num) {
		log.info("announcementList()");

		// 공지사항을 저장하는 리스트 생성
		List<BulletinboardListDto> list = bulletinboardService.selectAnnouncement();

		// 이미지 크기 조정후 이미지를 view에 보내주기
		for (int i = 0; i < list.size(); i++) {

			try {
				list.get(i).setImage(
						bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));
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
		model.addAttribute("num", num);
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

		// 이미지 크기 조정후 이미지를 view에 보내주기
		for (int i = 0; i < list.size(); i++) {

			try {

				list.get(i).setImage(
						bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));

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
		model.addAttribute("num", num);
		model.addAttribute("maxIndex", len);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("boards", list);
		model.addAttribute("listSize", list.size());
		model.addAttribute("listPageMax", listPageMax);
	}

	private static String path = "C:\\workspace\\lab-midproject\\middlePj\\alcohol\\src\\main\\webapp\\static\\images\\";

	@PostMapping("/create/{boardId}")
	public String boardCreate(@PathVariable("boardId") long boardId, @RequestBody MultipartFile file) {
		log.info("RESTCOTROLLER: boardCreate()");

		UUID uid = UUID.randomUUID();
		String name = uid + file.getOriginalFilename();
		String photopath = path + name;
		log.info(photopath);
		try {
			File files = new File(photopath);
			file.transferTo(files);

			log.info("file upload complete");

		} catch (Exception e) {
			e.printStackTrace();
		}

		int result = bulletinboardService.imageUpdate(boardId, photopath);

		return "redirect:/bulletinboard/board/list?num=0";
	}

	@PostMapping("/update/{boardId}")
	public String readByIdUpdate(@PathVariable("boardId") long boardId, @RequestBody MultipartFile file) {
		log.info("RESTCOTROLLER: readByIdUpdate(file= {})", file);

		if (!file.isEmpty()) {
			UUID uid = UUID.randomUUID();
			String name = uid + file.getOriginalFilename();
			String photopath = path + name;
			log.info(photopath);
			try {
				File files = new File(photopath);
				file.transferTo(files);

				log.info("file upload complete");

			} catch (Exception e) {
				e.printStackTrace();
			}

			int result = bulletinboardService.imageUpdate(boardId, photopath);
		}
		return "redirect:/bulletinboard/board/detail?id=" + boardId;
	}
	
	@GetMapping("/home")
    public void homePage() {
       
    }

=======
    
    @GetMapping("/announcement")
    public void announcementList(Model model, @RequestParam("num") int num) {
    	log.info("announcementList()");
        
        // 공지사항을 저장하는 리스트 생성
        List<BulletinboardListDto> list = bulletinboardService.selectAnnouncement();
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		list.get(i).setImage(bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));
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
        
        
        // 이미지 크기 조정후 이미지를 view에 보내주기
        for (int i = 0; i < list.size(); i++) {
        	
        	try {
        		
        		list.get(i).setImage(bulletinboardService.listToTagImage(bulletinboardService.resizeImage(list.get(i).getImage())));
        		
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
    
    @GetMapping("/home")
    public void homePage() {
    	
    }
    
>>>>>>> origin/Taewook5
}