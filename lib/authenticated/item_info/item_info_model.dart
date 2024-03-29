import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_info_widget.dart' show ItemInfoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class ItemInfoModel extends FlutterFlowModel<ItemInfoWidget> {
  ///  Local state fields for this page.

  String hash = '';

  bool resetNoti = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldController;
  String? Function(BuildContext, String?)? descriptionFieldControllerValidator;
  // State field(s) for CategoryOption widget.
  String? categoryOptionValue;
  FormFieldController<String>? categoryOptionValueController;
  // State field(s) for LocationOption widget.
  String? locationOptionValue;
  FormFieldController<String>? locationOptionValueController;
  // State field(s) for forewarnDayField widget.
  FocusNode? forewarnDayFieldFocusNode;
  TextEditingController? forewarnDayFieldController;
  String? Function(BuildContext, String?)? forewarnDayFieldControllerValidator;
  String? _forewarnDayFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please fill out notification in advance.';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for quantityField widget.
  FocusNode? quantityFieldFocusNode;
  TextEditingController? quantityFieldController;
  String? Function(BuildContext, String?)? quantityFieldControllerValidator;
  String? _quantityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter quantity';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for unitOption widget.
  String? unitOptionValue;
  FormFieldController<String>? unitOptionValueController;
  // Stores action output result for [Backend Call - API (createItem)] action in Text widget.
  ApiCallResponse? apiCreateItem;
  // Stores action output result for [Backend Call - API (updateItem )] action in Text widget.
  ApiCallResponse? apiUpdateItem;
  // Stores action output result for [Backend Call - API (getItem)] action in Text widget.
  ApiCallResponse? apiGetItem;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    forewarnDayFieldControllerValidator = _forewarnDayFieldControllerValidator;
    quantityFieldControllerValidator = _quantityFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldController?.dispose();

    forewarnDayFieldFocusNode?.dispose();
    forewarnDayFieldController?.dispose();

    quantityFieldFocusNode?.dispose();
    quantityFieldController?.dispose();
  }

  /// Action blocks are added here.

  Future uploadImage(
    BuildContext context, {
    required FFUploadedFile? fileUpload,
  }) async {
    ApiCallResponse? apiUploadImage1;

    if (fileUpload != null && (fileUpload?.bytes?.isNotEmpty ?? false)) {
      if (fileUpload?.blurHash != hash) {
        logFirebaseEvent('uploadImage_backend_call');
        apiUploadImage1 = await FoodexpirationGroup.uploadImageCall.call(
          file: fileUpload,
          deviceid: FFAppState().deviceId,
          hash: fileUpload?.blurHash,
        );
        if ((apiUploadImage1?.succeeded ?? true)) {
          logFirebaseEvent('uploadImage_update_page_state');
          hash = uploadedLocalFile.blurHash!;
          logFirebaseEvent('uploadImage_update_app_state');
          FFAppState().updateThumbnailStruct(
            (e) => e
              ..updateImage(
                (e) => e
                  ..id = FoodexpirationGroup.uploadImageCall.id(
                    (apiUploadImage1?.jsonBody ?? ''),
                  )
                  ..path = FoodexpirationGroup.uploadImageCall
                      .path(
                        (apiUploadImage1?.jsonBody ?? ''),
                      )
                      .toString()
                  ..blurHash = FoodexpirationGroup.uploadImageCall
                      .blurHash(
                        (apiUploadImage1?.jsonBody ?? ''),
                      )
                      .toString(),
              ),
          );
          logFirebaseEvent('uploadImage_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'อัปโหลดรูปสำเร็จ',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 1000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        } else {
          logFirebaseEvent('uploadImage_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FoodexpirationGroup.uploadImageCall
                    .message(
                      (apiUploadImage1?.jsonBody ?? ''),
                    )
                    .toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 1000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          return;
        }
      } else {
        return;
      }
    } else {
      return;
    }
  }

  Future scanBarcode(BuildContext context) async {
    var barcodeOutput = '';

    logFirebaseEvent('scanBarcode_scan_barcode_q_r_code');
    barcodeOutput = await FlutterBarcodeScanner.scanBarcode(
      '#C62828', // scanning line color
      'Cancel', // cancel button text
      true, // whether to show the flash icon
      ScanMode.QR,
    );

    if (barcodeOutput != '-1') {
      logFirebaseEvent('scanBarcode_update_app_state');
      FFAppState().update(() {
        FFAppState().updatePageItemInfoStruct(
          (e) => e..barcode = barcodeOutput,
        );
      });
    }
  }

  /// Additional helper methods are added here.
}
