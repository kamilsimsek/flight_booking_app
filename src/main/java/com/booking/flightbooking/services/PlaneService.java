package com.booking.flightbooking.services;

import com.booking.flightbooking.entities.Plane;

import java.util.List;

public interface PlaneService {
    Plane addPlane(Plane plane);
    List<Plane> getAllPlane();
    public void deletePlane(Long id);
}
