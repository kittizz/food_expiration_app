import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/blog_card/blog_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<BlogStruct> pageBlogList = [];
  void addToPageBlogList(BlogStruct item) => pageBlogList.add(item);
  void removeFromPageBlogList(BlogStruct item) => pageBlogList.remove(item);
  void removeAtIndexFromPageBlogList(int index) => pageBlogList.removeAt(index);
  void updatePageBlogListAtIndex(int index, Function(BlogStruct) updateFn) =>
      pageBlogList[index] = updateFn(pageBlogList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (blogAll)] action in Blog widget.
  ApiCallResponse? apiResultuzq;
  // Stores action output result for [Custom Action - toBlogStructList] action in Blog widget.
  List<BlogStruct>? blogList;
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
