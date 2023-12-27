// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlightReservation _$FlightReservationFromJson(Map<String, dynamic> json) {
  return _FlightReservation.fromJson(json);
}

/// @nodoc
mixin _$FlightReservation {
  int? get reservationId => throw _privateConstructorUsedError;
  set reservationId(int? value) => throw _privateConstructorUsedError;
  FlightSchedule get flightSchedule => throw _privateConstructorUsedError;
  set flightSchedule(FlightSchedule value) =>
      throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;
  set customer(Customer value) => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  set timestamp(int value) => throw _privateConstructorUsedError;
  String get departureDate => throw _privateConstructorUsedError;
  set departureDate(String value) => throw _privateConstructorUsedError;
  int get totalSeatBooked => throw _privateConstructorUsedError;
  set totalSeatBooked(int value) => throw _privateConstructorUsedError;
  String get seatNumbers => throw _privateConstructorUsedError;
  set seatNumbers(String value) => throw _privateConstructorUsedError;
  String get reservationStatus => throw _privateConstructorUsedError;
  set reservationStatus(String value) => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  set totalPrice(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightReservationCopyWith<FlightReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightReservationCopyWith<$Res> {
  factory $FlightReservationCopyWith(
          FlightReservation value, $Res Function(FlightReservation) then) =
      _$FlightReservationCopyWithImpl<$Res, FlightReservation>;
  @useResult
  $Res call(
      {int? reservationId,
      FlightSchedule flightSchedule,
      Customer customer,
      int timestamp,
      String departureDate,
      int totalSeatBooked,
      String seatNumbers,
      String reservationStatus,
      int totalPrice});

  $FlightScheduleCopyWith<$Res> get flightSchedule;
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$FlightReservationCopyWithImpl<$Res, $Val extends FlightReservation>
    implements $FlightReservationCopyWith<$Res> {
  _$FlightReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? flightSchedule = null,
    Object? customer = null,
    Object? timestamp = null,
    Object? departureDate = null,
    Object? totalSeatBooked = null,
    Object? seatNumbers = null,
    Object? reservationStatus = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      reservationId: freezed == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      flightSchedule: null == flightSchedule
          ? _value.flightSchedule
          : flightSchedule // ignore: cast_nullable_to_non_nullable
              as FlightSchedule,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      departureDate: null == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeatBooked: null == totalSeatBooked
          ? _value.totalSeatBooked
          : totalSeatBooked // ignore: cast_nullable_to_non_nullable
              as int,
      seatNumbers: null == seatNumbers
          ? _value.seatNumbers
          : seatNumbers // ignore: cast_nullable_to_non_nullable
              as String,
      reservationStatus: null == reservationStatus
          ? _value.reservationStatus
          : reservationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FlightScheduleCopyWith<$Res> get flightSchedule {
    return $FlightScheduleCopyWith<$Res>(_value.flightSchedule, (value) {
      return _then(_value.copyWith(flightSchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlightReservationImplCopyWith<$Res>
    implements $FlightReservationCopyWith<$Res> {
  factory _$$FlightReservationImplCopyWith(_$FlightReservationImpl value,
          $Res Function(_$FlightReservationImpl) then) =
      __$$FlightReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? reservationId,
      FlightSchedule flightSchedule,
      Customer customer,
      int timestamp,
      String departureDate,
      int totalSeatBooked,
      String seatNumbers,
      String reservationStatus,
      int totalPrice});

  @override
  $FlightScheduleCopyWith<$Res> get flightSchedule;
  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$FlightReservationImplCopyWithImpl<$Res>
    extends _$FlightReservationCopyWithImpl<$Res, _$FlightReservationImpl>
    implements _$$FlightReservationImplCopyWith<$Res> {
  __$$FlightReservationImplCopyWithImpl(_$FlightReservationImpl _value,
      $Res Function(_$FlightReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? flightSchedule = null,
    Object? customer = null,
    Object? timestamp = null,
    Object? departureDate = null,
    Object? totalSeatBooked = null,
    Object? seatNumbers = null,
    Object? reservationStatus = null,
    Object? totalPrice = null,
  }) {
    return _then(_$FlightReservationImpl(
      reservationId: freezed == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      flightSchedule: null == flightSchedule
          ? _value.flightSchedule
          : flightSchedule // ignore: cast_nullable_to_non_nullable
              as FlightSchedule,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      departureDate: null == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeatBooked: null == totalSeatBooked
          ? _value.totalSeatBooked
          : totalSeatBooked // ignore: cast_nullable_to_non_nullable
              as int,
      seatNumbers: null == seatNumbers
          ? _value.seatNumbers
          : seatNumbers // ignore: cast_nullable_to_non_nullable
              as String,
      reservationStatus: null == reservationStatus
          ? _value.reservationStatus
          : reservationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightReservationImpl implements _FlightReservation {
  _$FlightReservationImpl(
      {this.reservationId,
      required this.flightSchedule,
      required this.customer,
      required this.timestamp,
      required this.departureDate,
      required this.totalSeatBooked,
      required this.seatNumbers,
      required this.reservationStatus,
      required this.totalPrice});

  factory _$FlightReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightReservationImplFromJson(json);

  @override
  int? reservationId;
  @override
  FlightSchedule flightSchedule;
  @override
  Customer customer;
  @override
  int timestamp;
  @override
  String departureDate;
  @override
  int totalSeatBooked;
  @override
  String seatNumbers;
  @override
  String reservationStatus;
  @override
  int totalPrice;

  @override
  String toString() {
    return 'FlightReservation(reservationId: $reservationId, flightSchedule: $flightSchedule, customer: $customer, timestamp: $timestamp, departureDate: $departureDate, totalSeatBooked: $totalSeatBooked, seatNumbers: $seatNumbers, reservationStatus: $reservationStatus, totalPrice: $totalPrice)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightReservationImplCopyWith<_$FlightReservationImpl> get copyWith =>
      __$$FlightReservationImplCopyWithImpl<_$FlightReservationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightReservationImplToJson(
      this,
    );
  }
}

abstract class _FlightReservation implements FlightReservation {
  factory _FlightReservation(
      {int? reservationId,
      required FlightSchedule flightSchedule,
      required Customer customer,
      required int timestamp,
      required String departureDate,
      required int totalSeatBooked,
      required String seatNumbers,
      required String reservationStatus,
      required int totalPrice}) = _$FlightReservationImpl;

  factory _FlightReservation.fromJson(Map<String, dynamic> json) =
      _$FlightReservationImpl.fromJson;

  @override
  int? get reservationId;
  set reservationId(int? value);
  @override
  FlightSchedule get flightSchedule;
  set flightSchedule(FlightSchedule value);
  @override
  Customer get customer;
  set customer(Customer value);
  @override
  int get timestamp;
  set timestamp(int value);
  @override
  String get departureDate;
  set departureDate(String value);
  @override
  int get totalSeatBooked;
  set totalSeatBooked(int value);
  @override
  String get seatNumbers;
  set seatNumbers(String value);
  @override
  String get reservationStatus;
  set reservationStatus(String value);
  @override
  int get totalPrice;
  set totalPrice(int value);
  @override
  @JsonKey(ignore: true)
  _$$FlightReservationImplCopyWith<_$FlightReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
