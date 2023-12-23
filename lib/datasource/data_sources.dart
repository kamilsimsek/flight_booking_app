import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/user.dart';

abstract class DataSource {
  Future<List<User>> getAllUser();
  Future addUser(User user);
  Future<FlightRoute?> getFlightRoute(String cityFrom, String cityTo);
  Future<List<FlightSchedule>> getSchedulesByRouteName(String routeName);
  Future<List<FlightReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate);
  Future addReservation(FlightReservation reservation);
  Future addPlane(Plane plane);
  Future addRoute(FlightRoute flightRoute);
  Future<List<Plane>> getAllPlane();
  Future<List<FlightRoute>> getAllRoutes();
  Future addSchedule(FlightSchedule flightSchedule);
}
