// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightReservationImpl _$$FlightReservationImplFromJson(
        Map<String, dynamic> json) =>
    _$FlightReservationImpl(
      reservationId: json['reservationId'] as int?,
      flightSchedule: FlightSchedule.fromJson(
          json['flightSchedule'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as int,
      departureDate: json['departureDate'] as String,
      totalSeatBooked: json['totalSeatBooked'] as int,
      seatNumbers: json['seatNumbers'] as String,
      reservationStatus: json['reservationStatus'] as String,
      totalPrice: json['totalPrice'] as int,
    );

Map<String, dynamic> _$$FlightReservationImplToJson(
        _$FlightReservationImpl instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'flightSchedule': instance.flightSchedule,
      'customer': instance.customer,
      'timestamp': instance.timestamp,
      'departureDate': instance.departureDate,
      'totalSeatBooked': instance.totalSeatBooked,
      'seatNumbers': instance.seatNumbers,
      'reservationStatus': instance.reservationStatus,
      'totalPrice': instance.totalPrice,
    };
