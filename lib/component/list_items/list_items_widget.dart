import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/component/item/item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_items_model.dart';
export 'list_items_model.dart';

class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({
    super.key,
    this.title,
    bool? showClear,
    required this.locationId,
    required this.dateType,
    required this.isArchived,
    this.navColor,
  }) : this.showClear = showClear ?? false;

  final String? title;
  final bool showClear;
  final int? locationId;
  final String? dateType;
  final bool? isArchived;
  final Color? navColor;

  @override
  State<ListItemsWidget> createState() => _ListItemsWidgetState();
}

class _ListItemsWidgetState extends State<ListItemsWidget>
    with TickerProviderStateMixin {
  late ListItemsModel _model;

  final animationsMap = {
    'textOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.02, 1.02),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(1.02, 1.02),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.02, 1.02),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(1.02, 1.02),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemsModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: widget.navColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Text(
                        widget.title!,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.isArchived ?? true)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'LIST_ITEMS_COMP_Text_wyoshgbs_ON_TAP');
                                logFirebaseEvent('Text_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Discard items'),
                                              content: Text(
                                                  'You are about to discard all items. and cannot be recovered.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Text_backend_call');
                                  _model.apiDeleteItem =
                                      await FoodexpirationGroup.deleteItemsCall
                                          .call(
                                    deviceid: FFAppState().deviceId,
                                    idList: functions.mapItemIdList(
                                        (widget.isArchived!
                                                ? FFAppState().items
                                                : FFAppState()
                                                    .items
                                                    .where((e) =>
                                                        functions.getDateStatus(
                                                            e.expireDate!,
                                                            e.forewarnDay) ==
                                                        widget.dateType)
                                                    .toList())
                                            .toList()),
                                  );
                                  if ((_model.apiDeleteItem?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Text_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Clear items',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Text_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FoodexpirationGroup.deleteItemsCall
                                              .message(
                                                (_model.apiDeleteItem
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  logFirebaseEvent('Text_action_block');
                                  await action_blocks.fetchItems(
                                    context,
                                    archive: widget.isArchived,
                                    locationId: widget.locationId,
                                  );
                                  setState(() {});
                                }

                                setState(() {});
                              },
                              child: Text(
                                'Discard',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      color:
                                          FlutterFlowTheme.of(context).red400,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['textOnActionTriggerAnimation1']!,
                            ),
                          if (widget.showClear)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'LIST_ITEMS_COMP_Text_iuj3q4pt_ON_TAP');
                                logFirebaseEvent('Text_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(widget.isArchived!
                                                  ? 'restore items'
                                                  : 'Clear items'),
                                              content: Text(widget.isArchived!
                                                  ? 'You are about to restore all items.'
                                                  : 'You are about to clear the list.${widget.title}all'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Text_backend_call');
                                  _model.apiClearItem =
                                      await FoodexpirationGroup.clearItemsCall
                                          .call(
                                    idList: functions.mapItemIdList(
                                        (widget.isArchived!
                                                ? FFAppState().items
                                                : FFAppState()
                                                    .items
                                                    .where((e) =>
                                                        functions.getDateStatus(
                                                            e.expireDate!,
                                                            e.forewarnDay) ==
                                                        widget.dateType)
                                                    .toList())
                                            .toList()),
                                    archive: !widget.isArchived!,
                                    deviceid: FFAppState().deviceId,
                                  );
                                  if ((_model.apiClearItem?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Text_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Clear items',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Text_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FoodexpirationGroup.clearItemsCall
                                              .message(
                                                (_model.apiClearItem
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  logFirebaseEvent('Text_action_block');
                                  await action_blocks.fetchItems(
                                    context,
                                    archive: widget.isArchived,
                                    locationId: widget.locationId,
                                  );
                                  setState(() {});
                                }

                                setState(() {});
                              },
                              child: Text(
                                widget.isArchived! ? 'Recover' : 'Clear',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      color: widget.isArchived!
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context).red400,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['textOnActionTriggerAnimation2']!,
                            ),
                        ].divide(SizedBox(width: 40.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (false)
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).grey50,
              ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Builder(
            builder: (context) {
              final itemsLocal = (widget.isArchived!
                      ? FFAppState().items
                      : functions.filter(
                          FFAppState()
                              .items
                              .where((e) =>
                                  functions.getDateStatus(
                                      e.expireDate!, e.forewarnDay) ==
                                  widget.dateType)
                              .toList(),
                          FFAppState().filter,
                          FFAppState().locations.toList()))
                  .toList();
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(itemsLocal.length, (itemsLocalIndex) {
                  final itemsLocalItem = itemsLocal[itemsLocalIndex];
                  return Container(
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.itemModels.getModel(
                        itemsLocalIndex.toString(),
                        itemsLocalIndex,
                      ),
                      updateCallback: () => setState(() {}),
                      child: ItemWidget(
                        key: Key(
                          'Keyld8_${itemsLocalIndex.toString()}',
                        ),
                        name: itemsLocalItem.name,
                        image: functions.getImage(
                            '${itemsLocalItem.image.path}?i=${itemsLocalItem.id.toString()}'),
                        location: FFAppState()
                            .locations
                            .where((e) => e.id == itemsLocalItem.locationId)
                            .toList()
                            .first
                            .name,
                        preDay: itemsLocalItem.forewarnDay,
                        imageBlurhash: itemsLocalItem.image.blurHash,
                        id: itemsLocalItem.id,
                        locationId: widget.locationId!,
                        expiryDate: itemsLocalItem.expireDate!,
                        isArchived: widget.isArchived!,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
        if ((widget.isArchived!
                    ? FFAppState().items
                    : functions.filter(
                        FFAppState()
                            .items
                            .where((e) =>
                                functions.getDateStatus(
                                    e.expireDate!, e.forewarnDay) ==
                                widget.dateType)
                            .toList(),
                        FFAppState().filter,
                        FFAppState().locations.toList()))
                .length ==
            0)
          Container(
            height: 40.0,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'There are no items.',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      color: Color(0x69474747),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyLargeFamily),
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
