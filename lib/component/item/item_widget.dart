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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.standard,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
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
                          setState(() => _model.checkboxValue = newValue!);
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
                            FFAppState().update(() {
                              FFAppState().removeFromItems(FFAppState()
                                  .items
                                  .where((e) => e.id == widget.id)
                                  .toList()
                                  .first);
                            });
                            if (animationsMap[
                                    'columnOnActionTriggerAnimation'] !=
                                null) {
                              animationsMap['columnOnActionTriggerAnimation']!
                                  .controller
                                  .reset();
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'ย้อยไปหมดอายุ',
                                  style: GoogleFonts.getFont(
                                    'IBM Plex Sans Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            );
                          }
                        },
                        activeColor: FlutterFlowTheme.of(context).red300,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name!,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.date_range_outlined,
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (functions.getDateStatus(
                                              widget.expiryDate!,
                                              widget.preDay!) ==
                                          'ok') {
                                        return FlutterFlowTheme.of(context)
                                            .blue600;
                                      } else if (functions.getDateStatus(
                                              widget.expiryDate!,
                                              widget.preDay!) ==
                                          'expired') {
                                        return FlutterFlowTheme.of(context)
                                            .red600;
                                      } else if (functions.getDateStatus(
                                              widget.expiryDate!,
                                              widget.preDay!) ==
                                          'about_to_expire') {
                                        return FlutterFlowTheme.of(context)
                                            .orange600;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).blue600,
                                  ),
                                  size: 16.0,
                                ),
                              ),
                              Text(
                                functions.getFormattedDate(widget.expiryDate!),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: valueOrDefault<Color>(
                                        () {
                                          if (functions.getDateStatus(
                                                  widget.expiryDate!,
                                                  widget.preDay!) ==
                                              'ok') {
                                            return FlutterFlowTheme.of(context)
                                                .blue600;
                                          } else if (functions.getDateStatus(
                                                  widget.expiryDate!,
                                                  widget.preDay!) ==
                                              'expired') {
                                            return FlutterFlowTheme.of(context)
                                                .red600;
                                          } else if (functions.getDateStatus(
                                                  widget.expiryDate!,
                                                  widget.preDay!) ==
                                              'about_to_expire') {
                                            return FlutterFlowTheme.of(context)
                                                .orange600;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context).blue600,
                                      ),
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: FlutterFlowTheme.of(context).green800,
                                  size: 16.0,
                                ),
                              ),
                              Text(
                                widget.location,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).green800,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: Container(
                  width: 85.0,
                  height: 85.0,
                  decoration: BoxDecoration(),
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
                              placeholderBuilder: OctoPlaceholder.blurHash(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
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
                          fit: BoxFit.contain,
                        ),
                      ),
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
      animationsMap['columnOnActionTriggerAnimation']!,
    );
  }
}
