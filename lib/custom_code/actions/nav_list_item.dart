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

import '/flutter_flow/nav/serialization_util.dart' as nav_serialization;

Future navListItem(BuildContext context) async {
  context.pushNamed(
    'ItemList',
    queryParameters: {
      'isLocation': nav_serialization.serializeParam(
        false,
        ParamType.bool,
      ),
      'title': nav_serialization.serializeParam(
        'รายการทั้งหมด',
        ParamType.String,
      ),
      'locationId': nav_serialization.serializeParam(
        0,
        ParamType.int,
      ),
    }.withoutNulls,
  );
}
