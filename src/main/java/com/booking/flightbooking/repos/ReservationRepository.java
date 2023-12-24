package com.booking.flightbooking.repos;

import com.booking.flightbooking.entities.Customer;
import com.booking.flightbooking.entities.FlightSchedule;
import com.booking.flightbooking.entities.Reservation;
import com.booking.flightbooking.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    Optional<List<Reservation>> findByCustomer(Customer customer);
    Optional<List<Reservation>> findByFlightScheduleAndDepartureDate(FlightSchedule flightSchedule, String departureDate);

}
