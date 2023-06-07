/**
 * 
 */
import axios from 'axios';

const email = 'brandea@naver.com';
const btnEmailCheck = document.querySelector('button#btnEmailCheck');
btnEmailCheck.addEventListener('click', () => {

axios.post('/api/email-verification', { email })
  .then(response => {
    // 이메일 인증 요청 성공
    console.log(response.data);
  })
  .catch(error => {
    // 이메일 인증 요청 실패
    console.error(error);
    });
  });
