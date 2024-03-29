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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'location_model.dart';
export 'location_model.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({
    super.key,
    required this.name,
    this.image,
    this.description,
    required this.id,
  });

  final String? name;
  final ImageStruct? image;
  final String? description;
  final int? id;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget>
    with TickerProviderStateMixin {
  late LocationModel _model;

  var hasRowTriggered = false;
  final animationsMap = {
    'rowOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.02, 1.02),
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
    _model = createModel(context, () => LocationModel());

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
        logFirebaseEvent('LOCATION_COMP_Column_w1vuj1zq_ON_TAP');
        logFirebaseEvent('Column_action_block');
        await action_blocks.fetchLocationInfo(
          context,
          id: widget.id,
        );
        logFirebaseEvent('Column_navigate_to');

        context.pushNamed(
          'ItemList',
          queryParameters: {
            'isLocation': serializeParam(
              true,
              ParamType.bool,
            ),
            'title': serializeParam(
              widget.name,
              ParamType.String,
            ),
            'locationId': serializeParam(
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
      onLongPress: () async {
        logFirebaseEvent('LOCATION_Column_w1vuj1zq_ON_LONG_PRESS');
        logFirebaseEvent('Column_widget_animation');
        if (animationsMap['rowOnActionTriggerAnimation'] != null) {
          setState(() => hasRowTriggered = true);
          SchedulerBinding.instance.addPostFrameCallback((_) async =>
              await animationsMap['rowOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0));
        }
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
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                            Text(
                              widget.description!,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LOCATION_COMP_Image_w95994v1_ON_TAP');
                    logFirebaseEvent('Image_expand_image');
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: OctoImage(
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              widget.image!.blurHash,
                            ),
                            image: CachedNetworkImageProvider(
                              valueOrDefault<String>(
                                functions.getImage(
                                    '${widget.image?.path}?i=${widget.id?.toString()}'),
                                'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                              ),
                            ),
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          allowRotation: false,
                          tag: valueOrDefault<String>(
                            functions.getImage(
                                '${widget.image?.path}?i=${widget.id?.toString()}'),
                            'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                          ),
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: valueOrDefault<String>(
                      functions.getImage(
                          '${widget.image?.path}?i=${widget.id?.toString()}'),
                      'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                    ),
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: OctoImage(
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          widget.image!.blurHash,
                        ),
                        image: CachedNetworkImageProvider(
                          valueOrDefault<String>(
                            functions.getImage(
                                '${widget.image?.path}?i=${widget.id?.toString()}'),
                            'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                          ),
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/error_image.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).animateOnActionTrigger(
              animationsMap['rowOnActionTriggerAnimation']!,
              hasBeenTriggered: hasRowTriggered),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).grey50,
          ),
        ],
      ),
    );
  }
}
