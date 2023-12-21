package com.booking.flightbooking.services;

import com.booking.flightbooking.entities.FlightSchedule;

import java.util.List;

public interface FlightScheduleService {
    FlightSchedule addSchedule(FlightSchedule flightSchedule);
    List<FlightSchedule> getAllFlightSchedules();
    List<FlightSchedule> getSchedulesByRoute(String routeName);
}
