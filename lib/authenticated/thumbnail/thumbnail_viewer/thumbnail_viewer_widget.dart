import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'thumbnail_viewer_model.dart';
export 'thumbnail_viewer_model.dart';

class ThumbnailViewerWidget extends StatefulWidget {
  const ThumbnailViewerWidget({
    super.key,
    required this.imagePath,
    required this.imageId,
    required this.catrgoryId,
    required this.imageBlurhash,
    this.name,
    required this.thumbailId,
    bool? viewOnly,
  }) : this.viewOnly = viewOnly ?? false;

  final String? imagePath;
  final int? imageId;
  final int? catrgoryId;
  final String? imageBlurhash;
  final String? name;
  final int? thumbailId;
  final bool viewOnly;

  @override
  State<ThumbnailViewerWidget> createState() => _ThumbnailViewerWidgetState();
}

class _ThumbnailViewerWidgetState extends State<ThumbnailViewerWidget> {
  late ThumbnailViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThumbnailViewerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThumbnailViewer'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('THUMBNAIL_VIEWER_arrow_back_ios_rounded_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'THUMBNAIL_VIEWER_Image_q7jggeom_ON_TAP');
                          logFirebaseEvent('Image_expand_image');
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
                                    functions.getImage(widget.imagePath!),
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: functions.getImage(widget.imagePath!),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: functions.getImage(widget.imagePath!),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: OctoImage(
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                widget.imageBlurhash!,
                              ),
                              image: CachedNetworkImageProvider(
                                functions.getImage(widget.imagePath!),
                              ),
                              width: double.infinity,
                              height: 350.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          widget.name!,
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'THUMBNAIL_VIEWER_PAGE_CANCEL_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_back');
                              context.safePop();
                            },
                            text: 'Cancel',
                            options: FFButtonOptions(
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        if (!widget.viewOnly)
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'THUMBNAIL_VIEWER_PAGE_CONFIRM_BTN_ON_TAP');
                                logFirebaseEvent('Button_update_app_state');
                                setState(() {
                                  FFAppState().updatePageLocationInfoStruct(
                                    (e) => e
                                      ..imageId = widget.imageId
                                      ..image = widget.imagePath
                                      ..imageBlurhash = widget.imageBlurhash,
                                  );
                                  FFAppState().updateThumbnailStruct(
                                    (e) => e
                                      ..id = widget.thumbailId
                                      ..name = widget.name
                                      ..thumbnailCategoryId = widget.catrgoryId
                                      ..updateImage(
                                        (e) => e
                                          ..id = widget.imageId
                                          ..path = widget.imagePath
                                          ..blurHash = widget.imageBlurhash,
                                      ),
                                  );
                                });
                                logFirebaseEvent('Button_navigate_back');
                                context.safePop();
                              },
                              text: 'Confirm',
                              options: FFButtonOptions(
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
