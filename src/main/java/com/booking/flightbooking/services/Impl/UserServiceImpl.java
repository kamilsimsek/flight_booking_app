package com.booking.flightbooking.services.Impl;

import com.booking.flightbooking.entities.Plane;
import com.booking.flightbooking.entities.User;
import com.booking.flightbooking.repos.RoleRepository;
import com.booking.flightbooking.repos.UserRepository;
import com.booking.flightbooking.services.UserService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository){
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public User addUser(User user) {

        return null;
    }

    @Override
    public User findUserByEmail(String email) {
        return null;
    }

    @Override
    public List<Plane> getAllUser() {
        return null;
    }

}
