import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
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
          title: Text('Error'),
          content: Text(FoodexpirationGroup.registerDeviceCall
              .message(
                (apiResultou6?.jsonBody ?? ''),
              )
              .toString()
              .toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('OK'),
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
        'Welcome back',
        style: FlutterFlowTheme.of(context).bodyLarge,
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).success,
    ),
  );
}

Future<bool?> fetchUser(BuildContext context) async {
  UserStruct? userStruct;
  ApiCallResponse? apiResultgetUser;

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

  apiResultgetUser = await FoodexpirationGroup.getUserCall.call(
    deviceid: FFAppState().deviceId,
  );
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

Future openAddItem(
  BuildContext context, {
  required bool? replace,
}) async {
  FFAppState().update(() {
    FFAppState().updatePageItemInfoStruct(
      (e) => e
        ..storageDate = getCurrentTimestamp
        ..expireDate = functions.addDate(getCurrentTimestamp, 1)
        ..name = null
        ..description = null
        ..forewarnDay = 3
        ..category = null
        ..barcode = null
        ..location = null
        ..unit = 'ชิ้น'
        ..quantity = 1,
    );
    FFAppState().thumbnail =
        ThumbnailStruct.fromSerializableMap(jsonDecode('{\"image\":\"{}\"}'));
  });
  if (replace!) {
    if (Navigator.of(context).canPop()) {
      context.pop();
    }
    context.pushNamed(
      'ItemInfo',
      queryParameters: {
        'name': serializeParam(
          'Add item',
          ParamType.String,
        ),
        'isAdd': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  } else {
    context.pushNamed(
      'ItemInfo',
      queryParameters: {
        'name': serializeParam(
          'Add item',
          ParamType.String,
        ),
        'isAdd': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  }
}

Future fetchCategory(BuildContext context) async {
  ApiCallResponse? apiCategory;

  apiCategory = await FoodexpirationGroup.categoryCall.call(
    deviceid: FFAppState().deviceId,
  );
  if ((apiCategory?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().categorys =
          (apiCategory?.jsonBody ?? '').toList().cast<String>();
    });
  }
}

Future fetchItems(
  BuildContext context, {
  required bool? archive,
  required int? locationId,
}) async {
  ApiCallResponse? apiLocationItem;

  apiLocationItem = await FoodexpirationGroup.locationsItemCall.call(
    isArchived: archive,
    id: locationId,
    deviceid: FFAppState().deviceId,
  );
  if ((apiLocationItem?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().items = functions
          .toItemList((apiLocationItem?.jsonBody ?? ''))
          .toList()
          .cast<ItemStruct>();
    });
  }
}

Future fetchItemInfo(
  BuildContext context, {
  required int? id,
}) async {
  ApiCallResponse? apiItem;

  apiItem = await FoodexpirationGroup.getItemCall.call(
    id: id,
    deviceid: FFAppState().deviceId,
  );
  if ((apiItem?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updatePageItemInfoStruct(
        (e) => e
          ..name = functions.toItem((apiItem?.jsonBody ?? '')).name
          ..description =
              functions.toItem((apiItem?.jsonBody ?? '')).description
          ..forewarnDay =
              functions.toItem((apiItem?.jsonBody ?? '')).forewarnDay
          ..category = functions.toItem((apiItem?.jsonBody ?? '')).category
          ..location = FFAppState()
              .locations
              .where((e) =>
                  e.id ==
                  functions.toItem((apiItem?.jsonBody ?? '')).locationId)
              .toList()
              .first
          ..barcode = functions.toItem((apiItem?.jsonBody ?? '')).barcode
          ..storageDate =
              functions.toItem((apiItem?.jsonBody ?? '')).storageDate
          ..expireDate = functions.toItem((apiItem?.jsonBody ?? '')).expireDate
          ..quantity = functions.toItem((apiItem?.jsonBody ?? '')).quantity
          ..unit = functions.toItem((apiItem?.jsonBody ?? '')).unit
          ..isArchived = functions.toItem((apiItem?.jsonBody ?? '')).isArchived,
      );
      FFAppState().updateThumbnailStruct(
        (e) => e..image = functions.toItem((apiItem?.jsonBody ?? '')).image,
      );
    });
  }
}

Future saveSettings(
  BuildContext context, {
  required bool? notification,
  required DateTime? notificationAt,
}) async {
  ApiCallResponse? apiResultrwc;

  apiResultrwc = await FoodexpirationGroup.updateSettingsCall.call(
    deviceid: FFAppState().deviceId,
    notification: notification,
    notificationAt: functions.toRFC3339(notificationAt!, false),
  );
  await action_blocks.fetchUser(context);
}
