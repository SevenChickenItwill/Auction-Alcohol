package com.mid.alcohol.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shop.ShopProductCreateDto;
import com.mid.alcohol.dto.shop.ShopSearchDto;
import com.mid.alcohol.repository.ShopRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShopService {

	@Autowired
	private ShopRepository shoprepository;
	
	public List<Products> searchlist(ShopSearchDto dto) {
		
		List<Products> list = shoprepository.searchlist(dto);
		
		try {
			list = photomake(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Products> photomake(List<Products> list) throws Exception {
		
		for(Products x : list) {
			
			String photopath = listToTagImage(resizeImage(x.getPhotopath()));
			x.setPhotopath(photopath);
			
		}
		
		return list;
		
	}
	
	public List<Products> productall(){
		
		List<Products> list = shoprepository.productall();
		log.info("productall()");
		// 사진 크기 변환 및 경로 변경해서 쏴줄 메서드 호출
		
		try {
			list = photomake(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
    public BufferedImage resizeImage(String image) throws Exception {
    	int maxWidth = 180;
    	int maxHeight = 120;
    	
    	log.info("image = {}", image);
    	
    	Path path = Paths.get(image);
    	File imageFile = path.toFile();
        BufferedImage originalImage = ImageIO.read(imageFile);

        // 이미지 크기 조정
        int originalWidth = originalImage.getWidth();
        int originalHeight = originalImage.getHeight();
        double ratio = 1.0;
        
        if (originalWidth > maxWidth) {
            ratio = (double) maxWidth / originalWidth;
        }
        
        if (originalHeight * ratio > maxHeight) {
            ratio = (double) maxHeight / originalHeight;
        }
        
        int newWidth = (int) (originalWidth * ratio);
        int newHeight = (int) (originalHeight * ratio);
        Image resizedImage = originalImage.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);

        // 이미지를 BufferedImage로 변환
        BufferedImage resizedBufferedImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = resizedBufferedImage.createGraphics(); // Graphics2D: java의 2D 그래픽 설정을 하기 위한 클래스
        graphics.drawImage(resizedImage, 0, 0, null);
        graphics.dispose();

        return resizedBufferedImage;
    }
    
    public String listToTagImage(BufferedImage bufImage) throws Exception {
    	log.info("listToTagImage(bufImage={})",bufImage);
		
		BufferedImage image = bufImage;	
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		
		return base64Image;
	}

	public int createPd(ShopProductCreateDto dto) {
		// TODO Auto-generated method stub
		Products products = dto.toEntity();
		
		return shoprepository.createpd(products);
	}
	
	
}
