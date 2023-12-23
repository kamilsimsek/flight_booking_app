import 'package:flutter/material.dart';
import 'package:ucak/datasource/data_sources.dart';
import 'package:ucak/datasource/temp_db.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/user.dart';

class DummyDataSources extends DataSource {
  @override
  Future<List<User>> getAllUser() async {
    return TempDB.userList;
  }

  @override
  Future addUser(User user) async {
    TempDB.userList.add(user);
  }

  @override
  Future<FlightRoute?> getFlightRoute(String cityFrom, String cityTo) async {
    FlightRoute? route;
    try {
      route = TempDB.routeList.firstWhere((element) =>
          element.cityFrom == cityFrom && element.cityTo == cityTo);
      return route;
    } on StateError catch (error) {
      return null;
    }
  }

  @override
  Future<List<FlightSchedule>> getSchedulesByRouteName(String routeName) async {
    return TempDB.tableSchedule
        .where((schedule) => schedule.flightRoute.routeName == routeName)
        .toList();
  }

  @override
  Future<List<FlightReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) async {
    return TempDB.flightReservationList
        .where((element) =>
            element.flightSchedule.scheduleId == scheduleId &&
            element.departureDate == departureDate)
        .toList();
  }

  @override
  Future addReservation(FlightReservation reservation) async {
    TempDB.flightReservationList.add(reservation);
    print(TempDB.flightReservationList.length);
    return "Rezervasyon kaydedildi";
  }

  @override
  Future addPlane(Plane plane) async {
    TempDB.planeList.add(plane);
    return;
  }

  @override
  Future addRoute(FlightRoute flightRoute) async {
    TempDB.routeList.add(flightRoute);
    return;
  }

  @override
  Future<List<Plane>> getAllPlane() async {
    return TempDB.planeList;
  }

  @override
  Future<List<FlightRoute>> getAllRoutes() async {
    return TempDB.routeList;
  }

  @override
  Future addSchedule(FlightSchedule flightSchedule) async {
    TempDB.tableSchedule.add(flightSchedule);
    return;
  }
}
