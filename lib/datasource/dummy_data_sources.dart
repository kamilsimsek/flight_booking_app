import 'package:ucak/datasource/data_sources.dart';
import 'package:ucak/datasource/temp_db.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/response_model.dart';
import 'package:ucak/utils/constants.dart';

class DummyDataSources extends DataSource {
  @override
  Future<FlightRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) async {
    FlightRoute? route;
    try {
      route = TempDB.routeList.firstWhere((element) =>
          element.cityFrom == cityFrom && element.cityTo == cityTo);
      return route;
    // ignore: unused_catch_clause
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
  Future<FlightRoute?> getRouteByRouteName(String routeName) {
    throw UnimplementedError();
  }

  @override
  Future<List<FlightReservation>> getReservationsByMobile(String mobile) async {
    return TempDB.flightReservationList
        .where((element) => element.customer.mobile == mobile)
        .toList();
  }

  @override
  Future<ResponseModel> addReservation(FlightReservation reservation) async {
    TempDB.flightReservationList.add(reservation);
    print(TempDB.flightReservationList.length);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Rezervasyon Onaylandı',
        object: {});
  }

  @override
  Future<ResponseModel> addPlane(Plane plane) async {
    TempDB.planeList.add(plane);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Uçak Eklendi',
        object: {});
  }

  @override
  Future<ResponseModel> addRoute(FlightRoute flightRoute) async {
    TempDB.routeList.add(flightRoute);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Rota Kaydedildi',
        object: {});
  }

  @override
  Future<List<Plane>> getAllPlane() async {
    return TempDB.planeList;
  }

  @override
  Future<List<FlightReservation>> getAllReservation() async {
    return TempDB.flightReservationList;
  }

  @override
  Future<List<FlightRoute>> getAllFlightRoutes() async {
    return TempDB.routeList;
  }

  @override
  Future<List<FlightSchedule>> getAllSchedules() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addSchedule(FlightSchedule flightSchedule) async {
    TempDB.tableSchedule.add(flightSchedule);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Güzergah Kaydedildi',
        object: {});
  }
}
