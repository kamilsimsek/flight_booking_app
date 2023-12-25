package com.booking.flightbooking.controller;

import com.booking.flightbooking.entities.Plane;
import com.booking.flightbooking.models.ResponseModel;
import com.booking.flightbooking.services.PlaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/plane")
public class PlaneController {
    @Autowired
    private PlaneService planeService;
    @PostMapping("/add")
    public ResponseModel<Plane> addPlane(@RequestBody Plane plane){
        final Plane savedPlane = planeService.addPlane(plane);
        return new ResponseModel<>(HttpStatus.OK.value(),"Plane saved", savedPlane);
    }

    @GetMapping("/all")
    public ResponseEntity<List<Plane>> getAllPlane(){
        return ResponseEntity.ok(planeService.getAllPlane());
    }
}
