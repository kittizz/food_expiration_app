import '/backend/schema/structs/index.dart';
import '/component/item/item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_items_widget.dart' show ListItemsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListItemsModel extends FlutterFlowModel<ListItemsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for Item dynamic component.
  late FlutterFlowDynamicModels<ItemModel> itemModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemModels = FlutterFlowDynamicModels(() => ItemModel());
  }

  void dispose() {
    itemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
