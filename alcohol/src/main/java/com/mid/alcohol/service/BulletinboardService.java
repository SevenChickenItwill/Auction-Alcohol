package com.mid.alcohol.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.repository.BulletinboardRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BulletinboardService {
    
    private final BulletinboardRepository bulletinboardRepository;

    public List<BulletinboardListDto> selectAll() {
        log.info("selectAll");
        
        List<Bulletinboard> list = bulletinboardRepository.selectAllOrderByIdDesc();
        
        return list.stream().map(BulletinboardListDto::fromEntity).toList();
    }

    public BulletinboardDetailDto selectById(long id) {
        log.info("selectById(id={})", id);
        
        return bulletinboardRepository.selectById(id);
    }

    public int readByIdUpdate(Bulletinboard bulletnboard) {
        log.info("readByIdUpdate()");
        
        return bulletinboardRepository.bulletinboardUpdateById(bulletnboard);
    }

    public int bulletinboardDelete(long board_id) {
        log.info("dealDelete(id= {})", board_id);
        
        return bulletinboardRepository.bulletinboardDeleteById(board_id);
    }

    public int create(BulletinboardCreateDto dto) {
        log.info("creat(dto= {})", dto);
        
        
        return bulletinboardRepository.bulletinboardInsert(dto);
    }

    public List<BulletinboardListDto> search(String category, String keyword) {
        log.info("searech(category= {}, keyword= {})", category, keyword);
        
        if (category.equals("t")) {
            return bulletinboardRepository.selectWhereTitle(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("c")) {
            return bulletinboardRepository.selectWhereContent(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("tc")) {
            String keywordT = keyword;
            String keywordC = keywordT;
            return bulletinboardRepository.selectWhereTitleAndContent(keywordT, keywordC).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("n")) {
            return bulletinboardRepository.selectWhereNickname(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("i")) {
            return bulletinboardRepository.selectWhereUserId(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        }
        
        return null;
    }
    
    
    // 이미지 업로드 관련
    
    // 이미지를 byte[]로 변환시키고 변환 시킨 byte[]을 DB에 BLOB로 변환시켜 저장시켜 주는 메서드.
    public byte[] imageToByteArray (String filePath) throws Exception {
		
		byte[] returnValue = null;
		
		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;
		
		try {
			baos = new ByteArrayOutputStream();
			fis = new FileInputStream(filePath);
			
			byte[] buf = new byte[1024];
			int read = 0;
			
			while ((read = fis.read(buf, 0, buf.length)) != -1) {
				baos.write(buf, 0, read);
			}
			
			returnValue = baos.toByteArray();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			
			if (baos != null) {
				baos.close();
			} 
			
			if (fis != null) {
				fis.close();
			}
		}
		
		return returnValue;
	}
    
    // DB에서 이미지 Base64로 인코딩 후 값 리턴하는 메서드.
    public String toTagImage(long id) throws IOException {
    	log.info("toTagImage(id= {}) ", id);
    	
		BulletinboardDetailDto board = selectById(id);
		
		byte[] bytes = board.getImage();
		
		InputStream inputStream = new ByteArrayInputStream(bytes);
		BufferedImage image = ImageIO.read(inputStream);
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		
		return base64Image;
	}
    
    // 이미지 크기를 조정하는 메서드
    public BufferedImage resizeImage(byte[] image) throws IOException {
    	int maxWidth = 540;
    	int maxHeight = 540;
    	
    	// 바이트 배열을 이미지로 변환
        ByteArrayInputStream bais = new ByteArrayInputStream(image);
        BufferedImage originalImage = ImageIO.read(bais);
        bais.close();

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
    
    public String listToTagImage(BufferedImage bufImage) throws IOException {
    	log.info("listToTagImage()");
		
		BufferedImage image = bufImage;
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		
		return base64Image;
	}
    
    
}
