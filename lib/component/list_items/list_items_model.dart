import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_items_widget.dart' show ListItemsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class ListItemsModel extends FlutterFlowModel<ListItemsWidget> {
  ///  Local state fields for this component.

  List<ItemStruct> itemsLocal = [];
  void addToItemsLocal(ItemStruct item) => itemsLocal.add(item);
  void removeFromItemsLocal(ItemStruct item) => itemsLocal.remove(item);
  void removeAtIndexFromItemsLocal(int index) => itemsLocal.removeAt(index);
  void insertAtIndexInItemsLocal(int index, ItemStruct item) =>
      itemsLocal.insert(index, item);
  void updateItemsLocalAtIndex(int index, Function(ItemStruct) updateFn) =>
      itemsLocal[index] = updateFn(itemsLocal[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (clearItems)] action in Text widget.
  ApiCallResponse? apiClearItem;
  // State field(s) for Checkbox widget.

  Map<ItemStruct, bool> checkboxValueMap = {};
  List<ItemStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
