import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'item_info_widget.dart' show ItemInfoWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class ItemInfoModel extends FlutterFlowModel<ItemInfoWidget> {
  ///  Local state fields for this page.

  DateTime? expireDate;

  String hash = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for DescriptionField widget.
  TextEditingController? descriptionFieldController;
  String? Function(BuildContext, String?)? descriptionFieldControllerValidator;
  // State field(s) for forewarnField widget.
  TextEditingController? forewarnFieldController1;
  String? Function(BuildContext, String?)? forewarnFieldController1Validator;
  // State field(s) for AmountField widget.
  TextEditingController? amountFieldController;
  String? Function(BuildContext, String?)? amountFieldControllerValidator;
  // State field(s) for forewarnField widget.
  TextEditingController? forewarnFieldController2;
  String? Function(BuildContext, String?)? forewarnFieldController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for LocationOption widget.
  String? locationOptionValue1;
  FormFieldController<String>? locationOptionValueController1;
  // State field(s) for LocationOption widget.
  String? locationOptionValue2;
  FormFieldController<String>? locationOptionValueController2;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameFieldController?.dispose();
    descriptionFieldController?.dispose();
    forewarnFieldController1?.dispose();
    amountFieldController?.dispose();
    forewarnFieldController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
