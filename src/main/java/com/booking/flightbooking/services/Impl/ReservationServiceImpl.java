package com.booking.flightbooking.services.Impl;

import com.booking.flightbooking.entities.FlightSchedule;
import com.booking.flightbooking.entities.Reservation;
import com.booking.flightbooking.entities.User;
import com.booking.flightbooking.models.ReservationApiException;
import com.booking.flightbooking.repos.FlightScheduleRepository;
import com.booking.flightbooking.repos.ReservationRepository;
import com.booking.flightbooking.repos.UserRepository;
import com.booking.flightbooking.services.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FlightScheduleRepository flightScheduleRepository;

    @Override
    public Reservation addReservation(Reservation reservation) {
        final User user;
        final boolean doesUserExist = userRepository.existsByEmail(reservation.getUser().getEmail());
        if(doesUserExist){
            user = userRepository.findByEmail(reservation.getUser().getEmail()).orElseThrow();
        }
        else {
            user = userRepository.save(reservation.getUser());
        }
        reservation.setUser(user);

        return reservationRepository.save(reservation);
    }

    @Override
    public List<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }

    @Override
    public List<Reservation> getReservationsByScheduleAndDepartureDate(Long scheduleId, String departureDate) {
        final FlightSchedule flightSchedule = flightScheduleRepository.findById(scheduleId).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Schedule not found"));
        return reservationRepository.findByFlightScheduleAndDepartureDate(flightSchedule,departureDate)
                .orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Reservation not found"));
    }

    @Override
    public List<Reservation> getReservationsByEmail(String userMail) {
        final User user = userRepository.findByEmail(userMail).orElseThrow(()-> new ReservationApiException(HttpStatus.BAD_REQUEST, "No record found"));
        return reservationRepository.findByUser(user).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No record found"));
    }
}
