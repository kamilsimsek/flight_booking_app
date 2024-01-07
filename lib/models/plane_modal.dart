import 'package:freezed_annotation/freezed_annotation.dart';
part 'plane_modal.freezed.dart';
part 'plane_modal.g.dart';

@unfreezed
class Plane with _$Plane {
  factory Plane({
    int? planeId,
    required String planeName,
    required String planeType,
    required String planeNumber,
    required int totalSeat,
  }) = _Plane;
  factory Plane.fromJson(Map<String, dynamic> json) => _$PlaneFromJson(json);
}
