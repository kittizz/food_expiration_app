import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ItemListModel extends FlutterFlowModel<ItemListWidget> {
  ///  Local state fields for this page.

  List<ItemStruct> items = [];
  void addToItems(ItemStruct item) => items.add(item);
  void removeFromItems(ItemStruct item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, ItemStruct item) =>
      items.insert(index, item);
  void updateItemsAtIndex(int index, Function(ItemStruct) updateFn) =>
      items[index] = updateFn(items[index]);

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

  Future fetchLocationItem(BuildContext context) async {
    ApiCallResponse? apiLocationItem;

    apiLocationItem = await FoodexpirationGroup.locationItemCall.call(
      deviceid: FFAppState().deviceId,
      isArchived: false,
      locationId: widget.locationId,
    );
    if ((apiLocationItem?.succeeded ?? true)) {
      items = functions
          .toItemList((apiLocationItem?.jsonBody ?? ''))
          .toList()
          .cast<ItemStruct>();
    }
  }

  /// Additional helper methods are added here.
}
