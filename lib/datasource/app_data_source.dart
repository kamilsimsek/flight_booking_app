import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ucak/datasource/data_sources.dart';
import 'package:ucak/datasource/temp_db.dart';
import 'package:ucak/models/error_details_model.dart';
import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/response_model.dart';
import 'package:ucak/utils/constants.dart';
import 'package:ucak/utils/helper_functions.dart';

class AppDataSource extends DataSource {
  final String baseUrl = 'http://10.0.2.2:8080/api/';

  Map<String, String> get header => {'Content-Type': 'application/json'};
  /*Future<Map<String, String>> get authHeader async => {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${await getToken()}',
      };
*/
  @override
  Future<ResponseModel> addPlane(Plane plane) async {
    final url = '$baseUrl${'plane/add'}';
    try {
      final response = await http.post(
        Uri.parse(url),
        //headers: await authHeader,
        body: json.encode(plane.toJson),
      );
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> addReservation(FlightReservation reservation) async {
    final url = '$baseUrl${'reservation/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: json.encode(reservation.toJson()));
      return await _getResponseModel(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel> addRoute(FlightRoute flightRoute) async {
    final url = '$baseUrl${'route/add'}';
    try {
      final response = await http.post(
        Uri.parse(url),
        //headers: await authHeader,
        body: json.encode(flightRoute.toJson()),
      );
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<ResponseModel> addSchedule(FlightSchedule flightSchedule) async {
    final url = '$baseUrl${'schedule/add'}';
    try {
      final response = await http.post(Uri.parse(url),
          // headers: await authHeader,
          body: json.encode(flightSchedule.toJson()));
      return await _getResponseModel(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<List<Plane>> getAllPlane() async {
    final url = '$baseUrl${'plane/all'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => Plane.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<FlightReservation>> getAllReservation() async {
    final url = '$baseUrl${'reservation/all'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(mapList.length,
            (index) => FlightReservation.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<FlightRoute>> getAllRoutes() async {
    final url = '$baseUrl${'route/all'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => FlightRoute.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<FlightSchedule>> getAllSchedules() {
    throw UnimplementedError();
  }

  @override
  Future<List<FlightReservation>> getReservationsByMobile(String mobile) async {
    final url = '$baseUrl${'reservation/all/$mobile'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(mapList.length,
            (index) => FlightReservation.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  @override
  Future<List<FlightReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) async {
    final url =
        '$baseUrl${'reservation/query?scheduleId=$scheduleId&departuredate=$departureDate'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(mapList.length,
            (index) => FlightReservation.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  @override
  Future<FlightRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) async {
    final url = '$baseUrl${'route/query?cityFrom=$cityFrom&cityTo=$cityTo'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final map = json.decode(response.body);
        return FlightRoute.fromJson(map);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<FlightRoute?> getRouteByRouteName(String routeName) {
    // TODO: implement getRouteByRouteName
    throw UnimplementedError();
  }

  @override
  Future<List<FlightSchedule>> getSchedulesByRouteName(String routeName) async {
    final url = '$baseUrl${'schedule/$routeName'}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mapList = json.decode(response.body) as List;
        return List.generate(
            mapList.length, (index) => FlightSchedule.fromJson(mapList[index]));
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  Future<ResponseModel> _getResponseModel(http.Response response) async {
    ResponseStatus status = ResponseStatus.NONE;
    ResponseModel responseModel = ResponseModel();
    if (response.statusCode == 200) {
      status = ResponseStatus.SAVED;
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      responseModel.responseStatus = status;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      if (await hasTokenExpired()) {
        status = ResponseStatus.EXPIRED;
      } else {
        status = ResponseStatus.UNAUTHORIZED;
      }
      responseModel = ResponseModel(
        responseStatus: status,
        statusCode: 401,
        message: 'Access denied. Please login as Admin',
      );
    } else if (response.statusCode == 500 || response.statusCode == 400) {
      final json = jsonDecode(response.body);
      final errorDetails = ErrorDetails.fromJson(json);
      status = ResponseStatus.FAILED;
      responseModel = ResponseModel(
        responseStatus: status,
        statusCode: 500,
        message: errorDetails.errorMessage,
      );
    }
    return responseModel;
  }
}
