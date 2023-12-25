import 'package:ucak/datasource/data_sources.dart';
import 'package:ucak/datasource/dummy_data_sources.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/user.dart';
import 'package:flutter/material.dart';


class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = DummyDataSources();
  List<User> _userList = [];
  List<User> get userList => _userList;
  List<Plane> _planeList = [];
  List<FlightRoute> _routeList = [];
  List<Plane> get planeList => _planeList;

  List<FlightRoute> get routeList => _routeList;

  Future addUser(User user) {
    return _dataSource.addUser(user);
  }

  Future addRoute(FlightRoute route) {
    return _dataSource.addRoute(route);
  }

  Future addReservation(FlightReservation reservation) {
    return _dataSource.addReservation(reservation);
  }

  Future addPlane(Plane plane) {
    return _dataSource.addPlane(plane);
  }

  Future<FlightRoute?> getFlightRoute(String cityFrom, String cityTo) {
    return _dataSource.getFlightRoute(cityFrom, cityTo);
  }

  Future<List<FlightSchedule>> getSchedulesByRouteName(String routeName) async {
    return _dataSource.getSchedulesByRouteName(routeName);
  }

  Future<List<FlightReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) {
    return _dataSource.getReservationsByScheduleAndDepartureDate(
        scheduleId, departureDate);
  }

  void getAllUser() async {
    _userList = await _dataSource.getAllUser();
    notifyListeners();
  }

  void getAllPlane() async {
    _planeList = await _dataSource.getAllPlane();
    notifyListeners();
  }

  void getAllFlightRoutes() async {
    _routeList = await _dataSource.getAllRoutes();
    notifyListeners();
  }

  Future addSchedule(FlightSchedule flightSchedule) {
    return _dataSource.addSchedule(flightSchedule);
  }
}
