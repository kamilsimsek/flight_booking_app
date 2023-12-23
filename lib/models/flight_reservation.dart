import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/user.dart';

class FlightReservation {
  int? reservationId;
  User user; //
  FlightSchedule flightSchedule;
  int timestamp; //
  String departureDate;
  int totalSeatBooked;
  String seatNumbers;
  String reservationStatus; //////////////////
  int totalPrice;

  FlightReservation({
    this.reservationId,
    required this.user,
    required this.flightSchedule,
    required this.timestamp,
    required this.departureDate,
    required this.totalSeatBooked,
    required this.seatNumbers,
    required this.reservationStatus,
    required this.totalPrice,
  });
}
