// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plane_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plane _$PlaneFromJson(Map<String, dynamic> json) {
  return _Plane.fromJson(json);
}

/// @nodoc
mixin _$Plane {
  int? get planeId => throw _privateConstructorUsedError;
  set planeId(int? value) => throw _privateConstructorUsedError;
  String get planeName => throw _privateConstructorUsedError;
  set planeName(String value) => throw _privateConstructorUsedError;
  String get planeNumber => throw _privateConstructorUsedError;
  set planeNumber(String value) => throw _privateConstructorUsedError;
  String get planeType => throw _privateConstructorUsedError;
  set planeType(String value) => throw _privateConstructorUsedError;
  int get totalSeat => throw _privateConstructorUsedError;
  set totalSeat(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaneCopyWith<Plane> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaneCopyWith<$Res> {
  factory $PlaneCopyWith(Plane value, $Res Function(Plane) then) =
      _$PlaneCopyWithImpl<$Res, Plane>;
  @useResult
  $Res call(
      {int? planeId,
      String planeName,
      String planeNumber,
      String planeType,
      int totalSeat});
}

/// @nodoc
class _$PlaneCopyWithImpl<$Res, $Val extends Plane>
    implements $PlaneCopyWith<$Res> {
  _$PlaneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planeId = freezed,
    Object? planeName = null,
    Object? planeNumber = null,
    Object? planeType = null,
    Object? totalSeat = null,
  }) {
    return _then(_value.copyWith(
      planeId: freezed == planeId
          ? _value.planeId
          : planeId // ignore: cast_nullable_to_non_nullable
              as int?,
      planeName: null == planeName
          ? _value.planeName
          : planeName // ignore: cast_nullable_to_non_nullable
              as String,
      planeNumber: null == planeNumber
          ? _value.planeNumber
          : planeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      planeType: null == planeType
          ? _value.planeType
          : planeType // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeat: null == totalSeat
          ? _value.totalSeat
          : totalSeat // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaneImplCopyWith<$Res> implements $PlaneCopyWith<$Res> {
  factory _$$PlaneImplCopyWith(
          _$PlaneImpl value, $Res Function(_$PlaneImpl) then) =
      __$$PlaneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? planeId,
      String planeName,
      String planeNumber,
      String planeType,
      int totalSeat});
}

/// @nodoc
class __$$PlaneImplCopyWithImpl<$Res>
    extends _$PlaneCopyWithImpl<$Res, _$PlaneImpl>
    implements _$$PlaneImplCopyWith<$Res> {
  __$$PlaneImplCopyWithImpl(
      _$PlaneImpl _value, $Res Function(_$PlaneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planeId = freezed,
    Object? planeName = null,
    Object? planeNumber = null,
    Object? planeType = null,
    Object? totalSeat = null,
  }) {
    return _then(_$PlaneImpl(
      planeId: freezed == planeId
          ? _value.planeId
          : planeId // ignore: cast_nullable_to_non_nullable
              as int?,
      planeName: null == planeName
          ? _value.planeName
          : planeName // ignore: cast_nullable_to_non_nullable
              as String,
      planeNumber: null == planeNumber
          ? _value.planeNumber
          : planeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      planeType: null == planeType
          ? _value.planeType
          : planeType // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeat: null == totalSeat
          ? _value.totalSeat
          : totalSeat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaneImpl implements _Plane {
  _$PlaneImpl(
      {this.planeId,
      required this.planeName,
      required this.planeNumber,
      required this.planeType,
      required this.totalSeat});

  factory _$PlaneImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaneImplFromJson(json);

  @override
  int? planeId;
  @override
  String planeName;
  @override
  String planeNumber;
  @override
  String planeType;
  @override
  int totalSeat;

  @override
  String toString() {
    return 'Plane(planeId: $planeId, planeName: $planeName, planeNumber: $planeNumber, planeType: $planeType, totalSeat: $totalSeat)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaneImplCopyWith<_$PlaneImpl> get copyWith =>
      __$$PlaneImplCopyWithImpl<_$PlaneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaneImplToJson(
      this,
    );
  }
}

abstract class _Plane implements Plane {
  factory _Plane(
      {int? planeId,
      required String planeName,
      required String planeNumber,
      required String planeType,
      required int totalSeat}) = _$PlaneImpl;

  factory _Plane.fromJson(Map<String, dynamic> json) = _$PlaneImpl.fromJson;

  @override
  int? get planeId;
  set planeId(int? value);
  @override
  String get planeName;
  set planeName(String value);
  @override
  String get planeNumber;
  set planeNumber(String value);
  @override
  String get planeType;
  set planeType(String value);
  @override
  int get totalSeat;
  set totalSeat(int value);
  @override
  @JsonKey(ignore: true)
  _$$PlaneImplCopyWith<_$PlaneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
