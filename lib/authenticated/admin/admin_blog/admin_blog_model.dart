import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/modal_admin_edit_image/modal_admin_edit_image_widget.dart';
import '/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_blog_widget.dart' show AdminBlogWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdminBlogModel extends FlutterFlowModel<AdminBlogWidget> {
  ///  Local state fields for this page.

  List<BlogStruct> blogs = [];
  void addToBlogs(BlogStruct item) => blogs.add(item);
  void removeFromBlogs(BlogStruct item) => blogs.remove(item);
  void removeAtIndexFromBlogs(int index) => blogs.removeAt(index);
  void insertAtIndexInBlogs(int index, BlogStruct item) =>
      blogs.insert(index, item);
  void updateBlogsAtIndex(int index, Function(BlogStruct) updateFn) =>
      blogs[index] = updateFn(blogs[index]);

  BlogStruct? selectedBlog;
  void updateSelectedBlogStruct(Function(BlogStruct) updateFn) =>
      updateFn(selectedBlog ??= BlogStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (adminUpdateBlog)] action in Row widget.
  ApiCallResponse? apiUpNCreBlog;
  // Stores action output result for [Bottom Sheet - ModalAdminEditImage] action in Row widget.
  ImageStruct? editImage;
  // Stores action output result for [Backend Call - API (adminDeleteBlog)] action in Row widget.
  ApiCallResponse? apiDeleteBlog;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadImage)] action in Row widget.
  ApiCallResponse? apiUloadImage;
  // State field(s) for ImageLink widget.
  FocusNode? imageLinkFocusNode;
  TextEditingController? imageLinkController;
  String? Function(BuildContext, String?)? imageLinkControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    imageLinkFocusNode?.dispose();
    imageLinkController?.dispose();
  }

  /// Action blocks are added here.

  Future fetchBlogs(BuildContext context) async {
    ApiCallResponse? apiBlogs;

    apiBlogs = await FoodexpirationGroup.blogAllCall.call(
      deviceid: FFAppState().deviceId,
    );
    if ((apiBlogs?.succeeded ?? true)) {
      blogs = functions
          .toBlogList((apiBlogs?.jsonBody ?? ''))
          .toList()
          .cast<BlogStruct>();
    }
  }

  /// Additional helper methods are added here.
}
