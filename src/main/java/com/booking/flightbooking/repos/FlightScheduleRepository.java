package com.booking.flightbooking.repos;

import com.booking.flightbooking.entities.FlightRoute;
import com.booking.flightbooking.entities.FlightSchedule;
import com.booking.flightbooking.entities.Plane;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface FlightScheduleRepository extends JpaRepository<FlightSchedule, Long> {
    Optional<List<FlightSchedule>> findByFlightRoute(FlightRoute flightRoute);
    Boolean existsByPlaneAndFlightRouteAndDepartureTime(Plane plane, FlightRoute flightRoute, String date);
}
