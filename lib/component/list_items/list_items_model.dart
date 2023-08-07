import '/component/item/item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListItemsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for Item component.
  late ItemModel itemModel1;
  // Model for Item component.
  late ItemModel itemModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemModel1 = createModel(context, () => ItemModel());
    itemModel2 = createModel(context, () => ItemModel());
  }

  void dispose() {
    itemModel1.dispose();
    itemModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
