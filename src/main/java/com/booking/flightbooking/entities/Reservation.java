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
@Table(name = "flight_reservation")
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reservationId;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    @OneToOne
    @JoinColumn(name = "flight_schedule_id")
    private FlightSchedule flightSchedule;
    private Long timestamp;
    private String departureDate;
    private Integer totalSeatBooked;
    private String seatNumbers;
    private String reservationStatus;
    private Integer totalPrice;
}