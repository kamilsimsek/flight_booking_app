class FlightRoute {
  int? routeId;
  String routeName;
  String cityFrom;
  String cityTo;
  double distanceInKm;

  FlightRoute(
      {this.routeId,
      required this.routeName,
      required this.cityFrom,
      required this.cityTo,
      required this.distanceInKm});
}
