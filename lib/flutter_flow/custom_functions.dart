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
import '/backend/schema/structs/index.dart';
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

String getImage(String path) {
  return "https://th-bkk-1.xvercloud.com/food-expiration/" + path;
}

List<ThumbnailCategoryStruct> toThumbnailCategoryStructList(dynamic jsonbody) {
  List<ThumbnailCategoryStruct> listOfStruct = [];
  if (jsonbody.length == 0) {
    return listOfStruct;
  }
  for (var v in jsonbody) {
    ThumbnailCategoryStruct thumCate = new ThumbnailCategoryStruct(
        id: v['id'] as int,
        name: v['name'] as String,
        image: ImageStruct(
          id: v['image']['id'] as int,
          path: v['image']['path'] as String,
          blurHash: v['image']['blurHash'] as String,
        ));
    List<ThumbnailStruct> thumbnails = [];
    if (v['thumbnails'] != null) {
      for (var thumb in v['thumbnails']) {
        ThumbnailStruct thumbnail = new ThumbnailStruct(
            id: thumb['id'] as int,
            name: thumb['name'] as String,
            thumbnailCategoryId: thumb['thumbnailCategoryId'] as int,
            image: ImageStruct(
              id: thumb['image']['id'] as int,
              path: thumb['image']['path'] as String,
              blurHash: thumb['image']['blurHash'] as String,
            ));
        thumbnails.add(thumbnail);
      }
    }
    thumCate.thumbnails = thumbnails;
    listOfStruct.add(thumCate);
  }
  return listOfStruct;
}

ThumbnailCategoryStruct toThumbnailCategoryStruct(dynamic jsonbody) {
  ThumbnailCategoryStruct val = new ThumbnailCategoryStruct();
  if (jsonbody.length == 0) {
    return val;
  }
  var v = jsonbody;
  ThumbnailCategoryStruct thumCate = new ThumbnailCategoryStruct(
      id: v['id'] as int,
      name: v['name'] as String,
      image: ImageStruct(
        id: v['image']['id'] as int,
        path: v['image']['path'] as String,
        blurHash: v['image']['blurHash'] as String,
      ));
  List<ThumbnailStruct> thumbnails = [];
  if (v['thumbnails'].length > 0) {
    for (var thumb in v['thumbnails']) {
      ThumbnailStruct thumbnail = new ThumbnailStruct(
          id: thumb['id'] as int,
          name: thumb['name'] as String,
          thumbnailCategoryId: thumb['thumbnailCategoryId'] as int,
          image: ImageStruct(
            id: thumb['image']['id'] as int,
            path: thumb['image']['path'] as String,
            blurHash: thumb['image']['blurHash'] as String,
          ));
      thumbnails.add(thumbnail);
    }
  }
  thumCate.thumbnails = thumbnails;
  return thumCate;
}

List<LocationStruct> toLocationStructList(dynamic jsonBody) {
  List<LocationStruct> listOfStruct = [];
  if (jsonBody.length == 0) {
    return listOfStruct;
  }
  for (var v in jsonBody) {
    LocationStruct item = new LocationStruct(
        id: v['id'] as int,
        name: v['name'] as String,
        description: v['description'] as String,
        image: ImageStruct(
          id: v['image']['id'] as int,
          path: v['image']['path'] as String,
          blurHash: v['image']['blurHash'] as String,
        ));

    listOfStruct.add(item);
  }
  return listOfStruct;
}
