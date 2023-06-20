document.addEventListener('DOMContentLoaded', () => {
  const findPasswordForm = document.querySelector('#findPasswordForm');
  const userAccountName = document.querySelector('input#userAccountName');
  const userAccountEmail = document.querySelector('input#userAccountEmail');
  const userAccountPhone = document.querySelector('input#userAccountPhone');
  const btnFindPassword = document.querySelector('button#btnFindPassword');

  btnFindPassword.addEventListener('click', async () => {
    const userEmail = userAccountEmail.value;
    const userName = userAccountName.value;
    const userPhone = userAccountPhone.value;

    if (
      userName === '' ||
      userEmail === '' ||
      userPhone === ''
    ) {
      alert('항목을 반드시 작성해주세요.');
      return;
    }

    // 이메일 유효성 검사
    if (!isValidEmail(userEmail)) {
      alert('유효한 이메일 주소를 입력하세요.');
      return;
    }

    // 이름 길이 검사
    if (!isValidName(userName)) {
      alert('이름은 최대 8글자까지 입력할 수 있습니다.');
      return;
    }

    if (!isValidPhoneNumber(userPhone)) {
      alert('올바른 전화번호 형식을 입력해주세요. (예: 010-0000-0000)');
      return;
    }

    const url = `/alcohol/api/signup/findByUserPassword`;
    const data = {
      userEmail: userEmail,
      userName: userName,
      userPhone: userPhone
    };
    try {
      let response = await axios.post(url, data);
      console.log(response);

      // 비밀번호 찾기 결과에 따른 처리
      if (response.data === "invalid") {
        // 이메일, 이름, 전화번호가 일치하지 않는 경우
        alert('정보가 일치하지 않습니다.');
        return;
      } else {
        // 이메일, 이름, 전화번호가 일치하는 경우 
        alert(`비밀번호: ${response.data}`);
      }
    } catch (error) {
      console.log(error);
      return;
    }

    findPasswordForm.action = '/alcohol/signup/findByUserPassword';
    findPasswordForm.method = 'post';
    findPasswordForm.submit();
  });

  // 이메일 유효성 검사 함수
  function isValidEmail(email) {
    // 간단한 이메일 유효성 검사를 위한 정규식
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  // 이름 길이 검사 함수
  function isValidName(name) {
    // 이름은 최대 8글자까지 입력 가능
    return name.length <= 8;
  }

  // 전화번호 유효성 체크
  function isValidPhoneNumber(phoneNumber) {
    const regex = /^\d{3}-\d{4}-\d{4}$/;
    return regex.test(phoneNumber);
  }
});
