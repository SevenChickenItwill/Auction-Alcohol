package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.board.BulletinboardListDto;
import com.mid.alcohol.dto.shopuser.ShopCategoryDto;
import com.mid.alcohol.dto.shopuser.ShopUserReadDto;
import com.mid.alcohol.dto.shopuser.ShopUserSearchDto;
import com.mid.alcohol.service.ShopService;
import com.mid.alcohol.service.ShopUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopUserController {

	@Autowired
	private ShopUserService shopUserService;
	@Autowired
	private ShopService shopservice;

	private int count = 0;
	private int searchCount = 0;

	@GetMapping("/shopmain")
	public void shopUserRead(Model model, @RequestParam("num") int num) {
		log.info("shopUserRead()");

		List<ShopUserReadDto> list = shopUserService.read();
		
		String photoPath = "";
		for (int i = 0; i < list.size(); i++) {
			try {
				photoPath = shopservice.listToTagImage(shopservice.resizeImage(list.get(i).getPhotopath()));
				list.get(i).setPhotopath(photoPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("products", list);

		// list의 전체 개수
		int length = list.size();

		// 마지막 인덱스
		int len = 0;

		if (num < 0) {
			num = 0;
		}

		int pageCount = 25 * num;
		log.info("num = {}", num);

		if (pageCount + 25 > length) {
			len = length;
		} else {
			len = pageCount + 25;
		}

		// 페이지 쪽수를 매기기 위해 설정한 값.
		count = num;
		log.info("count= {}", count);

		// 페이지 쪽수 마지막 값을 찾기 위해서
		int listPageMax = (int) ((list.size() / 25) + 1);
		log.info("listPageMax ={}", listPageMax);

		model.addAttribute("pageListCount", count);
		model.addAttribute("length", length);
		model.addAttribute("num", num);
		model.addAttribute("maxIndex", len);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listSize", list.size());
		model.addAttribute("listPageMax", listPageMax);

	}

	@PostMapping("/shopmain")
	public void shopCategory(Model model, ShopCategoryDto dto,  @RequestParam("num") int num) {
		log.info("shopCategory(dto= {})", dto);
		
		List<Products> list = shopUserService.category(dto.getCategory());
		
		log.info("list= {}", list);
		
		String photoPath = "";
		for (int i = 0; i < list.size(); i++) {
			try {
				photoPath = shopservice.listToTagImage(shopservice.resizeImage(list.get(i).getPhotopath()));
				list.get(i).setPhotopath(photoPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("products", list);
		
		// list의 전체 개수
		int length = list.size();

		// 마지막 인덱스
		int len = 0;

		if (num < 0) {
			num = 0;
		}

		int pageCount = 25 * num;
		log.info("num = {}", num);

		if (pageCount + 25 > length) {
			len = length;
		} else {
			len = pageCount + 25;
		}

		// 페이지 쪽수를 매기기 위해 설정한 값.
		count = num;
		log.info("count= {}", count);

		// 페이지 쪽수 마지막 값을 찾기 위해서
		int listPageMax = (int) ((list.size() / 25) + 1);
		log.info("listPageMax ={}", listPageMax);

		model.addAttribute("pageListCount", count);
		model.addAttribute("length", length);
		model.addAttribute("num", num);
		model.addAttribute("maxIndex", len);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listSize", list.size());
		model.addAttribute("listPageMax", listPageMax);

	}

	@GetMapping("/shopsearch")
	public void search(Model model, @RequestParam("category") String category,
			@RequestParam("keyword") String keyword, @RequestParam("page") int pagenum) {
		log.info("search(category= {}, keyword= {})", category, keyword);

		List<ShopUserReadDto> list = shopUserService.search(category, keyword);
		
		
		
		String photoPath = "";
		for (int i = 0; i < list.size(); i++) {
			try {
				photoPath = shopservice.listToTagImage(shopservice.resizeImage(list.get(i).getPhotopath()));
				list.get(i).setPhotopath(photoPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("search", list);
		
		// list의 전체 개수
		int length = list.size();

		// 마지막 인덱스
		int len = 0;

		if (pagenum < 0) {
			pagenum = 0;
		}

		int pageCount = 25 * pagenum;
		log.info("num = {}", pagenum);

		if (pageCount + 25 > length) {
			len = length;
		} else {
			len = pageCount + 25;
		}

		// 페이지 쪽수를 매기기 위해 설정한 값.
		searchCount = pagenum;
		log.info("count= {}", searchCount);

		// 페이지 쪽수 마지막 값을 찾기 위해서
		int listPageMax = (int) ((list.size() / 25	) + 1);
		log.info("listPageMax ={}", listPageMax);

		model.addAttribute("pageListCount", searchCount);
		model.addAttribute("length", length);
		model.addAttribute("num", pagenum);
		model.addAttribute("maxIndex", len);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listSize", list.size());
		model.addAttribute("listPageMax", listPageMax);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
	}

	@GetMapping("/shopdetail")
	public void shopdetail() {
		log.info("shopDetailPage()");
	}
}
