package com.mpgovcrm.account.repository;

import com.mpgovcrm.account.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    
    List<User> findAll();
    
    @Modifying
    @Query(value="insert into user (designation, district_id, password, userDisplayName, username) values (:designation, :district_id, :password, :userDisplayName, :username)" , nativeQuery = true)
    @Transactional
	void saveUser(@Param("designation") String designation , @Param("district_id") Long district_id , 
			@Param("password") String password ,@Param("userDisplayName") String userDisplayName ,@Param("username") String username);
}
