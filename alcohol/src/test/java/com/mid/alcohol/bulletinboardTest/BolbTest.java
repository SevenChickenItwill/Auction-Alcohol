package com.mid.alcohol.bulletinboardTest;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Base64;
import java.util.HashMap;

import javax.imageio.ImageIO;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.service.BulletinboardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/application-context.xml"}
        )
public class BolbTest {
	
	@Autowired
	private BulletinboardService bulletinboardServie;
	
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
	
	//@Test
	public void toTagImage() throws IOException {
		
		BulletinboardDetailDto board = bulletinboardServie.selectById(1010);
		
		byte[] bytes = board.getImage();
		
		InputStream inputStream = new ByteArrayInputStream(bytes);
		BufferedImage image = ImageIO.read(inputStream);
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		log.info("base64Image ={}", base64Image);
	}
	
	@Test
	public void createTest() throws Exception {
		log.info("createTest()");
		
		for (int i = 0; i < 50; i++) {
			
			String image = "C:/workspace/lab-midproject/middlePj/alcohol/src/main/webapp/static/images/ioio.jpg";
			
			BulletinboardCreateDto dto = new BulletinboardCreateDto(0, "화성가야지", "test" + i, "test" + i, image, "test" + i);
			
			int result = bulletinboardServie.create(dto);
			
			log.info("dto= {}", dto);
			
		}
		
		log.info("성공");
		
	}
	
	
}
