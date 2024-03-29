import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/blog_card/blog_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_widget.dart' show HomeWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<BlogStruct> blogList = [];
  void addToBlogList(BlogStruct item) => blogList.add(item);
  void removeFromBlogList(BlogStruct item) => blogList.remove(item);
  void removeAtIndexFromBlogList(int index) => blogList.removeAt(index);
  void insertAtIndexInBlogList(int index, BlogStruct item) =>
      blogList.insert(index, item);
  void updateBlogListAtIndex(int index, Function(BlogStruct) updateFn) =>
      blogList[index] = updateFn(blogList[index]);

  String bannerImage =
      'https://th-bkk-1.xvercloud.com/food-expiration/images/banner-onlygf.png';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getBanner)] action in Home widget.
  ApiCallResponse? apiBanner;
  // Stores action output result for [Backend Call - API (blogRecommend)] action in Home widget.
  ApiCallResponse? apiBlogRecommendOutput;
  // Stores action output result for [Custom Action - toBlogStructList] action in Home widget.
  List<BlogStruct>? bloglist;
  // Models for BlogCard dynamic component.
  late FlutterFlowDynamicModels<BlogCardModel> blogCardModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    blogCardModels = FlutterFlowDynamicModels(() => BlogCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    blogCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
