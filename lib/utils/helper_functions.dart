import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucak/utils/constants.dart';

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

String getFormattedDate(DateTime dt, {String pattern = 'dd/MM/yyyy'}) {
  return DateFormat(pattern).format(dt);
}

int getGrandTotal(int discount, int totalSeatBooked, int price, int fee) {
  final subTotal = totalSeatBooked * price;
  final priceAfterDiscount = subTotal - ((subTotal * discount) / 100);
  return (priceAfterDiscount + fee).toInt();
}

String? validateEmail({required String email}) {
  // ignore: unnecessary_null_comparison
  if (email == null) {
    return null;
  }
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  if (email.isEmpty) {
    return 'Email boş olamaz';
  } else if (!emailRegExp.hasMatch(email)) {
    return 'Lütfen doğru formatta e mail girin';
  }

  return null;
}

String? validatePassword({required String password}) {
  // ignore: unnecessary_null_comparison
  if (password == null) {
    return null;
  }
  if (password.isEmpty) {
    return 'Şifre boş olamaz';
  } else if (password.length < 6) {
    return 'Şifre en az 6 haneli olmalıdır';
  }

  return null;
}

String getFormattedTime(TimeOfDay tm, {String pattern = 'HH:mm'}) {
  return DateFormat(pattern).format(DateTime(0, 0, 0, tm.hour, tm.minute));
}

Future<bool> saveToken(String token) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setString(accessToken, token);
}

Future<String> getToken() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString(accessToken) ?? "";
}

Future<int> getLoginTime() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(loginTime) ?? 0;
}

Future<bool> saveLoginTime(int time) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(loginTime, time);
}

Future<bool> saveExpirationDuration(int duration) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(expirationDuration, duration);
}

Future<int> getExpirationDuration(int duration) async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(expirationDuration) ?? 0;
}

Future<bool> hasTokenExpired() async {
  final loginTime = await getLoginTime();
  final expDuration = await getExpirationDuration(Duration.millisecondsPerHour);
  return DateTime.now().microsecondsSinceEpoch - loginTime > expDuration;
}
