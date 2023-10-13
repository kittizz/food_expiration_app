import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'location_info_widget.dart' show LocationInfoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class LocationInfoModel extends FlutterFlowModel<LocationInfoWidget> {
  ///  Local state fields for this page.

  String hash = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for DescriptionField widget.
  TextEditingController? descriptionFieldController;
  String? Function(BuildContext, String?)? descriptionFieldControllerValidator;
  // Stores action output result for [Backend Call - API (createLocation)] action in Button widget.
  ApiCallResponse? apiCreateLocation;

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
          hash = fileUpload!.blurHash!;
          FFAppState().updatePageLocationInfoStruct(
            (e) => e
              ..imageId = FoodexpirationGroup.uploadImageCall.id(
                (apiUploadImage1?.jsonBody ?? ''),
              )
              ..image = FoodexpirationGroup.uploadImageCall
                  .path(
                    (apiUploadImage1?.jsonBody ?? ''),
                  )
                  .toString()
                  .toString()
              ..imageBlurhash = FoodexpirationGroup.uploadImageCall
                  .blurHash(
                    (apiUploadImage1?.jsonBody ?? ''),
                  )
                  .toString()
                  .toString(),
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
                getJsonField(
                  (apiCreateLocation?.jsonBody ?? ''),
                  r'''$.message''',
                ).toString().toString(),
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

  /// Additional helper methods are added here.
}
