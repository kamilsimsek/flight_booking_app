import 'package:ucak/models/customer.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'flight_reservation.freezed.dart';
part 'flight_reservation.g.dart';

@unfreezed
class FlightReservation with _$FlightReservation {
  factory FlightReservation({
    int? reservationId,
    required FlightSchedule flightSchedule,
    required Customer customer,
    required int timestamp,
    required String departureDate,
    required int totalSeatBooked,
    required String seatNumbers,
    required String reservationStatus,
    required int totalPrice,
  }) = _FlightReservation;

  factory FlightReservation.fromJson(Map<String, dynamic> json) =>
      _$FlightReservationFromJson(json);
}
