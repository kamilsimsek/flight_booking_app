package com.booking.flightbooking.services.Impl;

import com.booking.flightbooking.entities.Customer;
import com.booking.flightbooking.entities.FlightSchedule;
import com.booking.flightbooking.entities.Reservation;
import com.booking.flightbooking.models.ReservationApiException;
import com.booking.flightbooking.repos.FlightScheduleRepository;
import com.booking.flightbooking.repos.ReservationRepository;
import com.booking.flightbooking.repos.CustomerRepository;
import com.booking.flightbooking.services.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private FlightScheduleRepository flightScheduleRepository;

    @Override
    public Reservation addReservation(Reservation reservation) {
        final Customer customer;
        final boolean doesUserExist = customerRepository.existsByEmail(reservation.getCustomer().getEmail());
        if(doesUserExist){
            customer = customerRepository.findByEmail(reservation.getCustomer().getEmail()).orElseThrow();
        }
        else {
            customer = customerRepository.save(reservation.getCustomer());
        }
        reservation.setCustomer(customer);

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
        final Customer customer = customerRepository.findByEmail(userMail).orElseThrow(()-> new ReservationApiException(HttpStatus.BAD_REQUEST, "No record found"));
        return reservationRepository.findByCustomer(customer).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No record found"));
    }
}
