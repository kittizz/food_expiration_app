import '/backend/api_requests/api_calls.dart';
import '/component/item/item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_items_model.dart';
export 'list_items_model.dart';

class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({
    Key? key,
    this.title,
    bool? showClear,
    required this.locationId,
    required this.dateType,
  })  : this.showClear = showClear ?? false,
        super(key: key);

  final String? title;
  final bool showClear;
  final int? locationId;
  final String? dateType;

  @override
  _ListItemsWidgetState createState() => _ListItemsWidgetState();
}

class _ListItemsWidgetState extends State<ListItemsWidget>
    with TickerProviderStateMixin {
  late ListItemsModel _model;

  final animationsMap = {
    'textOnActionTriggerAnimation': AnimationInfo(
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 45.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.title,
                      'หมดอายุไปแล้ว',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                  ),
                ),
                if (widget.showClear)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('ล้างรายการ'),
                                  content: Text(
                                      'คุณกำลังจะล้างรายการ ${widget.title}ทั้งหมด'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('ยกเลิก'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('ยืนยัน'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          _model.apiClearItem =
                              await FoodexpirationGroup.clearItemsCall.call(
                            idList: functions.mapItemIdList(FFAppState()
                                .items
                                .where((e) =>
                                    functions.getDateStatus(
                                        e.expireDate!, e.forewarnDay) ==
                                    widget.dateType)
                                .toList()),
                            archive: true,
                            deviceid: FFAppState().deviceId,
                          );
                          if ((_model.apiClearItem?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'ล้างรายการเรียบร้อย',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FoodexpirationGroup.clearItemsCall
                                      .message(
                                        (_model.apiClearItem?.jsonBody ?? ''),
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

                          await action_blocks.fetchItems(
                            context,
                            archive: false,
                            locationId: widget.locationId,
                          );
                          setState(() {});
                        }

                        setState(() {});
                      },
                      child: Text(
                        'ล้าง',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).red400,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['textOnActionTriggerAnimation']!,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).grey50,
        ),
        Builder(
          builder: (context) {
            final itemsLocal = FFAppState()
                .items
                .where((e) =>
                    functions.getDateStatus(e.expireDate!, e.forewarnDay) ==
                    widget.dateType)
                .toList();
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(itemsLocal.length, (itemsLocalIndex) {
                final itemsLocalItem = itemsLocal[itemsLocalIndex];
                return Container(
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
                      image: functions.getImage(itemsLocalItem.image.path),
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
                    ),
                  ),
                );
              }),
            );
          },
        ),
        Flexible(
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(),
            child: Visibility(
              visible: FFAppState()
                      .items
                      .where((e) =>
                          functions.getDateStatus(
                              e.expireDate!, e.forewarnDay) ==
                          widget.dateType)
                      .toList()
                      .length ==
                  0,
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Text(
                  'ไม่มีรายการ',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyLargeFamily),
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
