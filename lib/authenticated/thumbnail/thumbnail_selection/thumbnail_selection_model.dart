import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'thumbnail_selection_widget.dart' show ThumbnailSelectionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThumbnailSelectionModel
    extends FlutterFlowModel<ThumbnailSelectionWidget> {
  ///  Local state fields for this page.

  ThumbnailCategoryStruct? thumbnails;
  void updateThumbnailsStruct(Function(ThumbnailCategoryStruct) updateFn) =>
      updateFn(thumbnails ??= ThumbnailCategoryStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (thumbnailCategoryById)] action in ThumbnailSelection widget.
  ApiCallResponse? apiThumbnails;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
