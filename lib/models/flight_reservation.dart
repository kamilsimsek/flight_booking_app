import 'package:ucak/models/customer.dart';
import 'package:ucak/models/flight_schedule_model.dart';

class FlightReservation {
  int? reservationId;
  FlightSchedule flightSchedule;
  Customer customer;
  int timestamp; //
  String departureDate;
  int totalSeatBooked;
  String seatNumbers;
  String reservationStatus; //////////////////
  int totalPrice;

  FlightReservation({
    this.reservationId,
    required this.flightSchedule,
    required this.customer,
    required this.timestamp,
    required this.departureDate,
    required this.totalSeatBooked,
    required this.seatNumbers,
    required this.reservationStatus,
    required this.totalPrice,
  });
}
