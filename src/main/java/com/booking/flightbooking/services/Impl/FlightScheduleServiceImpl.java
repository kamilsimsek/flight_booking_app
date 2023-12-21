package com.booking.flightbooking.services.Impl;

import com.booking.flightbooking.entities.FlightRoute;
import com.booking.flightbooking.entities.FlightSchedule;
import com.booking.flightbooking.models.ReservationApiException;
import com.booking.flightbooking.repos.FlightRouteRepository;
import com.booking.flightbooking.repos.FlightScheduleRepository;
import com.booking.flightbooking.services.FlightScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightScheduleServiceImpl implements FlightScheduleService {
    @Autowired
    private FlightScheduleRepository flightScheduleRepository;
    @Autowired
    private FlightRouteRepository flightRouteRepository;

    @Override
    public FlightSchedule addSchedule(FlightSchedule flightSchedule) throws ReservationApiException{
        final boolean exists = flightScheduleRepository.existsByPlaneAndFlightRouteAndDepartureTime(
                flightSchedule.getPlane(),
                flightSchedule.getFlightRoute(),
                flightSchedule.getDepartureTime()
        );
        if (exists){
            throw new ReservationApiException(HttpStatus.CONFLICT, "Duplicate Schedule");
        }

        return flightScheduleRepository.save(flightSchedule);
    }

    @Override
    public List<FlightSchedule> getAllFlightSchedules() {
        return flightScheduleRepository.findAll();
    }

    @Override
    public List<FlightSchedule> getSchedulesByRoute(String routeName) {
        final FlightRoute flightRoute = flightRouteRepository.findByRouteName(routeName).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Not Found"));
        return flightScheduleRepository.findByFlightRoute(flightRoute).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Not Found"));
    }
}
