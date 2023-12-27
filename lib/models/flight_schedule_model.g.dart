// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightScheduleImpl _$$FlightScheduleImplFromJson(Map<String, dynamic> json) =>
    _$FlightScheduleImpl(
      scheduleId: json['scheduleId'] as int?,
      plane: Plane.fromJson(json['plane'] as Map<String, dynamic>),
      flightRoute:
          FlightRoute.fromJson(json['flightRoute'] as Map<String, dynamic>),
      departureTime: json['departureTime'] as String,
      ticketPrice: json['ticketPrice'] as int,
      discount: json['discount'] as int? ?? 0,
      processingFee: json['processingFee'] as int? ?? 100,
    );

Map<String, dynamic> _$$FlightScheduleImplToJson(
        _$FlightScheduleImpl instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'plane': instance.plane,
      'flightRoute': instance.flightRoute,
      'departureTime': instance.departureTime,
      'ticketPrice': instance.ticketPrice,
      'discount': instance.discount,
      'processingFee': instance.processingFee,
    };
