import 'package:freezed_annotation/freezed_annotation.dart';
part 'flight_route_modal.freezed.dart';
part 'flight_route_modal.g.dart';

@unfreezed
class FlightRoute with _$FlightRoute {
  factory FlightRoute({
    int? routeId,
    required String routeName,
    required String cityFrom,
    required String cityTo,
  }) = _FlightRoute;

  factory FlightRoute.fromJson(Map<String, dynamic> json) =>
      _$FlightRouteFromJson(json);
}
