import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/plane_modal.dart';

class FlightSchedule {
  int? scheduleId;
  Plane plane;
  FlightRoute flightRoute;
  String departureTime;
  int ticketPrice;
  int discount;
  int processingFee;

  FlightSchedule(
      {this.scheduleId,
      required this.plane,
      required this.flightRoute,
      required this.departureTime,
      required this.ticketPrice,
      this.discount = 0,
      this.processingFee = 50});
}
