import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/location/location_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'location_list_widget.dart' show LocationListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LocationListModel extends FlutterFlowModel<LocationListWidget> {
  ///  Local state fields for this page.

  List<LocationStruct> locationList = [];
  void addToLocationList(LocationStruct item) => locationList.add(item);
  void removeFromLocationList(LocationStruct item) => locationList.remove(item);
  void removeAtIndexFromLocationList(int index) => locationList.removeAt(index);
  void insertAtIndexInLocationList(int index, LocationStruct item) =>
      locationList.insert(index, item);
  void updateLocationListAtIndex(
          int index, Function(LocationStruct) updateFn) =>
      locationList[index] = updateFn(locationList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for location dynamic component.
  late FlutterFlowDynamicModels<LocationModel> locationModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    locationModels = FlutterFlowDynamicModels(() => LocationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    locationModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
