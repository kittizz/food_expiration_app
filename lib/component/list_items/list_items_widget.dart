import '/component/item/item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    Key? key,
    this.parameter1,
    this.title,
    bool? showClear,
  })  : this.showClear = showClear ?? false,
        super(key: key);

  final DateTime? parameter1;
  final String? title;
  final bool showClear;

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
            alignment: AlignmentDirectional(-1.0, 0.0),
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
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Text(
                      'ล้าง',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            color: FlutterFlowTheme.of(context).red400,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
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
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            wrapWithModel(
              model: _model.itemModel1,
              updateCallback: () => setState(() {}),
              child: ItemWidget(
                name: 'รายการ',
                image:
                    'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                expiryDate: widget.parameter1 == null
                    ? getCurrentTimestamp
                    : widget.parameter1!,
                location: 'สถานที่',
                preDay: 3,
              ),
            ),
            wrapWithModel(
              model: _model.itemModel2,
              updateCallback: () => setState(() {}),
              child: ItemWidget(
                name: 'รายการ',
                image:
                    'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                expiryDate: widget.parameter1 == null
                    ? getCurrentTimestamp
                    : widget.parameter1!,
                location: 'สถานที่',
                preDay: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
