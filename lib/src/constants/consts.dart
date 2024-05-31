//default value
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suitess/theme/colors.dart';

const kDefaultPadding = 20.0;

const kSizedBox = SizedBox(height: kDefaultPadding);
const kWidthSizedBox = SizedBox(width: kDefaultPadding);

const kHalfSizedBox = SizedBox(height: kDefaultPadding / 2);

const kHalfWidthSizedBox = SizedBox(width: kDefaultPadding / 2);

defaultTextStyle({
  Color? color,
  Paint? background,
  Color? backgroundColor,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String? debugLabel,
  String? fontFamily,
  double? fontSize,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? letterSpacing,
}) =>
    TextStyle(
      color: color ?? kTextBlackColor,
      background: background,
      backgroundColor: backgroundColor,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily ?? "Poppins",
      fontSize: fontSize ?? 14.0,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: letterSpacing ?? .60,
    );

String nA = "N/A";

String nairaSign = '\u20A6';

//Hide Digits pattern
const String hideDigits = r'\d';

const String zipCodePattern = r"^\d{6}(?:-\d{4})?$";

//username pattern
const String namePattern = r'^.{3,}$'; //Min. of 3 characters

//password pattern
const String passwordPattern =
    r'^(?=.*[A-Za-z0-9])(?=.*[^A-Za-z0-9])(?=.*\d).{8,}$';

//referral Code pattern
const String referralCodePattern = r'^.{6}$';

//validation for mobile
// const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)'; //Must be integers
const String mobilePattern = r'^\+?[0-9]{1,3}?[0-9]{10}$'; //Must be integers

String phoneNumberPattern = r'^\(\d{3}\) \d{3}-\d{4}$';

const String nigerianPhoneMobilePattern =
    r'^(\+?234|0)?[789]\d{9}$'; //Must be integers

//validation for street address
const String streetAddressPattern = r'^\d+\s+[a-zA-Z0-9\s.-]+$';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

//===================== Mask Phone Number ==========================\\
String maskPhoneNumber(String phoneNumber) {
  // Ensure the phone number is at least 4 characters long
  if (phoneNumber.length < 4) {
    throw ArgumentError('Phone number must be at least 4 digits long');
  }

  // Get the last 4 digits of the phone number
  String lastFour = phoneNumber.substring(phoneNumber.length - 4);

  // Mask the remaining part of the phone number with asterisks
  String maskedPart = '*' * (phoneNumber.length - 4);

  // Combine the masked part with the last four digits
  return maskedPart + lastFour;
}

//===================== DateTime Formate ==========================\\

String formatDateAndTime(DateTime dateTime) {
  // Format the date as '23 Feb 2020'
  String formattedDate = DateFormat('dd MMM y').format(dateTime);

  // Format the time as '1:20PM'
  String formattedTime = DateFormat.jm().format(dateTime);

  // Combine the formatted date and time
  String formattedDateTime = '$formattedDate • $formattedTime';

  return formattedDateTime;
}

String format12HrTime(DateTime time) {
  // Format the time as '1:20PM'
  String formattedTime = DateFormat.jm().format(time);

  return formattedTime;
}

String formatDate(DateTime date) {
  // Format the date as '23 Feb 2020'
  String formattedDate = DateFormat('dd MMM y').format(date);

  return formattedDate;
}

String convertToDateString(String inputString) {
  return inputString.replaceFirst(RegExp(r"\T.*"), "");
}

// Create a unique Id using DateTime
int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(1);
}

String generateRandomReference({int length = 32}) {
  var random = Random.secure();
  var values = List<int>.generate(length, (i) => random.nextInt(256));
  var randomString = base64Url.encode(values);
  return randomString.substring(0, length);
}

//===================== Number format ==========================\\
String doubleFormattedText(double value) {
  final numberFormat = NumberFormat('#,##0');
  return numberFormat.format(value);
}

String doubleFormattedTextWithDecimal(double value) {
  final numberFormat = NumberFormat('#,##0.00');
  return numberFormat.format(value);
}

String intFormattedText(int value) {
  final numberFormat = NumberFormat('#,##0');
  return numberFormat.format(value);
}

String formatIntNumber(int num) {
  if (num >= 1000000000) {
    double numDouble = num / 1000000000.0;
    return '${numDouble.toStringAsFixed(numDouble.truncateToDouble() == numDouble ? 0 : 2)}B';
  } else if (num >= 1000000) {
    double numDouble = num / 1000000.0;
    return '${numDouble.toStringAsFixed(numDouble.truncateToDouble() == numDouble ? 0 : 2)}M';
  } else if (num >= 1000) {
    double numDouble = num / 1000.0;
    return '${numDouble.toStringAsFixed(numDouble.truncateToDouble() == numDouble ? 0 : 2)}K';
  } else {
    return num.toString();
  }
}

String formatDoubleNumber(double num) {
  if (num >= 1000000000) {
    double numDouble = num / 1000000000.0;
    return '${numDouble.toStringAsFixed(numDouble.truncateToDouble() == numDouble ? 0 : 2)}B';
  } else if (num >= 1000000) {
    double numDouble = num / 1000000.0;
    return '${numDouble.toStringAsFixed(numDouble.truncateToDouble() == numDouble ? 0 : 2)}M';
  } else if (num >= 1000) {
    double numDouble = num / 1000.0;
    return '${numDouble.toStringAsFixed(numDouble.truncateToDouble() == numDouble ? 0 : 2)}K';
  } else {
    return num.toString();
  }
}

convertToCurrency(String e) {
  String newStr = e.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[0]},");
  return newStr;
}

// Example function to format a number with thousands separators
String formatNumberWithCommas(int number) {
  // Create a NumberFormat instance for the current locale
  final NumberFormat formatter = NumberFormat("#,##0", "en_US");
  // Format the number with thousands separators
  return formatter.format(number);
}

List<int> generateRandomNumbers(int limit, int num) {
  Random random = Random();
  List<int> randomNumbers = [];

  for (int i = 0; i < limit; i++) {
    randomNumbers
        .add(random.nextInt(num)); // Generates random number between 0 and 20
  }

  return randomNumbers;
}

String shortenId(String id) {
  if (id.length <= 8) {
    return id;
  }
  final int mid = id.length ~/ 2;
  return '${id.substring(0, 4)}...${id.substring(mid + 1)}';
}
