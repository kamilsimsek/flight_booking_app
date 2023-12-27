import 'dart:io';

import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/response_model.dart';

abstract class DataSource {
  Future<ResponseModel> addPlane(Plane plane);
  Future<List<Plane>> getAllPlane();
  Future<ResponseModel> addRoute(FlightRoute flightRoute);
  Future<List<FlightRoute>> getAllRoutes();
  Future<FlightRoute?> getRouteByRouteName(String routeName);
  Future<FlightRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo);
  Future<ResponseModel> addSchedule(FlightSchedule flightSchedule);
  Future<List<FlightSchedule>> getAllSchedules();
  Future<List<FlightSchedule>> getSchedulesByRouteName(String routeName);
  Future<ResponseModel> addReservation(FlightReservation reservation);
  Future<List<FlightReservation>> getAllReservation();
  Future<List<FlightReservation>> getReservationsByMobile(String mobile);
  Future<List<FlightReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate);
}
