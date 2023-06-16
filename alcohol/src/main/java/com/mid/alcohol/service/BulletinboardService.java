package com.mid.alcohol.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.board.Bulletinboard;
import com.mid.alcohol.domain.board.RecommendDown;
import com.mid.alcohol.domain.board.RecommendUp;
import com.mid.alcohol.dto.board.BulletinboardCreateDto;
import com.mid.alcohol.dto.board.BulletinboardDetailDto;
import com.mid.alcohol.dto.board.BulletinboardImageUpdateDto;
import com.mid.alcohol.dto.board.BulletinboardKeywordDto;
import com.mid.alcohol.dto.board.BulletinboardHistoryDto;
import com.mid.alcohol.dto.board.BulletinboardListDto;
import com.mid.alcohol.dto.board.BulletinboardUpdateDto;
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
        
//        List<BulletinboardListDto> listImage = bulletinboardRepository.selectImageOrderByIdDesc();
        List<BulletinboardListDto> list = bulletinboardRepository.selectOrderByIdDesc();
        
//        for (int i = 0; i < list.size(); i++) {
//        	list.get(i).setImage(listImage.get(i).getImage());
//        }
//        
        return list;
    }

    public BulletinboardDetailDto selectById(long id) {
        log.info("selectById(id={})", id);
        
        return bulletinboardRepository.selectById(id);
    }

    public int readByIdUpdate(BulletinboardUpdateDto dto) {
        log.info("readByIdUpdate()");
        
        return bulletinboardRepository.bulletinboardUpdateById(dto);
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
        	
        	 List<BulletinboardListDto> list = bulletinboardRepository.selectWhereTitle(keyword);
//             List<BulletinboardListDto> list = bulletinboardRepository.selectImageWhereTitle(keyword);
//             
//             for (int i = 0; i < list.size(); i++) {
//             	list.get(i).setImage(listImage.get(i).getImage());
//             }
             
             return list;
        } else if (category.equals("c")) {
        	
        	List<BulletinboardListDto> list = bulletinboardRepository.selectWhereContent(keyword);
//            List<BulletinboardListDto> list = bulletinboardRepository.selectImageWhereContent(keyword);
//            
//            for (int i = 0; i < list.size(); i++) {
//            	list.get(i).setImage(listImage.get(i).getImage());
//            }
            
            return list;
        } else if (category.equals("tc")) {
            String keywordT = keyword;
            String keywordC = keywordT;
            
            BulletinboardKeywordDto dto = new BulletinboardKeywordDto(keywordT, keywordC);
            
            List<BulletinboardListDto> list = bulletinboardRepository.selectWhereTitleAndContent(dto);
//            List<BulletinboardListDto> list = bulletinboardRepository.selectImageWhereTitleAndContent(keywordT, keywordC);
//            
//            for (int i = 0; i < list.size(); i++) {
//            	list.get(i).setImage(listImage.get(i).getImage());
//            }
            
            return list;
        } else if (category.equals("n")) {
        	
        	List<BulletinboardListDto> list = bulletinboardRepository.selectWhereNickname(keyword);
//            List<BulletinboardListDto> list = bulletinboardRepository.selectImageWhereNickname(keyword);
//            
//            for (int i = 0; i < list.size(); i++) {
//            	list.get(i).setImage(listImage.get(i).getImage());
//            }
            
            return list;
        } else if (category.equals("i")) {
        	
        	List<BulletinboardListDto> list = bulletinboardRepository.selectWhereUserId(keyword);
//            List<BulletinboardListDto> list = bulletinboardRepository.selectImageWhereUserId(keyword);
//            
//            for (int i = 0; i < list.size(); i++) {
//            	list.get(i).setImage(listImage.get(i).getImage());
//            }
            
            return list;
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
    public String toTagImage(long id) throws Exception {
    	log.info("toTagImage(id= {}) ", id);
    	
		BulletinboardDetailDto board = selectById(id);
		
		String boardImages = board.getImage();
		byte[] bytes = boardImages.getBytes();
		InputStream inputStream = new ByteArrayInputStream(bytes);
		BufferedImage image = ImageIO.read(inputStream);
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		
		return base64Image;
	}
    
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
    public BufferedImage resizeImage(String image) throws IOException {
    	int maxWidth = 540;
    	int maxHeight = 540;
    	
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
    	log.info("listToTagImage()");
		
		BufferedImage image = bufImage;
		
		// 이미지를 Base64로 인코딩
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", outputStream);
		String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());
		
		
		return base64Image;
	}
    
    // 추천 관련 service

	public int recommendUp(long boardId) {
		log.info("recommentUp(id= {})", boardId);
		
		int result = bulletinboardRepository.recommendUp(boardId);
		
		return result;
	}

	public int recommendDo(long boardId) {
		log.info("recommendDo(id= {})", boardId);
		
		int result = bulletinboardRepository.recommendDo(boardId);
		
		return result;
	}
    
	// 추천 시 중복검사를 위해 COMMENDUP 테이블에 객체 생성
    public int recommendUpInsert(RecommendUp recommend) {
    	log.info("recommendListInsert(recommend= {})", recommend);
    	
    	int result = bulletinboardRepository.recommendupInsert(recommend);
    	
    	return result;
    }
    
    // 비추천 시 중복검사를 위해 COMMENDDOWN 테이블에 객체 생성.
    public int recommendDownInsert(RecommendDown recommend) {
    	log.info("recommendDelete(recommend= {})", recommend);
    	
    	int result = bulletinboardRepository.recommenddownInsert(recommend);
    	
    	return result;
    }
    
    // 추천시 중복검사하기
    public int recommendUpSelect(RecommendUp recommend) {
    	log.info("recommendUpSelect(RecommendUp= {})", recommend);
    	
    	RecommendUp commend = bulletinboardRepository.recommendUpSelect(recommend);
    	log.info("RECOMMEDUPSELECT commend= {}", commend);
    	
    	if (commend != null) {
    		return 1;
    	} else {
    		return 0;
    	}
    	
    	
    }
    
    // 추천다운시 중복검사하기
    public int recommendDownSelect(RecommendDown recommend) {
    	log.info("recommendDownSelect(recommend= {})", recommend);
    	
    	RecommendDown down = bulletinboardRepository.recommendDownSelect(recommend);
    	
    	if (down != null) {
    		return 0;
    	} else {
    		return 1;
    	}
    }
    
    // 게시글 삭제시 commendUp 테이블 행 삭제
    public int recommendUpDelete(long boardId) {
    	log.info("recommendUpDelete(baordId= {})", boardId);
    	
    	int result = bulletinboardRepository.recommendUpDelete(boardId);
    	
    	return result;
    }
    
    // 게시글 삭제시 commendDown 테이블 행 삭제
    public int recommendDownDelete(long boardId) {
    	log.info("recommendDownDelete(boardId= {})", boardId);
    	
    	int result = bulletinboardRepository.recommendDownDelete(boardId);
    	
		return result;
	}
	
	// 조회수 증가하는 service
	public int viewsUp(long boardId) {
		log.info("viewsUp(boardId= {})", boardId);
		
		int result = bulletinboardRepository.viewsUp(boardId);
		
		return result;
	}
	
	// 공지사항만 보는 메서드
	public List<BulletinboardListDto> selectAnnouncement() {
		log.info("selectAnnouncement()");
		
		List<Bulletinboard> list = bulletinboardRepository.selectAnnouncement();
		
		return list.stream().map(BulletinboardListDto::fromEntity).toList();
	}
	
	// 추천순으로 보는 메서드
	public List<BulletinboardListDto> selectOrderByRecommend() {
		log.info("selectOrderByRecommend()");
		
		List<Bulletinboard> list = bulletinboardRepository.selectOrderByRecommend();
		
		return list.stream().map(BulletinboardListDto::fromEntity).toList();
	}
	
	// 닉네임으로 게시글 찾기
	public Bulletinboard selectNicknameOrderByboardId(String nickname) {
		log.info("selectNicknameOrderByboardId()");
		
		List<Bulletinboard> board = bulletinboardRepository.selectNicknameOrderByboardId(nickname);
		log.info("닉네임으로 찾는거 들어왔다. -> {}", board.get(0));
		
		return board.get(0);
	}

	public List<BulletinboardHistoryDto> historyReadByBoardId(String nickname) {
		log.info("historyReadByBoardId()");
		
		// entity를 초기화해주는 작업. BulletinBoard 타입으로 엔티티를 만들어주기 때문에 모델명을 따라서 아규먼트 값 설정
		List<Bulletinboard> entity = bulletinboardRepository.readHistoryByNickname(nickname);
		// dto를 entity(db타입으로 변환)
		
		
		return entity.stream().map(BulletinboardHistoryDto::fromEntity).toList();
	}
	
	// create에서 이미지 저장하는 메서드
	public int imageUpdate(long boardId, String image) {
		log.info("imageUpdate(boardId= {}, image= {})", boardId, image);
		
		BulletinboardImageUpdateDto dto = new BulletinboardImageUpdateDto(boardId, image);
		
		int result = bulletinboardRepository.imageUpdate(dto);
		
		return result;
	}

}
