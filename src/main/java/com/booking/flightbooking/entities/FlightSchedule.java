package com.booking.flightbooking.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "plane_schedule")
public class FlightSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduleId;
    @OneToOne
    @JoinColumn(name = "plane_id")
    private Plane plane;
    @OneToOne
    @JoinColumn(name = "flight_route_id")
    private FlightRoute flightRoute;
    private String departureTime;
    private Integer ticketPrice;
    private Integer discount;
    private Integer processingFee;
}
