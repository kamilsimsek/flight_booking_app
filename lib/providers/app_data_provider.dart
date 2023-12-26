import 'package:flutter/material.dart';
import 'package:ucak/datasource/data_sources.dart';
import 'package:ucak/datasource/dummy_data_sources.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/reservation_expansion_item.dart';
import 'package:ucak/models/response_model%20copy.dart';

class AppDataProvider extends ChangeNotifier {
  List<Plane> _planeList = [];
  List<FlightRoute> _routeList = [];
  List<FlightReservation> _reservationList = [];
  List<FlightSchedule> _scheduleList = [];

  List<FlightSchedule> get scheduleList => _scheduleList;

  List<Plane> get planeList => _planeList;

  List<FlightRoute> get routeList => _routeList;

  List<FlightReservation> get reservationList => _reservationList;
  final DataSource _dataSource = DummyDataSources();

  Future<ResponseModel> addPlane(Plane plane) {
    return _dataSource.addPlane(plane);
  }

  Future<ResponseModel> addRoute(FlightRoute route) {
    return _dataSource.addRoute(route);
  }

  Future<ResponseModel> addSchedule(FlightSchedule busSchedule) {
    return _dataSource.addSchedule(busSchedule);
  }

  Future<ResponseModel> addReservation(FlightReservation reservation) {
    return _dataSource.addReservation(reservation);
  }

  void getAllPlane() async {
    _planeList = await _dataSource.getAllPlane();
    notifyListeners();
  }

  void getAllPlaneRoutes() async {
    _routeList = await _dataSource.getAllRoutes();
    notifyListeners();
  }

  Future<List<FlightReservation>> getAllReservations() async {
    _reservationList = await _dataSource.getAllReservation();
    notifyListeners();
    return _reservationList;
  }

  Future<List<FlightReservation>> getReservationsByMobile(String mobile) {
    return _dataSource.getReservationsByMobile(mobile);
  }

  Future<FlightRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) {
    return _dataSource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }

  Future<List<FlightSchedule>> getSchedulesByRouteName(String routeName) async {
    return _dataSource.getSchedulesByRouteName(routeName);
  }

  Future<List<FlightReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) {
    return _dataSource.getReservationsByScheduleAndDepartureDate(
        scheduleId, departureDate);
  }

  List<ReservationExpansionItem> getExpansionItems(
      List<FlightReservation> reservationList) {
    return List.generate(reservationList.length, (index) {
      final reservation = reservationList[index];
      return ReservationExpansionItem(
        header: ReservationExpansionHeader(
          reservationId: reservation.reservationId,
          departureDate: reservation.departureDate,
          schedule: reservation.flightSchedule,
          timestamp: reservation.timestamp,
          reservationStatus: reservation.reservationStatus,
        ),
        body: ReservationExpansionBody(
          customer: reservation.customer,
          totalSeatedBooked: reservation.totalSeatBooked,
          seatNumbers: reservation.seatNumbers,
          totalPrice: reservation.totalPrice,
        ),
      );
    });
  }
}
