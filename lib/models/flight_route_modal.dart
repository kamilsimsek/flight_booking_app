import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ucak/models/plane_modal.dart';
part 'flight_route_modal.freezed.dart';
part 'flight_route_modal.g.dart';

@unfreezed
class FlightRoute with _$FlightRoute {
  factory FlightRoute({
    int? routeId,
    required String routeName,
    required String cityFrom,
    required String cityTo,
    required double distanceInKm,
  }) = _FlightRoute;

  factory FlightRoute.fromJson(Map<String, dynamic> json) =>
      _$FlightRouteFromJson(json);
}
