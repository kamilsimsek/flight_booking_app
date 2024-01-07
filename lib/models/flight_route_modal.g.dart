// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_route_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightRouteImpl _$$FlightRouteImplFromJson(Map<String, dynamic> json) =>
    _$FlightRouteImpl(
      routeId: json['routeId'] as int?,
      routeName: json['routeName'] as String,
      cityFrom: json['cityFrom'] as String,
      cityTo: json['cityTo'] as String,
    );

Map<String, dynamic> _$$FlightRouteImplToJson(_$FlightRouteImpl instance) =>
    <String, dynamic>{
      'routeId': instance.routeId,
      'routeName': instance.routeName,
      'cityFrom': instance.cityFrom,
      'cityTo': instance.cityTo,
    };
