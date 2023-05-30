package alcohol;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.mid.alcohol.repository.PaymentRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/application-context.xml"}
)

public class RepositoryTest {
	@Autowired
	private PaymentRepository paymentRepository;
	
	 @Test
	 public void testDelete() {
	     int result = paymentRepository.deletePaymentById(1);
	     Assertions.assertEquals(1, result);
	 }
	

}
