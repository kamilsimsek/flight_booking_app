import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/utils/constants.dart';

class TempDB {
  static List<FlightRoute> routeList = [
    FlightRoute(
      routeId: 1,
      routeName: 'Istanbul-Izmir',
      cityFrom: 'Istanbul',
      cityTo: 'Izmir',
    )
  ];

  static List<FlightSchedule> tableSchedule = [];

  static List<Plane> planeList = [
    Plane(
      planeName: "özelUcakIsim",
      planeNumber: "62",
      planeType: Private,
      totalSeat: 30,
    ),
  ];

  static List<FlightReservation> flightReservationList = [];
}
