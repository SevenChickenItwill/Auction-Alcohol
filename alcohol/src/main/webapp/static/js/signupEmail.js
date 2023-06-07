document.addEventListener('DOMContentLoaded', () => {
  const signupEmailForm = document.querySelector('#signupEmailForm');
  const btnNext = document.querySelector('#btnNext');
  const userEmail = document.querySelector('#userEmail');

  btnNext.addEventListener('click', (event) => {
    // userEmail.value로 입력된 값을 가져와서 확인해야 합니다.
    const emailValue = userEmail.value;

    if (emailValue === '') {
      alert('이메일을 반드시 작성하세요.');
      event.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.
      return;
    }

    // 이메일 유효성 검사
    if (!isValidEmail(emailValue)) {
      alert('유효한 이메일 주소를 입력하세요.');
      event.preventDefault(); // 이벤트의 기본 동작(폼 제출)을 중지합니다.
      return;
    }

    signupEmailForm.action = './signupEmail';
    signupEmailForm.method = 'post';
    // 폼 제출
  });

  // 이메일 유효성 검사 함수
  function isValidEmail(email) {
    // 간단한 이메일 유효성 검사를 위한 정규식
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }
});
