import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LocationListModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<LocationStruct> locationList = [];
  void addToLocationList(LocationStruct item) => locationList.add(item);
  void removeFromLocationList(LocationStruct item) => locationList.remove(item);
  void removeAtIndexFromLocationList(int index) => locationList.removeAt(index);
  void updateLocationListAtIndex(
          int index, Function(LocationStruct) updateFn) =>
      locationList[index] = updateFn(locationList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future<List<LocationStruct>?> loadLocations(BuildContext context) async {
    ApiCallResponse? apiResultkca;
    List<LocationStruct>? listOutput;

    apiResultkca = await FoodexpirationGroup.locationListCall.call(
      deviceId: FFAppState().deviceId,
    );
    if ((apiResultkca?.succeeded ?? true)) {
      listOutput = await actions.toLocationStructList(
        (apiResultkca?.jsonBody ?? ''),
      );
      locationList = listOutput!.toList().cast<LocationStruct>();
    } else {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('เกิดข้อผิดพลาด'),
            content: Text(FoodexpirationGroup.locationListCall
                .message(
                  (apiResultkca?.jsonBody ?? ''),
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

    return null;
  }

  /// Additional helper methods are added here.
}
