import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/modal_admin_add_image/modal_admin_add_image_widget.dart';
import '/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'admin_image_widget.dart' show AdminImageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminImageModel extends FlutterFlowModel<AdminImageWidget> {
  ///  Local state fields for this page.

  KindStruct? kindLocal;
  void updateKindLocalStruct(Function(KindStruct) updateFn) =>
      updateFn(kindLocal ??= KindStruct());

  List<ThumbnailCategoryStruct> thumbnailCategories = [];
  void addToThumbnailCategories(ThumbnailCategoryStruct item) =>
      thumbnailCategories.add(item);
  void removeFromThumbnailCategories(ThumbnailCategoryStruct item) =>
      thumbnailCategories.remove(item);
  void removeAtIndexFromThumbnailCategories(int index) =>
      thumbnailCategories.removeAt(index);
  void insertAtIndexInThumbnailCategories(
          int index, ThumbnailCategoryStruct item) =>
      thumbnailCategories.insert(index, item);
  void updateThumbnailCategoriesAtIndex(
          int index, Function(ThumbnailCategoryStruct) updateFn) =>
      thumbnailCategories[index] = updateFn(thumbnailCategories[index]);

  ThumbnailCategoryStruct? useThumbnailCategorie;
  void updateUseThumbnailCategorieStruct(
          Function(ThumbnailCategoryStruct) updateFn) =>
      updateFn(useThumbnailCategorie ??= ThumbnailCategoryStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Bottom Sheet - ModalAdminAddImage] action in Row widget.
  CreateImageStruct? modelAddImage;
  // Stores action output result for [Backend Call - API (adminThumbnailCreateCategory)] action in Row widget.
  ApiCallResponse? apiThumbnailCreateCategory;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  Future fetchThumbnailCategories(BuildContext context) async {
    ApiCallResponse? apiThumbnailCategories;

    apiThumbnailCategories =
        await FoodexpirationGroup.thumbnailCategoryCall.call(
      deviceid: FFAppState().deviceId,
    );
    if ((apiThumbnailCategories?.succeeded ?? true)) {
      thumbnailCategories = functions
          .toThumbnailCategoryStructList(
              (apiThumbnailCategories?.jsonBody ?? ''))
          .toList()
          .cast<ThumbnailCategoryStruct>();
    }
  }

  /// Additional helper methods are added here.
}
