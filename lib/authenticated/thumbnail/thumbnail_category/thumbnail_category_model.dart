import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'thumbnail_category_widget.dart' show ThumbnailCategoryWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class ThumbnailCategoryModel extends FlutterFlowModel<ThumbnailCategoryWidget> {
  ///  Local state fields for this page.

  List<ThumbnailCategoryStruct> categorys = [];
  void addToCategorys(ThumbnailCategoryStruct item) => categorys.add(item);
  void removeFromCategorys(ThumbnailCategoryStruct item) =>
      categorys.remove(item);
  void removeAtIndexFromCategorys(int index) => categorys.removeAt(index);
  void insertAtIndexInCategorys(int index, ThumbnailCategoryStruct item) =>
      categorys.insert(index, item);
  void updateCategorysAtIndex(
          int index, Function(ThumbnailCategoryStruct) updateFn) =>
      categorys[index] = updateFn(categorys[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (thumbnailCategory)] action in ThumbnailCategory widget.
  ApiCallResponse? apiCategory;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
