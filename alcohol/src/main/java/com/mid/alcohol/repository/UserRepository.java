package com.mid.alcohol.repository;

import com.mid.alcohol.domain.User;

public interface UserRepository {
    
    int userEmailSignup(User user);
    
    int userMainSignup(User user);

    User findByUserEmail(String userEmail);
}
