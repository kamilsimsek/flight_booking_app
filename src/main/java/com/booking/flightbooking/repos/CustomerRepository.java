package com.booking.flightbooking.repos;

import com.booking.flightbooking.entities.Customer;
import com.booking.flightbooking.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Optional<Customer> findByEmail(String email);

    Boolean existsByEmail(String email);
    Optional<Customer> findByUserName(String userName);
}
