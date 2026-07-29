package com.user.service;

import com.user.model.User;

public interface UserService {
	

    boolean signup(User user);



    boolean login(String userName , String password);



    boolean checkUserName(String userName);


    boolean resetPassword(String userName ,String newPassword);

    boolean logout();
    
    

}
