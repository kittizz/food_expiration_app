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
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class ItemInfoModel extends FlutterFlowModel<ItemInfoWidget> {
  ///  Local state fields for this page.

  String hash = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for DescriptionField widget.
  TextEditingController? descriptionFieldController;
  String? Function(BuildContext, String?)? descriptionFieldControllerValidator;
  // State field(s) for CategoryOption widget.
  String? categoryOptionValue;
  FormFieldController<String>? categoryOptionValueController;
  // State field(s) for LocationOption widget.
  String? locationOptionValue;
  FormFieldController<String>? locationOptionValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameFieldController?.dispose();
    descriptionFieldController?.dispose();
  }

  /// Action blocks are added here.

  Future uploadImage(
    BuildContext context, {
    required FFUploadedFile? fileUpload,
  }) async {
    ApiCallResponse? apiUploadImage1;

    if (fileUpload != null && (fileUpload.bytes?.isNotEmpty ?? false)) {
      if (fileUpload?.blurHash != hash) {
        apiUploadImage1 = await FoodexpirationGroup.uploadImageCall.call(
          file: fileUpload,
          deviceid: FFAppState().deviceId,
          hash: fileUpload?.blurHash,
        );
        if ((apiUploadImage1?.succeeded ?? true)) {
          hash = uploadedLocalFile.blurHash!;
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
                      .toString()
                  ..blurHash = FoodexpirationGroup.uploadImageCall
                      .blurHash(
                        (apiUploadImage1?.jsonBody ?? ''),
                      )
                      .toString()
                      .toString(),
              ),
          );
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FoodexpirationGroup.uploadImageCall
                    .message(
                      (apiUploadImage1?.jsonBody ?? ''),
                    )
                    .toString()
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

    barcodeOutput = await FlutterBarcodeScanner.scanBarcode(
      '#C62828', // scanning line color
      'ยกเลิก', // cancel button text
      true, // whether to show the flash icon
      ScanMode.QR,
    );

    FFAppState().update(() {
      FFAppState().updatePageItemInfoStruct(
        (e) => e..barcode = barcodeOutput,
      );
    });
  }

  /// Additional helper methods are added here.
}
