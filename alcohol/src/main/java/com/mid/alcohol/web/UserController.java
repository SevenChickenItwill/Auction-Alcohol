package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.dto.user.UserAddressUpdateDto;
import com.mid.alcohol.dto.user.UserDetaillDto;
import com.mid.alcohol.dto.user.UserSignupDto;
import com.mid.alcohol.dto.user.UserPasswordUpdateDto;
import com.mid.alcohol.dto.user.UserPhoneUpdateDto;
import com.mid.alcohol.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/signup")
@Controller
public class UserController {

	private final UserService userService;

	// 이메일 페이지로 이동하기 위해
	@GetMapping("/signupEmail")
	public void signupEmail() {
		log.info("signupEmail()");
	}

	// 이메일 페이지에서 받은 이메일 정보를 보내기위해
	@PostMapping("/signupEmail")
	public String signupEmail(UserSignupDto dto, @RequestParam("userEmail") String userEmail, Model model) {
		log.info("signupEmail()", dto);
		log.info("email={}", userEmail);

		model.addAttribute("userEmail", userEmail);

		return "/signup/signup";
	}

	@PostMapping("/")

	// 회원가입 페이지로 이동
	@GetMapping("/signup")
	public void signup() {
		log.info("signup()");
	}

	// 회원가입 처리
	@PostMapping("/signup")
	public String signup(UserSignupDto dto, @RequestParam("userEmail") String userEmail,
			@RequestParam("userAddress") String userAddress,
			@RequestParam("userDetailAddress") String userDetailAddress,
			@RequestParam("userAddressNotes") String userAddressNotes) {
		log.info("signup({})", dto);

		// 주소 정보를 합치기
		String combinedAddress = userAddress + " " + userDetailAddress + " " + userAddressNotes;

		dto.setUserEmail(userEmail);
		dto.setUserAddress(combinedAddress);

		int result = userService.signup(dto);
		log.info("회원가입 결과 = {}", result);

		// 회원가입 완료 페이지로 넘겨줌
		return "/signup/signupCompletion";
	}

	// 회원가입 완료 페이지로 이동
	@GetMapping("/signupCompletion")
	public void signupCompletion() {
		log.info("signupCompletion()");
	}

	// 메인 페이지 이동
	@GetMapping("/main")
	public void main() {
		log.info("main()");
	}

	// =============================여기서부터 수정컨트롤러===================================================================//

	// 계정 페이지 이동
	@GetMapping("/userModify")
	public void userModify(HttpSession session, Model model) {
		String userEmail = (String) session.getAttribute("userEmail"); // 케스팅: 오브젝트 타입의 이메일을 문자열 타입으로 바꾼다((String))

		log.info("userModify(userEmail={})", userEmail);

		UserDetaillDto dto = userService.read(userEmail);

		model.addAttribute("dto", dto);
	}

	// 로그인된 메인 페이지에서 계정을 눌렀을 때 보여줄 계정 정보
	@PostMapping("/userModify")
	public void userModify() {

	}

	// 비밀번호 수정 페이지로 이동하기 위해
	@GetMapping("/userPasswordModify")
	public void userPasswordModify() {

	}

	// 비밀번호 수정
	@PostMapping("/userPasswordModify")
	public String userPasswordModify(UserPasswordUpdateDto dto) {
		log.info("userPasswordModify");

		int result = userService.PasswordUpdate(dto);
		log.info("업데이트 결과={}", result);

		return "/signup/userModify"; // 수정 후 사용자 수정 페이지로 이동
	}

	// 전화번호를 수정
	@PostMapping("/userPhoneModify")
	public String userPhoneModify(UserPhoneUpdateDto dto) {
		log.info("userPhoneModify(dto={})", dto);
		int result = userService.PhoneUpdate(dto);
		log.info("업데이트 결과={}", result);

		return "redirect:/signup/userModify"; // 수정 후 사용자 수정 페이지로 리다이렉트

	}

	// 전화번호 수정
	@GetMapping("/userPhoneModify")
	public void userPhoneModify() {

	}

	// 주소 수정
	@PostMapping("/userAddressModify")
	public String userAddressModify(UserAddressUpdateDto dto, @RequestParam("userAddress") String userAddress,
			@RequestParam("userDetailAddress") String userDetailAddress,
			@RequestParam("userAddressNotes") String userAddressNotes) {
		log.info("userAddress(dto={})", dto);

		String combinedAddress = userAddress + " " + userDetailAddress + " " + userAddressNotes;
		dto.setUserAddress(combinedAddress);

		int result = userService.AddressUpdate(dto);
		log.info("업데이트 결과={}", result);

		return "redirect:/signup/userModify";
	}

	// 주소 수정
	@GetMapping("/userAddressModify")
	public void userAddressModifyy() {

	}

	// 계정 비활성화 페이지
	@PostMapping("/deactivationAccount")
	public String DeactivationAccount(String userEmail) {

		log.info("userPhoneModify(userEmail={})", userEmail);
		int result = userService.DeactivationAccount(userEmail);
		log.info("업데이트 결과={}", result);

		return "redirect:/signup/deactivationCompletion"; // 수정 후 사용자 수정 페이지로 리다이렉트

	}

	// 계정 비활성화 페이지
	@GetMapping("/deactivationAccount")
	public void DeactivationAccount() {

	}

	// 비활성화 완료 페이지
	@GetMapping("/deactivationCompletion")
	public void deleteCompletion() {

	}

	// 계정 활성화 페이지
	@PostMapping("/activationAccount")
	public String activationAccount(UserPasswordUpdateDto dto, @RequestParam("userEmail") String userEmail) {

		log.info("email={}", userEmail);
		dto.setUserEmail(userEmail);
		int result = userService.ActivationAccount(userEmail);
		log.info("업데이트 결과", result);

		return "/signup/activationCompletion";
	}

	// 계정 활성화 페이지
	@GetMapping("/activationAccount")
	public String activationAccountd() {

		return "/signup/activationCompletion";
	}

	// 계정 활성화 완료 페이지
	@GetMapping("/activationCompletion")
	public void activationCompletion() {

	}

	// 비밀번호 찾기 페이지
	@GetMapping("/findByUserPassword")
	public void findByUserPassword() {

	}

	// 비밀번호 찾기 페이지
	@PostMapping("/findByUserPassword")
	public String findByUserPasswordd() {
//			@RequestParam("userEmail") String userEmail,
//			@RequestParam("userName") String username,
//			@RequestParam("userPhone") String userPhone ) {
//		log.info("findByUserPasswordd={}", dto);
//		
//		User user = userService.findByUserPassword(dto);
		
		return "/signup/signupEmail";
	}

}
