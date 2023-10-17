import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future registerDevice(
  BuildContext context, {
  String? nickname,
}) async {
  ApiCallResponse? apiResultou6;

  apiResultou6 = await FoodexpirationGroup.registerDeviceCall.call(
    authToken: currentJwtToken,
    nickname: nickname,
  );
  if ((apiResultou6?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().deviceId = FoodexpirationGroup.registerDeviceCall
          .deviceId(
            (apiResultou6?.jsonBody ?? ''),
          )
          .toString()
          .toString();
    });
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('ข้อผิดพลาด'),
          content: Text(FoodexpirationGroup.registerDeviceCall
              .message(
                (apiResultou6?.jsonBody ?? ''),
              )
              .toString()
              .toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('ตกลง'),
            ),
          ],
        );
      },
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'ยินดีต้อนรับกลับ',
        style: FlutterFlowTheme.of(context).bodyLarge,
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).success,
    ),
  );
}

Future<bool?> fetchUser(BuildContext context) async {
  ApiCallResponse? apiResultgetUser;
  UserStruct? userStruct;

  apiResultgetUser = await FoodexpirationGroup.getUserCall.call(
    deviceid: FFAppState().deviceId,
  );
  if ((apiResultgetUser?.succeeded ?? true)) {
    userStruct = await actions.toUserStruct(
      (apiResultgetUser?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().user = userStruct!;
    });
    return true;
  } else {
    return false;
  }
}

Future fetchLocations(BuildContext context) async {
  ApiCallResponse? apiLocList;

  apiLocList = await FoodexpirationGroup.locationListCall.call(
    deviceid: FFAppState().deviceId,
  );
  if ((apiLocList?.succeeded ?? true)) {
    FFAppState().locations = functions
        .toLocationStructList((apiLocList?.jsonBody ?? ''))
        .toList()
        .cast<LocationStruct>();
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('เกิดข้อผิดพลาด'),
          content: Text(FoodexpirationGroup.locationListCall
              .message(
                (apiLocList?.jsonBody ?? ''),
              )
              .toString()
              .toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }
}

Future<bool> fetchLocationInfo(
  BuildContext context, {
  required int? id,
}) async {
  ApiCallResponse? apiLocation;

  apiLocation = await FoodexpirationGroup.getLocationByIdCall.call(
    id: id,
    items: false,
    deviceid: FFAppState().deviceId,
  );
  if ((apiLocation?.succeeded ?? true)) {
    FFAppState().updatePageLocationInfoStruct(
      (e) => e
        ..name = functions.toLocationStruct((apiLocation?.jsonBody ?? '')).name
        ..description = functions
            .toLocationStruct((apiLocation?.jsonBody ?? ''))
            .description
        ..locationId =
            functions.toLocationStruct((apiLocation?.jsonBody ?? '')).id
        ..imageId =
            functions.toLocationStruct((apiLocation?.jsonBody ?? '')).image.id
        ..image =
            functions.toLocationStruct((apiLocation?.jsonBody ?? '')).image.path
        ..imageBlurhash = functions
            .toLocationStruct((apiLocation?.jsonBody ?? ''))
            .image
            .blurHash
        ..isAdd = false,
    );
    return true;
  } else {
    return false;
  }
}

Future openAddItem(BuildContext context) async {
  FFAppState().update(() {
    FFAppState().updatePageItemInfoStruct(
      (e) => e
        ..storageDate = getCurrentTimestamp
        ..expireDate = functions.addDate(getCurrentTimestamp, 1),
    );
  });

  context.pushNamed(
    'ItemInfo',
    queryParameters: {
      'name': serializeParam(
        'เพิ่มรายการ',
        ParamType.String,
      ),
      'isAdd': serializeParam(
        true,
        ParamType.bool,
      ),
    }.withoutNulls,
  );
}
