package com.mpgovcrm.account.service;

import java.util.List;


import com.mpgovcrm.account.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
    
    List<User> findAll();
    
    void saveUser(String designation , Long district_id , 
			String password ,String userDisplayName , String username);
    
    
    void saveCustomer(User user);
    
    //void updateCustomer(User user);
}
