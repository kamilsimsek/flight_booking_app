package com.booking.flightbooking.services;

import com.booking.flightbooking.entities.Plane;
import com.booking.flightbooking.entities.User;
import com.booking.flightbooking.repos.UserRepository;

import java.util.List;

public interface UserService {
    User addUser(User user);
    User findUserByEmail(String email);
    List<Plane> getAllUser();
}
