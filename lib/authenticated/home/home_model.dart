import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/component/blog_card/blog_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getUser)] action in Home widget.
  ApiCallResponse? apiResulturm;
  // Stores action output result for [Backend Call - API (blogRecommend)] action in Home widget.
  ApiCallResponse? apiBlogRecommendOutput;
  // Stores action output result for [Custom Action - toBlogStructList] action in Home widget.
  List<BlogStruct>? bloglist;
  // Models for BlogCard dynamic component.
  late FlutterFlowDynamicModels<BlogCardModel> blogCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    blogCardModels = FlutterFlowDynamicModels(() => BlogCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    blogCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
