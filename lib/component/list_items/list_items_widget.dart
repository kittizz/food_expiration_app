import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'list_items_model.dart';
export 'list_items_model.dart';

class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({
    Key? key,
    this.title,
    bool? showClear,
    required this.items,
    required this.locationId,
  })  : this.showClear = showClear ?? false,
        super(key: key);

  final String? title;
  final bool showClear;
  final List<ItemStruct>? items;
  final int? locationId;

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
          end: Offset(1.2, 1.2),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 260.ms,
          duration: 800.ms,
          begin: Offset(1.2, 1.2),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.05, 1.05),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(1.05, 1.05),
          end: Offset(0.8, 0.8),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1000.0, 0.0),
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.itemsLocal = widget.items!.toList().cast<ItemStruct>();
      });
    });

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

    return Visibility(
      visible: _model.itemsLocal.length != 0,
      child: Column(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                          if (animationsMap['textOnActionTriggerAnimation'] !=
                              null) {
                            await animationsMap['textOnActionTriggerAnimation']!
                                .controller
                                .forward(from: 0.0);
                          }
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
                              idList: functions
                                  .mapItemIdList(widget.items!.toList()),
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
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                color: FlutterFlowTheme.of(context).red400,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyLargeFamily),
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
              final list = _model.itemsLocal.toList();
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(list.length, (listIndex) {
                  final listItem = list[listIndex];
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.standard,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context).grey400,
                                    ),
                                    child: Checkbox(
                                      value: _model
                                          .checkboxValueMap[listItem] ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValueMap[listItem] =
                                                newValue!);
                                        if (newValue!) {
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'containerOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          await FoodexpirationGroup
                                              .clearItemsCall
                                              .call(
                                            idList: (int var1) {
                                              return [var1];
                                            }(listItem.id),
                                            archive: true,
                                            deviceid: FFAppState().deviceId,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'ย้อยไปหมดอายุ',
                                                style: GoogleFonts.getFont(
                                                  'IBM Plex Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              action: SnackBarAction(
                                                label: 'ยกเลิก',
                                                textColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                onPressed: () async {
                                                  context.pushNamed('Archived');
                                                },
                                              ),
                                            ),
                                          );
                                          setState(() {
                                            _model.removeAtIndexFromItemsLocal(
                                                listIndex);
                                          });
                                        }
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).red300,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Icon(
                                                Icons.date_range_outlined,
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (functions.getDateStatus(
                                                            listItem
                                                                .expireDate!,
                                                            listItem
                                                                .forewarnDay) ==
                                                        'ok') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .blue600;
                                                    } else if (functions
                                                            .getDateStatus(
                                                                listItem
                                                                    .expireDate!,
                                                                listItem
                                                                    .forewarnDay) ==
                                                        'expired') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .red600;
                                                    } else if (functions
                                                            .getDateStatus(
                                                                listItem
                                                                    .expireDate!,
                                                                listItem
                                                                    .forewarnDay) ==
                                                        'about_to_expire') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .orange600;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .blue600,
                                                ),
                                                size: 16.0,
                                              ),
                                            ),
                                            Text(
                                              functions.getFormattedDate(
                                                  listItem.expireDate!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (functions.getDateStatus(
                                                                    listItem
                                                                        .expireDate!,
                                                                    listItem
                                                                        .forewarnDay) ==
                                                                'ok') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .blue600;
                                                            } else if (functions.getDateStatus(
                                                                    listItem
                                                                        .expireDate!,
                                                                    listItem
                                                                        .forewarnDay) ==
                                                                'expired') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .red600;
                                                            } else if (functions.getDateStatus(
                                                                    listItem
                                                                        .expireDate!,
                                                                    listItem
                                                                        .forewarnDay) ==
                                                                'about_to_expire') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .orange600;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText;
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .blue600,
                                                        ),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Icon(
                                                Icons.location_on,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .green800,
                                                size: 16.0,
                                              ),
                                            ),
                                            Text(
                                              FFAppState()
                                                  .locations
                                                  .where((e) =>
                                                      e.id ==
                                                      listItem.locationId)
                                                  .toList()
                                                  .first
                                                  .name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .green800,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Container(
                                width: 85.0,
                                height: 85.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: OctoImage(
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      listItem.image.blurHash,
                                    ),
                                    image: CachedNetworkImageProvider(
                                      functions.getImage(listItem.image.path),
                                    ),
                                    width: 85.0,
                                    height: 85.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).grey50,
                        ),
                      ],
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
