import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'admin_blog_widget.dart' show AdminBlogWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminBlogModel extends FlutterFlowModel<AdminBlogWidget> {
  ///  Local state fields for this page.

  KindStruct? kindLocal;
  void updateKindLocalStruct(Function(KindStruct) updateFn) =>
      updateFn(kindLocal ??= KindStruct());

  List<BlogStruct> blogs = [];
  void addToBlogs(BlogStruct item) => blogs.add(item);
  void removeFromBlogs(BlogStruct item) => blogs.remove(item);
  void removeAtIndexFromBlogs(int index) => blogs.removeAt(index);
  void insertAtIndexInBlogs(int index, BlogStruct item) =>
      blogs.insert(index, item);
  void updateBlogsAtIndex(int index, Function(BlogStruct) updateFn) =>
      blogs[index] = updateFn(blogs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  Future fetchBlogs(BuildContext context) async {
    ApiCallResponse? apiBlogs;

    apiBlogs = await FoodexpirationGroup.blogAllCall.call(
      deviceid: FFAppState().deviceId,
    );
    if ((apiBlogs?.succeeded ?? true)) {
      return;
    }
  }

  /// Additional helper methods are added here.
}
