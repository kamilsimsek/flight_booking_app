package com.booking.flightbooking.repos;

import com.booking.flightbooking.entities.FlightRoute;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FlightRouteRepository extends JpaRepository<FlightRoute, Long> {
    Optional<FlightRoute> findByRouteName(String routeName);
    Optional<FlightRoute> findByCityFromAndCityTo(String cityFrom, String cityTo);
}
