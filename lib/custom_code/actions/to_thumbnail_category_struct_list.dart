// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ThumbnailCategoryStruct>> toThumbnailCategoryStructList(
    dynamic jsonArray) async {
  List<ThumbnailCategoryStruct> listOfStruct = [];
  for (var item in jsonArray) {
    listOfStruct.add(ThumbnailCategoryStruct.fromMap(item));
  }
  return listOfStruct;
}
