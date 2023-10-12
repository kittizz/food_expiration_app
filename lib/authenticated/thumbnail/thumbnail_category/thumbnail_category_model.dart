import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'thumbnail_category_widget.dart' show ThumbnailCategoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThumbnailCategoryModel extends FlutterFlowModel<ThumbnailCategoryWidget> {
  ///  Local state fields for this page.

  List<ThumbnailCategoryStruct> category = [];
  void addToCategory(ThumbnailCategoryStruct item) => category.add(item);
  void removeFromCategory(ThumbnailCategoryStruct item) =>
      category.remove(item);
  void removeAtIndexFromCategory(int index) => category.removeAt(index);
  void insertAtIndexInCategory(int index, ThumbnailCategoryStruct item) =>
      category.insert(index, item);
  void updateCategoryAtIndex(
          int index, Function(ThumbnailCategoryStruct) updateFn) =>
      category[index] = updateFn(category[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (thumbnailCategory)] action in ThumbnailCategory widget.
  ApiCallResponse? apiCategory;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
