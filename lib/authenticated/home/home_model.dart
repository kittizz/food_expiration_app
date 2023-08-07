import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/blog_card/blog_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getUser)] action in Home widget.
  ApiCallResponse? apiResulturm;
  // Model for BlogCard component.
  late BlogCardModel blogCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    blogCardModel = createModel(context, () => BlogCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    blogCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
