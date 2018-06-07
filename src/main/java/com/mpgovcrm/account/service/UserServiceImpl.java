package com.mpgovcrm.account.service;

import com.mpgovcrm.account.model.Role;
import com.mpgovcrm.account.model.User;
import com.mpgovcrm.account.repository.RoleRepository;
import com.mpgovcrm.account.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

	
    
    @Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	@Override
	public void saveUser(String designation, Long district_id, String password, String userDisplayName,
			String username) {
		System.out.println("---saving   userDisplayName  --"+userDisplayName);
		userRepository.saveUser(designation, district_id, bCryptPasswordEncoder.encode(password), userDisplayName, username);
		
	}

	@Override
	public void saveCustomer(User user) {
		System.out.println("..saving customer.....");
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		
		Role r = roleRepository.findOne(2L);
		Set<Role> sr=  new HashSet<>();
		sr.add(r);
        user.setRoles(sr);
        userRepository.save(user);
		
	}

	
}
