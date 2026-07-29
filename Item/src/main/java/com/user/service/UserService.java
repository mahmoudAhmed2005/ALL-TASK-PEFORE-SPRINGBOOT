package com.user.service;

import com.user.model.User;

public interface UserService {
	
	boolean signUp(User user);
	boolean logIn(String userName,String password);
	boolean checkEmail(String email);
	boolean resetPassword(String email,String newPassword);

}
