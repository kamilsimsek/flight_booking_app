// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaneImpl _$$PlaneImplFromJson(Map<String, dynamic> json) => _$PlaneImpl(
      planeId: json['planeId'] as int?,
      planeName: json['planeName'] as String,
      planeType: json['planeType'] as String,
      planeNumber: json['planeNumber'] as String,
      totalSeat: json['totalSeat'] as int,
    );

Map<String, dynamic> _$$PlaneImplToJson(_$PlaneImpl instance) =>
    <String, dynamic>{
      'planeId': instance.planeId,
      'planeName': instance.planeName,
      'planeType': instance.planeType,
      'planeNumber': instance.planeNumber,
      'totalSeat': instance.totalSeat,
    };
