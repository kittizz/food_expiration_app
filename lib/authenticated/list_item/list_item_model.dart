import '/component/food_item/food_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListItemModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? testDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for FoodItem component.
  late FoodItemModel foodItemModel1;
  // Model for FoodItem component.
  late FoodItemModel foodItemModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    foodItemModel1 = createModel(context, () => FoodItemModel());
    foodItemModel2 = createModel(context, () => FoodItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    foodItemModel1.dispose();
    foodItemModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
