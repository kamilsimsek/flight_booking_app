package com.booking.flightbooking.repos;

import com.booking.flightbooking.entities.Plane;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlaneRepository extends JpaRepository<Plane,Long> {

}
