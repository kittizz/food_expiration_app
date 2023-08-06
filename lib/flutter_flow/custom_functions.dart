import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String getFormattedDate(DateTime date) {
  final today = DateTime.now();
  final difference = date.difference(today).inDays;

  DateFormat formatter;
  try {
    formatter = DateFormat('d MMMM', 'th');
  } catch (e) {
    formatter = DateFormat('d MMMM');
  }
  final dateString = formatter.format(date);

  String result = "";
  if (difference < 0) {
    result = '$dateString · ${difference.abs()} วันที่แล้ว';
  } else if (difference > 0) {
    result = '$dateString · ในอีก $difference วัน';
  } else {
    result = '$dateString · วันนี้';
  }

  return result;
}

String getDateStatus(
  DateTime date,
  int preDay,
) {
  final today = DateTime.now();
  final difference = date.difference(today).inDays;

  String result = "";
  if (difference < 0) {
    result = 'expired';
  } else if (difference <= preDay) {
    result = 'about_to_expire';
  } else {
    result = 'ok';
  }

  return result;
}
