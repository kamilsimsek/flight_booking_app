// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_route_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlightRoute _$FlightRouteFromJson(Map<String, dynamic> json) {
  return _FlightRoute.fromJson(json);
}

/// @nodoc
mixin _$FlightRoute {
  int? get routeId => throw _privateConstructorUsedError;
  set routeId(int? value) => throw _privateConstructorUsedError;
  String get routeName => throw _privateConstructorUsedError;
  set routeName(String value) => throw _privateConstructorUsedError;
  String get cityFrom => throw _privateConstructorUsedError;
  set cityFrom(String value) => throw _privateConstructorUsedError;
  String get cityTo => throw _privateConstructorUsedError;
  set cityTo(String value) => throw _privateConstructorUsedError;
  double get distanceInKm => throw _privateConstructorUsedError;
  set distanceInKm(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightRouteCopyWith<FlightRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightRouteCopyWith<$Res> {
  factory $FlightRouteCopyWith(
          FlightRoute value, $Res Function(FlightRoute) then) =
      _$FlightRouteCopyWithImpl<$Res, FlightRoute>;
  @useResult
  $Res call(
      {int? routeId,
      String routeName,
      String cityFrom,
      String cityTo,
      double distanceInKm});
}

/// @nodoc
class _$FlightRouteCopyWithImpl<$Res, $Val extends FlightRoute>
    implements $FlightRouteCopyWith<$Res> {
  _$FlightRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = freezed,
    Object? routeName = null,
    Object? cityFrom = null,
    Object? cityTo = null,
    Object? distanceInKm = null,
  }) {
    return _then(_value.copyWith(
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int?,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      cityFrom: null == cityFrom
          ? _value.cityFrom
          : cityFrom // ignore: cast_nullable_to_non_nullable
              as String,
      cityTo: null == cityTo
          ? _value.cityTo
          : cityTo // ignore: cast_nullable_to_non_nullable
              as String,
      distanceInKm: null == distanceInKm
          ? _value.distanceInKm
          : distanceInKm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightRouteImplCopyWith<$Res>
    implements $FlightRouteCopyWith<$Res> {
  factory _$$FlightRouteImplCopyWith(
          _$FlightRouteImpl value, $Res Function(_$FlightRouteImpl) then) =
      __$$FlightRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? routeId,
      String routeName,
      String cityFrom,
      String cityTo,
      double distanceInKm});
}

/// @nodoc
class __$$FlightRouteImplCopyWithImpl<$Res>
    extends _$FlightRouteCopyWithImpl<$Res, _$FlightRouteImpl>
    implements _$$FlightRouteImplCopyWith<$Res> {
  __$$FlightRouteImplCopyWithImpl(
      _$FlightRouteImpl _value, $Res Function(_$FlightRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = freezed,
    Object? routeName = null,
    Object? cityFrom = null,
    Object? cityTo = null,
    Object? distanceInKm = null,
  }) {
    return _then(_$FlightRouteImpl(
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int?,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      cityFrom: null == cityFrom
          ? _value.cityFrom
          : cityFrom // ignore: cast_nullable_to_non_nullable
              as String,
      cityTo: null == cityTo
          ? _value.cityTo
          : cityTo // ignore: cast_nullable_to_non_nullable
              as String,
      distanceInKm: null == distanceInKm
          ? _value.distanceInKm
          : distanceInKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightRouteImpl implements _FlightRoute {
  _$FlightRouteImpl(
      {this.routeId,
      required this.routeName,
      required this.cityFrom,
      required this.cityTo,
      required this.distanceInKm});

  factory _$FlightRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightRouteImplFromJson(json);

  @override
  int? routeId;
  @override
  String routeName;
  @override
  String cityFrom;
  @override
  String cityTo;
  @override
  double distanceInKm;

  @override
  String toString() {
    return 'FlightRoute(routeId: $routeId, routeName: $routeName, cityFrom: $cityFrom, cityTo: $cityTo, distanceInKm: $distanceInKm)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightRouteImplCopyWith<_$FlightRouteImpl> get copyWith =>
      __$$FlightRouteImplCopyWithImpl<_$FlightRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightRouteImplToJson(
      this,
    );
  }
}

abstract class _FlightRoute implements FlightRoute {
  factory _FlightRoute(
      {int? routeId,
      required String routeName,
      required String cityFrom,
      required String cityTo,
      required double distanceInKm}) = _$FlightRouteImpl;

  factory _FlightRoute.fromJson(Map<String, dynamic> json) =
      _$FlightRouteImpl.fromJson;

  @override
  int? get routeId;
  set routeId(int? value);
  @override
  String get routeName;
  set routeName(String value);
  @override
  String get cityFrom;
  set cityFrom(String value);
  @override
  String get cityTo;
  set cityTo(String value);
  @override
  double get distanceInKm;
  set distanceInKm(double value);
  @override
  @JsonKey(ignore: true)
  _$$FlightRouteImplCopyWith<_$FlightRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
