package com.mid.alcohol.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.domain.Photo;
import com.mid.alcohol.dto.AuctionCreateDto;
import com.mid.alcohol.dto.AuctionReadDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.repository.AuctionProductRepository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;


@Service
@Data
@Slf4j
public class AuctionProductService {

	@Autowired
	private final AuctionProductRepository auctionpdrepository;
	
	
	public int write(AuctionCreateDto dto) {
		
		AuctionProducts product = dto.toEntity();
		
		
		log.info("write={}",product);
		//TODO setUserId 대신 회원가입,로그인 완성되면,
		// 세션 정보 받아서 바로 들어가도록.
		
		return auctionpdrepository.write(product);
		
	}
	
	public List<AuctionReadDto> read(String userId){
		log.info("read(id = {})",userId);
		
		return auctionpdrepository.read(userId).stream().map(AuctionReadDto::FromEntity).toList();
	}

	public AuctionProducts readProduct(int productId) {
		log.info("readProduct(userid={})", productId);
		
		
		
		return auctionpdrepository.readAt(productId);
	}

	public AuctionReadDto read(int productid) {
		
	    AuctionProducts product = auctionpdrepository.readAt(productid);
	    
	    AuctionReadDto dto = AuctionReadDto.FromEntity(product);
	    
		return dto;
	}

	public int delete(int productid) {
		
		int result = auctionpdrepository.deleteByProductId(productid);
		return result;
	}

	public int updateProduct(AuctionReadDto dto) {
		
		int result = auctionpdrepository.updateProduct(dto.toEntity());
		return result;
	}

	public List<AuctionReadDto> readDetail(AuctionReadDto dto) {
		
		log.info("service readDetail(dto={})", dto);
		
		AuctionProducts entity = dto.toEntity();
		log.info("service entity={}", entity);
		entity.toWildcard(entity);
		
		return auctionpdrepository.readDetail(entity);
	}

	
	
	public int uploadPhoto(Photo photo) {
		// TODO Auto-generated method stub
		log.info("uploadPhoto({})",photo);
		
		int result = auctionpdrepository.uploadPhoto(photo);
		
		return result;
	}
	
	public int deleteBeforePhoto(int productid) {
		
		log.info("productid={} photo delete",productid);
		
		return auctionpdrepository.deleteBeforePhoto(productid);
		
	}
	
	public Photo selectPhoto(int productid) {
		log.info("selectPhoto()");
		
		return auctionpdrepository.selectPhoto(productid);
		
		
	}
	
	/// 
	
// 이미지 업로드 관련
    
    //TODO 이미지 불러오기 관련데이터
    // String으로 사진 경로 값을 인코딩하는 메서드
    public String stringToIncoding(String getImage) throws Exception {
    	log.info("stringToIncoding={}", getImage);
    	
		byte[] bytes = getImage.getBytes();
		InputStream inputStream = new ByteArrayInputStream(bytes);
		BufferedImage image = ImageIO.read(inputStream);
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		
		return base64Image;
	}
    
    // 이미지 크기를 조정하는 메서드
    public BufferedImage resizeImage(String image) throws Exception {
    	int maxWidth = 540;
    	int maxHeight = 540;
    	
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
	
	
	
}
