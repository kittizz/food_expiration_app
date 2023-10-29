import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
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
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'item_model.dart';
export 'item_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    Key? key,
    required this.expiryDate,
    required this.name,
    this.image,
    String? location,
    required this.preDay,
    required this.imageBlurhash,
    this.id,
    required this.locationId,
    required this.isArchived,
  })  : this.location = location ?? 'สถานที่',
        super(key: key);

  final DateTime? expiryDate;
  final String? name;
  final String? image;
  final String location;
  final int? preDay;
  final String? imageBlurhash;
  final int? id;
  final int? locationId;
  final bool? isArchived;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> with TickerProviderStateMixin {
  late ItemModel _model;

  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
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
    _model = createModel(context, () => ItemModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await action_blocks.fetchItemInfo(
          context,
          id: widget.id,
        );
        setState(() {});

        context.pushNamed(
          'ItemInfo',
          queryParameters: {
            'name': serializeParam(
              widget.name,
              ParamType.String,
            ),
            'isAdd': serializeParam(
              false,
              ParamType.bool,
            ),
            'id': serializeParam(
              widget.id,
              ParamType.int,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.bottomToTop,
            ),
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
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
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).grey400,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue = newValue!);
                                if (newValue!) {
                                  if (animationsMap[
                                          'columnOnActionTriggerAnimation'] !=
                                      null) {
                                    await animationsMap[
                                            'columnOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  setState(() {
                                    _model.checkboxValue = false;
                                  });
                                  await FoodexpirationGroup.clearItemsCall.call(
                                    idList: (int var1) {
                                      return [var1];
                                    }(widget.id!),
                                    archive: !widget.isArchived!,
                                    deviceid: FFAppState().deviceId,
                                  );
                                  if (widget.isArchived!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กู้คืน ${widget.name} สำเร็จ',
                                          style: GoogleFonts.getFont(
                                            'IBM Plex Sans Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ย้าย ${widget.name} ไปหมดอายุ',
                                          style: GoogleFonts.getFont(
                                            'IBM Plex Sans Thai',
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
                                  }

                                  _model.updatePage(() {
                                    FFAppState().removeFromItems(FFAppState()
                                        .items
                                        .where((e) => e.id == widget.id)
                                        .toList()
                                        .first);
                                  });
                                  if (animationsMap[
                                          'columnOnActionTriggerAnimation'] !=
                                      null) {
                                    animationsMap[
                                            'columnOnActionTriggerAnimation']!
                                        .controller
                                        .reset();
                                  }
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).red300,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.name,
                                        'ไม่ระบุ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.date_range_outlined,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (functions.getDateStatus(
                                                        widget.expiryDate!,
                                                        widget.preDay!) ==
                                                    'ok') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .blue600;
                                                } else if (functions
                                                        .getDateStatus(
                                                            widget.expiryDate!,
                                                            widget.preDay!) ==
                                                    'expired') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .red600;
                                                } else if (functions
                                                        .getDateStatus(
                                                            widget.expiryDate!,
                                                            widget.preDay!) ==
                                                    'about_to_expire') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .orange600;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .blue600,
                                            ),
                                            size: 16.0,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            functions.getFormattedDate(
                                                widget.expiryDate!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if (functions.getDateStatus(
                                                              widget
                                                                  .expiryDate!,
                                                              widget.preDay!) ==
                                                          'ok') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .blue600;
                                                      } else if (functions.getDateStatus(
                                                              widget
                                                                  .expiryDate!,
                                                              widget.preDay!) ==
                                                          'expired') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .red600;
                                                      } else if (functions.getDateStatus(
                                                              widget
                                                                  .expiryDate!,
                                                              widget.preDay!) ==
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
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: FlutterFlowTheme.of(context)
                                                .green800,
                                            size: 16.0,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.location,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: 85.0,
                        height: 85.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: OctoImage(
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      widget.imageBlurhash!,
                                    ),
                                    image: CachedNetworkImageProvider(
                                      valueOrDefault<String>(
                                        widget.image,
                                        'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                                      ),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: valueOrDefault<String>(
                                    widget.image,
                                    'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                                  ),
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: valueOrDefault<String>(
                              widget.image,
                              'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                            ),
                            transitionOnUserGestures: true,
                            child: OctoImage(
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                widget.imageBlurhash!,
                              ),
                              image: CachedNetworkImageProvider(
                                valueOrDefault<String>(
                                  widget.image,
                                  'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                                ),
                              ),
                              width: 85.0,
                              height: 85.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
        ],
      ),
    ).animateOnActionTrigger(
      animationsMap['columnOnActionTriggerAnimation']!,
    );
  }
}
