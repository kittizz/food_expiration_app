import '/backend/schema/structs/index.dart';
import '/component/list_items/list_items_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'archived_widget.dart' show ArchivedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArchivedModel extends FlutterFlowModel<ArchivedWidget> {
  ///  Local state fields for this page.

  DateTime? testDate;

  String titleName = 'รายการทั้งหมด';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ListItems component.
  late ListItemsModel listItemsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listItemsModel = createModel(context, () => ListItemsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    listItemsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
