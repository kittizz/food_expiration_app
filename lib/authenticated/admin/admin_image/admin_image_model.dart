import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/modal_admin_add_image/modal_admin_add_image_widget.dart';
import '/component/modal_admin_edit_image/modal_admin_edit_image_widget.dart';
import '/component/modal_rename/modal_rename_widget.dart';
import '/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_image_widget.dart' show AdminImageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
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

  List<ThumbnailStruct> thumbnails = [];
  void addToThumbnails(ThumbnailStruct item) => thumbnails.add(item);
  void removeFromThumbnails(ThumbnailStruct item) => thumbnails.remove(item);
  void removeAtIndexFromThumbnails(int index) => thumbnails.removeAt(index);
  void insertAtIndexInThumbnails(int index, ThumbnailStruct item) =>
      thumbnails.insert(index, item);
  void updateThumbnailsAtIndex(int index, Function(ThumbnailStruct) updateFn) =>
      thumbnails[index] = updateFn(thumbnails[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Bottom Sheet - ModalAdminAddImage] action in Row widget.
  CreateImageStruct? modelAddImage;
  // Stores action output result for [Backend Call - API (adminThumbnailCreateCategory)] action in Row widget.
  ApiCallResponse? apiThumbnailCreateCategory;
  // Stores action output result for [Backend Call - API (deleteThumbnailCategory)] action in Row widget.
  ApiCallResponse? apiDeleteThumCate;
  // Stores action output result for [Bottom Sheet - ModalAdminEditImage] action in Row widget.
  ImageStruct? modelEditImage;
  // Stores action output result for [Backend Call - API (adminUpdateCategoryImage)] action in Row widget.
  ApiCallResponse? apiUpdateCategoryImage;
  // Stores action output result for [Bottom Sheet - ModalAdminAddImage] action in Row widget.
  CreateImageStruct? modelAddImage2;
  // Stores action output result for [Backend Call - API (adminThumbnailCreate)] action in Row widget.
  ApiCallResponse? apiThumbnailCreate;
  // Stores action output result for [Backend Call - API (deleteThumbnail)] action in Icon widget.
  ApiCallResponse? apiDeleteThum;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
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

  Future fetchThumbnail(
    BuildContext context, {
    required int? id,
  }) async {
    ApiCallResponse? apiThumbnailCategoriesByid;

    apiThumbnailCategoriesByid =
        await FoodexpirationGroup.thumbnailCategoryByIdCall.call(
      catrgoryId: id?.toString(),
      deviceid: FFAppState().deviceId,
    );
    if ((apiThumbnailCategoriesByid?.succeeded ?? true)) {
      thumbnails = functions
          .toThumbnailCategoryStruct(
              (apiThumbnailCategoriesByid?.jsonBody ?? ''))
          .thumbnails
          .toList()
          .cast<ThumbnailStruct>();
    }
  }

  /// Additional helper methods are added here.
}
