package com.booking.flightbooking.services;

import com.booking.flightbooking.entities.FlightRoute;

import java.util.List;

public interface FlightRouteService {
    FlightRoute addRoute(FlightRoute planeRoute);
    List<FlightRoute> getAllPlaneRoutes();

    FlightRoute getRouteByRouteName(String routeName);
    FlightRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo);

}
