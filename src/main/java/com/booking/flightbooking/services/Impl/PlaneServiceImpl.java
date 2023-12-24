package com.booking.flightbooking.services.Impl;

import com.booking.flightbooking.entities.Plane;
import com.booking.flightbooking.models.ResourceNotFoundException;
import com.booking.flightbooking.repos.PlaneRepository;
import com.booking.flightbooking.services.PlaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaneServiceImpl implements PlaneService{
    @Autowired
    private PlaneRepository planeRepository;

    @Override
    public Plane addPlane(Plane plane) {
        return planeRepository.save(plane);
    }

    @Override
    public List<Plane> getAllPlane() {
        return planeRepository.findAll();
    }
    @Override
    public void deletePlane(Long id) {
        Plane plane = planeRepository.findById(id).
                orElseThrow(() -> new ResourceNotFoundException("Bus not found with id : "+id));
        planeRepository.deleteById(id);
    }
}
