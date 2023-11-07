import '/backend/schema/structs/index.dart';
import '/component/list_items/list_items_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_list_widget.dart' show ItemListWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ItemListModel extends FlutterFlowModel<ItemListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search1Field widget.
  FocusNode? search1FieldFocusNode;
  TextEditingController? search1FieldController;
  String? Function(BuildContext, String?)? search1FieldControllerValidator;
  // State field(s) for search2Field widget.
  FocusNode? search2FieldFocusNode;
  TextEditingController? search2FieldController;
  String? Function(BuildContext, String?)? search2FieldControllerValidator;
  // State field(s) for filterLocation widget.
  List<String>? filterLocationValue;
  FormFieldController<String>? filterLocationValueController;
  // State field(s) for filterCate widget.
  List<String>? filterCateValue;
  FormFieldController<String>? filterCateValueController;
  // State field(s) for filterExpStatus widget.
  List<String>? filterExpStatusValue;
  FormFieldController<String>? filterExpStatusValueController;
  // Model for ListItems component.
  late ListItemsModel listItemsModel1;
  // Model for ListItems component.
  late ListItemsModel listItemsModel2;
  // Model for ListItems component.
  late ListItemsModel listItemsModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listItemsModel1 = createModel(context, () => ListItemsModel());
    listItemsModel2 = createModel(context, () => ListItemsModel());
    listItemsModel3 = createModel(context, () => ListItemsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    search1FieldFocusNode?.dispose();
    search1FieldController?.dispose();

    search2FieldFocusNode?.dispose();
    search2FieldController?.dispose();

    listItemsModel1.dispose();
    listItemsModel2.dispose();
    listItemsModel3.dispose();
  }

  /// Action blocks are added here.

  Future scanBarcode(BuildContext context) async {
    var barcodeOut = '';

    barcodeOut = await FlutterBarcodeScanner.scanBarcode(
      '#C62828', // scanning line color
      FFLocalizations.of(context).getText(
        '90atx2hx' /* Cancel */,
      ), // cancel button text
      true, // whether to show the flash icon
      ScanMode.BARCODE,
    );

    if (barcodeOut != '-1') {
      FFAppState().updateFilterStruct(
        (e) => e..barcode = barcodeOut,
      );
    } else {
      FFAppState().updateFilterStruct(
        (e) => e..barcode = null,
      );
    }
  }

  /// Additional helper methods are added here.
}
