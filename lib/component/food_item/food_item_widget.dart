import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_item_model.dart';
export 'food_item_model.dart';

class FoodItemWidget extends StatefulWidget {
  const FoodItemWidget({
    Key? key,
    required this.expiryDate,
    required this.name,
    this.image,
    String? location,
    required this.preDay,
  })  : this.location = location ?? 'สถานที่',
        super(key: key);

  final DateTime? expiryDate;
  final String? name;
  final String? image;
  final String location;
  final int? preDay;

  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  late FoodItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodItemModel());
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
                  FlutterFlowIconButton(
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.check_circle_outlined,
                      color: FlutterFlowTheme.of(context).grey400,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: valueOrDefault<Color>(
                                () {
                                  if (functions.getDateStatus(
                                          widget.expiryDate!, widget.preDay!) ==
                                      'ok') {
                                    return FlutterFlowTheme.of(context).blue600;
                                  } else if (functions.getDateStatus(
                                          widget.expiryDate!, widget.preDay!) ==
                                      'expired') {
                                    return FlutterFlowTheme.of(context).red600;
                                  } else if (functions.getDateStatus(
                                          widget.expiryDate!, widget.preDay!) ==
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
                            Icon(
                              Icons.location_on,
                              color: FlutterFlowTheme.of(context).green800,
                              size: 16.0,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                valueOrDefault<String>(
                  widget.image,
                  'https://th-bkk-1.xvercloud.com/food-expiration/images/lay.webp',
                ),
                height: 85.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
