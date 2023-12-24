package com.booking.flightbooking.controller;

import com.booking.flightbooking.entities.FlightSchedule;
import com.booking.flightbooking.models.ResponseModel;
import com.booking.flightbooking.services.FlightRouteService;
import com.booking.flightbooking.services.FlightScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/schedule")
public class FlightScheduleController {
    @Autowired
    private FlightScheduleService flightScheduleService;
    @PostMapping("/add")
    public ResponseModel<FlightSchedule> addFlightSchedule(@RequestBody FlightSchedule flightSchedule){
        final FlightSchedule schedule = flightScheduleService.addSchedule(flightSchedule);
        return new ResponseModel<>(HttpStatus.OK.value(), "Schedule saved", schedule);
    }

    @GetMapping("/all")
    public ResponseEntity<List<FlightSchedule>> getAllSchedules(){
        return ResponseEntity.ok(flightScheduleService.getAllFlightSchedules());
    }

    @GetMapping("/{routeName}")
    public ResponseEntity<List<FlightSchedule>> getFlightScheduleByRouteName(@PathVariable(name = "routeName") String routeName){
        return ResponseEntity.ok(flightScheduleService.getSchedulesByRoute(routeName));
    }
}
