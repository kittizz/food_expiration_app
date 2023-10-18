import '/component/list_items/list_items_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_list_widget.dart' show ItemListWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ItemListModel extends FlutterFlowModel<ItemListWidget> {
  ///  Local state fields for this page.

  DateTime? testDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    listItemsModel1.dispose();
    listItemsModel2.dispose();
    listItemsModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
