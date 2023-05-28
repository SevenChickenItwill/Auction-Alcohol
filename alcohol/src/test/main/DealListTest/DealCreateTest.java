package DealListTest;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.mid.alcohol.domain.Deal;
import com.mid.alcohol.dto.DealCreateDto;
import com.mid.alcohol.repository.DealRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
        locations = { "file:src/main/webapp/WEB-INF/application-context.xml" })
public class DealCreateTest {
    
    @Autowired
    private DealRepository dealRepository;
    
    @Test
    public void createTest() {
        
        
        for (int i = 0; i < 1000; i++) {
            DealCreateDto deal = new DealCreateDto("test" + i, "test" + i, "test" + 1, "test" + i, i);
            
            
            int result = dealRepository.dealInsert(deal);
            log.info("추가 deal= {}, rseult= {}", deal, result);
        }
        
        log.info("완료");
        
    }
    
}
