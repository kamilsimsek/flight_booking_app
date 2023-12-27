// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlightSchedule _$FlightScheduleFromJson(Map<String, dynamic> json) {
  return _FlightSchedule.fromJson(json);
}

/// @nodoc
mixin _$FlightSchedule {
  int? get scheduleId => throw _privateConstructorUsedError;
  set scheduleId(int? value) => throw _privateConstructorUsedError;
  Plane get plane => throw _privateConstructorUsedError;
  set plane(Plane value) => throw _privateConstructorUsedError;
  FlightRoute get flightRoute => throw _privateConstructorUsedError;
  set flightRoute(FlightRoute value) => throw _privateConstructorUsedError;
  String get departureTime => throw _privateConstructorUsedError;
  set departureTime(String value) => throw _privateConstructorUsedError;
  int get ticketPrice => throw _privateConstructorUsedError;
  set ticketPrice(int value) => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  set discount(int value) => throw _privateConstructorUsedError;
  int get processingFee => throw _privateConstructorUsedError;
  set processingFee(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightScheduleCopyWith<FlightSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightScheduleCopyWith<$Res> {
  factory $FlightScheduleCopyWith(
          FlightSchedule value, $Res Function(FlightSchedule) then) =
      _$FlightScheduleCopyWithImpl<$Res, FlightSchedule>;
  @useResult
  $Res call(
      {int? scheduleId,
      Plane plane,
      FlightRoute flightRoute,
      String departureTime,
      int ticketPrice,
      int discount,
      int processingFee});

  $PlaneCopyWith<$Res> get plane;
  $FlightRouteCopyWith<$Res> get flightRoute;
}

/// @nodoc
class _$FlightScheduleCopyWithImpl<$Res, $Val extends FlightSchedule>
    implements $FlightScheduleCopyWith<$Res> {
  _$FlightScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? plane = null,
    Object? flightRoute = null,
    Object? departureTime = null,
    Object? ticketPrice = null,
    Object? discount = null,
    Object? processingFee = null,
  }) {
    return _then(_value.copyWith(
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      plane: null == plane
          ? _value.plane
          : plane // ignore: cast_nullable_to_non_nullable
              as Plane,
      flightRoute: null == flightRoute
          ? _value.flightRoute
          : flightRoute // ignore: cast_nullable_to_non_nullable
              as FlightRoute,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      processingFee: null == processingFee
          ? _value.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaneCopyWith<$Res> get plane {
    return $PlaneCopyWith<$Res>(_value.plane, (value) {
      return _then(_value.copyWith(plane: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FlightRouteCopyWith<$Res> get flightRoute {
    return $FlightRouteCopyWith<$Res>(_value.flightRoute, (value) {
      return _then(_value.copyWith(flightRoute: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlightScheduleImplCopyWith<$Res>
    implements $FlightScheduleCopyWith<$Res> {
  factory _$$FlightScheduleImplCopyWith(_$FlightScheduleImpl value,
          $Res Function(_$FlightScheduleImpl) then) =
      __$$FlightScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? scheduleId,
      Plane plane,
      FlightRoute flightRoute,
      String departureTime,
      int ticketPrice,
      int discount,
      int processingFee});

  @override
  $PlaneCopyWith<$Res> get plane;
  @override
  $FlightRouteCopyWith<$Res> get flightRoute;
}

/// @nodoc
class __$$FlightScheduleImplCopyWithImpl<$Res>
    extends _$FlightScheduleCopyWithImpl<$Res, _$FlightScheduleImpl>
    implements _$$FlightScheduleImplCopyWith<$Res> {
  __$$FlightScheduleImplCopyWithImpl(
      _$FlightScheduleImpl _value, $Res Function(_$FlightScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? plane = null,
    Object? flightRoute = null,
    Object? departureTime = null,
    Object? ticketPrice = null,
    Object? discount = null,
    Object? processingFee = null,
  }) {
    return _then(_$FlightScheduleImpl(
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      plane: null == plane
          ? _value.plane
          : plane // ignore: cast_nullable_to_non_nullable
              as Plane,
      flightRoute: null == flightRoute
          ? _value.flightRoute
          : flightRoute // ignore: cast_nullable_to_non_nullable
              as FlightRoute,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      processingFee: null == processingFee
          ? _value.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightScheduleImpl implements _FlightSchedule {
  _$FlightScheduleImpl(
      {this.scheduleId,
      required this.plane,
      required this.flightRoute,
      required this.departureTime,
      required this.ticketPrice,
      this.discount = 0,
      this.processingFee = 100});

  factory _$FlightScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightScheduleImplFromJson(json);

  @override
  int? scheduleId;
  @override
  Plane plane;
  @override
  FlightRoute flightRoute;
  @override
  String departureTime;
  @override
  int ticketPrice;
  @override
  @JsonKey()
  int discount;
  @override
  @JsonKey()
  int processingFee;

  @override
  String toString() {
    return 'FlightSchedule(scheduleId: $scheduleId, plane: $plane, flightRoute: $flightRoute, departureTime: $departureTime, ticketPrice: $ticketPrice, discount: $discount, processingFee: $processingFee)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightScheduleImplCopyWith<_$FlightScheduleImpl> get copyWith =>
      __$$FlightScheduleImplCopyWithImpl<_$FlightScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightScheduleImplToJson(
      this,
    );
  }
}

abstract class _FlightSchedule implements FlightSchedule {
  factory _FlightSchedule(
      {int? scheduleId,
      required Plane plane,
      required FlightRoute flightRoute,
      required String departureTime,
      required int ticketPrice,
      int discount,
      int processingFee}) = _$FlightScheduleImpl;

  factory _FlightSchedule.fromJson(Map<String, dynamic> json) =
      _$FlightScheduleImpl.fromJson;

  @override
  int? get scheduleId;
  set scheduleId(int? value);
  @override
  Plane get plane;
  set plane(Plane value);
  @override
  FlightRoute get flightRoute;
  set flightRoute(FlightRoute value);
  @override
  String get departureTime;
  set departureTime(String value);
  @override
  int get ticketPrice;
  set ticketPrice(int value);
  @override
  int get discount;
  set discount(int value);
  @override
  int get processingFee;
  set processingFee(int value);
  @override
  @JsonKey(ignore: true)
  _$$FlightScheduleImplCopyWith<_$FlightScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
