


document.addEventListener('DOMContentLoaded', () => {
    const accountForm = document.querySelector('#accountForm');
    const btnPhoneCancel = document.querySelector('button#btnPhoneCancel');  
    const btnPhoneUpdate = document.querySelector('button#btnPhoneUpdate');
    const userAccountPhoneModify = document.querySelector('#userAccountPhoneModify');

    btnPhoneCancel.addEventListener('click', () => {
        const check = confirm('수정을 취소할까요?');
        if (check) {
            accountForm.action = './userModify';
            accountForm.method = 'get';
            accountForm.submit();
        }
    });

    btnPhoneUpdate.addEventListener('click', () => {		
        if (userAccountPhoneModify.value.trim() === '') {
            alert('항목을 반드시 작성하세요.');
            return;
        }
        const check = confirm('수정할까요?');
        if (check) {
            accountForm.action = './userModify';
            accountForm.method = 'post';
            accountForm.submit();
        }
    });
});
