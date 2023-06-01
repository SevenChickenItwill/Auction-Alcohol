/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {
    const signupForm = document.querySelector('#signupForm');
    const btnCancel = document.querySelector('#btnCancel');
    btnCancel.addEventListener('click', () => {
        const check = confirm('회원가입을 취소할까요?');
        if (check) {
            signupForm.action = './main';
            signupForm.method = 'get';
            signupForm.submit();
        }
    });

    const btnSignup = document.querySelector('#btnSignup');
    btnSignup.addEventListener('click', () => {
        const userName = document.querySelector('#userName').value;
        const userPassword = document.querySelector('#userPassword').value;
        const userPasswordCheck = document.querySelector('#userPasswordCheck').value;
        const userAddress = document.querySelector('#userAddress').value;
        const userPhone = document.querySelector('#userPhone').value;
        const userGender = document.querySelector('#userGender').value;
        const userBirthday = document.querySelector('#userBirthday').value;

        if (userName.length >= 8) {
            alert('사용자 이름은 8글자 미만이어야 합니다.');
            return;
        }

        if (userName === '' || userPassword === '' || userPasswordCheck === '' ||
            userAddress === '' || userPhone === '' || userGender === '' ||
            userBirthday === '') {
            alert('항목을 반드시 작성, 선택해주세요');
            return;
        }

        if (userPassword !== userPasswordCheck) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }

        if (!isValidPassword(userPassword)) {
            alert('비밀번호는 8자 이상 20자 미만이며, 숫자, 특수 기호, 알파벳으로만 구성되어야 합니다.');
            return;
        }

        const currentDate = new Date();
        const userBirthdate = new Date(userBirthday);
        const age = currentDate.getFullYear() - userBirthdate.getFullYear();

        if (age < 20) {
            alert('회원가입은 20세 이상만 가능합니다.');
            return;
        }

        const check = confirm('회원가입 할까요?');
        if (check) {
            signupForm.action = './signup';
            signupForm.method = 'post';
            signupForm.submit();
        }
    });

    function isValidPassword(password) {
        const regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
        return regex.test(password);
    }
});
