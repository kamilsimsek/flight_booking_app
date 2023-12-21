package com.booking.flightbooking.services.Impl;

import com.booking.flightbooking.entities.FlightRoute;
import com.booking.flightbooking.models.ReservationApiException;
import com.booking.flightbooking.repos.FlightRouteRepository;
import com.booking.flightbooking.services.FlightRouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightRouteServiceImpl implements FlightRouteService {
    @Autowired
    private FlightRouteRepository flightRouteRepository;

    @Override
    public FlightRoute addRoute(FlightRoute flightRoute) {
        return flightRouteRepository.save(flightRoute);
    }

    @Override
    public List<FlightRoute> getAllPlaneRoutes() {
        return flightRouteRepository.findAll();
    }

    @Override
    public FlightRoute getRouteByRouteName(String routeName) {
        return flightRouteRepository.findByRouteName(routeName).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No such route found."));
    }

    @Override
    public FlightRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo) {
        return flightRouteRepository.findByCityFromAndCityTo(cityFrom,cityTo).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No such route found."));
    }
}
