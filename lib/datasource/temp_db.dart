import 'package:ucak/models/flight_reservation.dart';
import 'package:ucak/models/flight_route_modal.dart';
import 'package:ucak/models/flight_schedule_model.dart';
import 'package:ucak/models/plane_modal.dart';
import 'package:ucak/models/user.dart';


class TempDB {
  static List<User> userList = [
    User(
        id: 1,
        name: "Nart",
        mail: "nartGottenSıken@gmail.com",
        password: "1234",
        role: "user"),
    User(
        id: 2,
        name: "caglar",
        mail: "caglarGottenSıken@gmail.com",
        password: "1234",
        role: "admin"),
  ];

  static List<FlightRoute> routeList = [
    FlightRoute(
        routeId: 1,
        routeName: 'Istanbul-Izmir',
        cityFrom: 'Istanbul',
        cityTo: 'Izmir',
        distanceInKm: 250),
    FlightRoute(
        routeId: 2,
        routeName: 'Izmir-Istanbul',
        cityFrom: 'Izmir',
        cityTo: 'Istanbul',
        distanceInKm: 250),
    FlightRoute(
        routeId: 3,
        routeName: 'Antalya-Istanbul',
        cityFrom: 'Antalya',
        cityTo: 'Istanbul',
        distanceInKm: 250),
  ];

  static List<FlightSchedule> tableSchedule = [
    FlightSchedule(
      scheduleId: 1,
      plane: planeList[0],
      flightRoute: routeList[0],
      departureTime: '18:00',
      ticketPrice: 2000,
    ),
    FlightSchedule(
      scheduleId: 1,
      plane: planeList[1],
      flightRoute: routeList[0],
      departureTime: '20:00',
      ticketPrice: 1600,
    ),
    FlightSchedule(
      scheduleId: 2,
      plane: planeList[2],
      flightRoute: routeList[0],
      departureTime: '18:00',
      ticketPrice: 100,
    ),
    FlightSchedule(
      scheduleId: 4,
      plane: planeList[0],
      flightRoute: routeList[1],
      departureTime: '18:00',
      ticketPrice: 2000,
    ),
    FlightSchedule(
      scheduleId: 1,
      plane: planeList[0],
      flightRoute: routeList[0],
      departureTime: '18:00',
      ticketPrice: 2000,
    ),
    FlightSchedule(
      scheduleId: 1,
      plane: planeList[1],
      flightRoute: routeList[0],
      departureTime: '20:00',
      ticketPrice: 1600,
    ),
    FlightSchedule(
      scheduleId: 2,
      plane: planeList[2],
      flightRoute: routeList[0],
      departureTime: '18:00',
      ticketPrice: 100,
    ),
    FlightSchedule(
      scheduleId: 4,
      plane: planeList[0],
      flightRoute: routeList[1],
      departureTime: '18:00',
      ticketPrice: 2000,
    ),
  ];

  static List<Plane> planeList = [
    Plane(
      planeName: "özelUcakIsim",
      planeNumber: "62",
      planeType: "özelUcak",
      totalSeat: 30,
    ),
    Plane(
      planeName: "kücükYolcuIsim",
      planeNumber: "35",
      planeType: "kucukYolcu",
      totalSeat: 48,
    ),
    Plane(
      planeName: "büyükYolcuIsim",
      planeNumber: "35",
      planeType: "büyükYolcu",
      totalSeat: 39,
    ),
  ];

  static List<FlightReservation> flightReservationList = [];
}
