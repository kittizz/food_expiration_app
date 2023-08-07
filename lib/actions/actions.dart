import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future registerDevice(BuildContext context) async {
  ApiCallResponse? apiResultou6;

  apiResultou6 = await FoodexpirationGroup.registerDeviceCall.call(
    authToken: currentJwtToken,
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
