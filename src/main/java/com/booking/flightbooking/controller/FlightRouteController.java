package com.booking.flightbooking.controller;

import com.booking.flightbooking.entities.FlightRoute;
import com.booking.flightbooking.models.ResponseModel;
import com.booking.flightbooking.services.FlightRouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/route")
public class FlightRouteController {
    @Autowired
    private FlightRouteService flightRouteService;

    @PostMapping("/add")
    public ResponseModel<FlightRoute> addRoute (@RequestBody FlightRoute flightRoute){
        final FlightRoute planeRoute1 = flightRouteService.addRoute(flightRoute);
        return new ResponseModel<>(HttpStatus.OK.value(),"Route saved",planeRoute1);

    }
    @GetMapping("/all")
    public ResponseEntity<List<FlightRoute>> getAllRoutes(){
        return ResponseEntity.ok(flightRouteService.getAllPlaneRoutes());
    }
    @GetMapping("/{routeName}")
    public ResponseEntity<FlightRoute> getRouteByRouteName(@PathVariable(name = "routeName") String routeName){
        return ResponseEntity.ok(flightRouteService.getRouteByRouteName(routeName));
    }
    @GetMapping("/query")
    public ResponseEntity<FlightRoute> getRouteByCityFromAndCityTo(
            @RequestParam String cityFrom,
            @RequestParam String cityTo
    ) {
        return ResponseEntity.ok(flightRouteService.getRouteByCityFromAndCityTo(cityFrom,cityTo));
    }
}
