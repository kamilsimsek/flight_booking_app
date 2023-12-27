import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/plane_modal.dart';
part 'flight_schedule_model.freezed.dart';
part 'flight_schedule_model.g.dart';

@unfreezed
class FlightSchedule with _$FlightSchedule {
  factory FlightSchedule({
    int? scheduleId,
    required Plane plane,
    required FlightRoute flightRoute,
    required String departureTime,
    required int ticketPrice,
    @Default(0) int discount,
    @Default(100) int processingFee,
  }) = _FlightSchedule;

  factory FlightSchedule.fromJson(Map<String, dynamic> json) =>
      _$FlightScheduleFromJson(json);
}
