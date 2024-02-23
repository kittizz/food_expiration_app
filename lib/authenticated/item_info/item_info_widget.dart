import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'item_info_model.dart';
export 'item_info_model.dart';

class ItemInfoWidget extends StatefulWidget {
  const ItemInfoWidget({
    super.key,
    String? name,
    required this.isAdd,
    this.id,
  }) : this.name = name ?? '';

  final String name;
  final bool? isAdd;
  final int? id;

  @override
  State<ItemInfoWidget> createState() => _ItemInfoWidgetState();
}

class _ItemInfoWidgetState extends State<ItemInfoWidget> {
  late ItemInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemInfoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ItemInfo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ITEM_INFO_PAGE_ItemInfo_ON_INIT_STATE');
      logFirebaseEvent('ItemInfo_action_block');
      await action_blocks.fetchLocations(context);
      setState(() {});
    });

    _model.nameFieldController ??=
        TextEditingController(text: FFAppState().pageItemInfo.name);
    _model.nameFieldFocusNode ??= FocusNode();

    _model.descriptionFieldController ??=
        TextEditingController(text: FFAppState().pageItemInfo.description);
    _model.descriptionFieldFocusNode ??= FocusNode();

    _model.forewarnDayFieldController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().pageItemInfo.forewarnDay.toString(),
      '1',
    ));
    _model.forewarnDayFieldFocusNode ??= FocusNode();

    _model.quantityFieldController ??= TextEditingController(
        text: FFAppState().pageItemInfo.quantity.toString());
    _model.quantityFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).grey50,
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
              logFirebaseEvent('ITEM_INFO_arrow_back_ios_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            widget.name,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleLargeFamily),
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ITEM_INFO_PAGE_Text_iihne0pf_ON_TAP');
                    var _shouldSetState = false;
                    logFirebaseEvent('Text_validate_form');
                    if (_model.formKey2.currentState == null ||
                        !_model.formKey2.currentState!.validate()) {
                      return;
                    }
                    if (_model.unitOptionValue == null) {
                      return;
                    }
                    logFirebaseEvent('Text_validate_form');
                    if (_model.formKey4.currentState == null ||
                        !_model.formKey4.currentState!.validate()) {
                      return;
                    }
                    if (_model.categoryOptionValue == null) {
                      return;
                    }
                    if (_model.locationOptionValue == null) {
                      return;
                    }
                    logFirebaseEvent('Text_validate_form');
                    if (_model.formKey2.currentState == null ||
                        !_model.formKey2.currentState!.validate()) {
                      return;
                    }
                    if (_model.unitOptionValue == null) {
                      return;
                    }
                    if (FFAppState().thumbnail.image.id > 0) {
                      if (widget.isAdd!) {
                        logFirebaseEvent('Text_backend_call');
                        _model.apiCreateItem =
                            await FoodexpirationGroup.createItemCall.call(
                          name: _model.nameFieldController.text,
                          description: _model.descriptionFieldController.text,
                          storageDate: functions.toRFC3339(
                              FFAppState().pageItemInfo.storageDate!, true),
                          expireDate: functions.toRFC3339(
                              FFAppState().pageItemInfo.expireDate!, true),
                          forewarnDay: int.tryParse(
                              _model.forewarnDayFieldController.text),
                          category: _model.categoryOptionValue,
                          barcode: FFAppState().pageItemInfo.barcode,
                          imageId: FFAppState().thumbnail.image.id,
                          locationId: _model.locationOptionValue != null &&
                                  _model.locationOptionValue != ''
                              ? FFAppState()
                                  .locations
                                  .where((e) =>
                                      e.name == _model.locationOptionValue)
                                  .toList()
                                  .first
                                  .id
                              : null,
                          deviceid: FFAppState().deviceId,
                          quantity:
                              int.tryParse(_model.quantityFieldController.text),
                          unit: _model.unitOptionValue,
                        );
                        _shouldSetState = true;
                        if ((_model.apiCreateItem?.succeeded ?? true)) {
                          logFirebaseEvent('Text_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Item added successfully',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 2000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          logFirebaseEvent('Text_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'ItemList',
                            queryParameters: {
                              'isLocation': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'title': serializeParam(
                                FFAppState().pageItemInfo.location.name !=
                                            null &&
                                        FFAppState()
                                                .pageItemInfo
                                                .location
                                                .name !=
                                            ''
                                    ? FFAppState().pageItemInfo.location.name
                                    : 'All items',
                                ParamType.String,
                              ),
                              'locationId': serializeParam(
                                FFAppState().pageItemInfo.location.id,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          logFirebaseEvent('Text_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(FoodexpirationGroup.createItemCall
                                    .message(
                                      (_model.apiCreateItem?.jsonBody ?? ''),
                                    )
                                    .toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      } else {
                        logFirebaseEvent('Text_backend_call');
                        _model.apiUpdateItem =
                            await FoodexpirationGroup.updateItemCall.call(
                          deviceid: FFAppState().deviceId,
                          name: _model.nameFieldController.text,
                          description: _model.descriptionFieldController.text,
                          storageDate: functions.toRFC3339(
                              FFAppState().pageItemInfo.storageDate!, true),
                          expireDate: functions.toRFC3339(
                              FFAppState().pageItemInfo.expireDate!, true),
                          forewarnDay: int.tryParse(
                              _model.forewarnDayFieldController.text),
                          category: _model.categoryOptionValue,
                          barcode: FFAppState().pageItemInfo.barcode,
                          imageId: FFAppState().thumbnail.image.id,
                          locationId: _model.locationOptionValue != null &&
                                  _model.locationOptionValue != ''
                              ? FFAppState()
                                  .locations
                                  .where((e) =>
                                      e.name == _model.locationOptionValue)
                                  .toList()
                                  .first
                                  .id
                              : null,
                          quantity:
                              int.tryParse(_model.quantityFieldController.text),
                          unit: _model.unitOptionValue,
                          id: widget.id,
                          resetNotification: _model.resetNoti,
                        );
                        _shouldSetState = true;
                        if ((_model.apiUpdateItem?.succeeded ?? true)) {
                          logFirebaseEvent('Text_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'The item was edited successfully.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 2000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          logFirebaseEvent('Text_backend_call');
                          _model.apiGetItem =
                              await FoodexpirationGroup.getItemCall.call(
                            deviceid: FFAppState().deviceId,
                            id: widget.id,
                          );
                          _shouldSetState = true;
                          if ((_model.apiGetItem?.succeeded ?? true)) {
                            logFirebaseEvent('Text_update_app_state');
                            FFAppState().update(() {
                              FFAppState().updateItemsAtIndex(
                                functions.findItemIndex(
                                    FFAppState().items.toList(), widget.id!),
                                (_) => functions.toItem(
                                    (_model.apiGetItem?.jsonBody ?? '')),
                              );
                            });
                          } else {
                            logFirebaseEvent('Text_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(FoodexpirationGroup.getItemCall
                                      .message(
                                        (_model.apiGetItem?.jsonBody ?? ''),
                                      )
                                      .toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          logFirebaseEvent('Text_navigate_back');
                          context.safePop();
                        } else {
                          logFirebaseEvent('Text_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(FoodexpirationGroup.updateItemCall
                                    .message(
                                      (_model.apiUpdateItem?.jsonBody ?? ''),
                                    )
                                    .toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      }
                    } else {
                      logFirebaseEvent('Text_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Please upload a photo or select from the photo gallery.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  child: Text(
                    widget.isAdd! ? 'Add' : 'Save',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          color: FlutterFlowTheme.of(context).success,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 450.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ITEM_INFO_PAGE_heroImage_ON_TAP');
                                      logFirebaseEvent(
                                          'heroImage_store_media_for_upload');
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 1024.00,
                                        maxHeight: 1024.00,
                                        imageQuality: 100,
                                        allowPhoto: true,
                                        includeBlurHash: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      logFirebaseEvent(
                                          'heroImage_action_block');
                                      await _model.uploadImage(
                                        context,
                                        fileUpload: _model.uploadedLocalFile,
                                      );
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 250.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E3E7),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_a_photo_outlined,
                                                color: Color(0xFF57636C),
                                                size: 72.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  'Add a photo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'IBM Plex Sans Thai',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 22.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'IBM Plex Sans Thai'),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  'Upload photos here...',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'IBM Plex Sans Thai',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'IBM Plex Sans Thai'),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (valueOrDefault<bool>(
                                            FFAppState().thumbnail.image.path !=
                                                    null &&
                                                FFAppState()
                                                        .thumbnail
                                                        .image
                                                        .path !=
                                                    '',
                                            false,
                                          ))
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Hero(
                                                tag: functions.getImage(
                                                    '${FFAppState().thumbnail.image.path}?i=${widget.id?.toString()}'),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: OctoImage(
                                                    placeholderBuilder:
                                                        OctoPlaceholder
                                                            .blurHash(
                                                      FFAppState()
                                                          .thumbnail
                                                          .image
                                                          .blurHash,
                                                    ),
                                                    image: NetworkImage(
                                                      functions.getImage(
                                                          '${FFAppState().thumbnail.image.path}?i=${widget.id?.toString()}'),
                                                    ),
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 10.0),
                                              child: Icon(
                                                Icons.file_upload_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (valueOrDefault<bool>(
                                        FFAppState().thumbnail.image.path !=
                                                null &&
                                            FFAppState().thumbnail.image.path !=
                                                '',
                                        false,
                                      ))
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ITEM_INFO_PAGE_Row_180qhfu2_ON_TAP');
                                            logFirebaseEvent(
                                                'Wrap_navigate_to');

                                            context.pushNamed(
                                              'ThumbnailViewer',
                                              queryParameters: {
                                                'imagePath': serializeParam(
                                                  FFAppState()
                                                      .thumbnail
                                                      .image
                                                      .path,
                                                  ParamType.String,
                                                ),
                                                'imageId': serializeParam(
                                                  0,
                                                  ParamType.int,
                                                ),
                                                'catrgoryId': serializeParam(
                                                  0,
                                                  ParamType.int,
                                                ),
                                                'imageBlurhash': serializeParam(
                                                  FFAppState()
                                                      .thumbnail
                                                      .image
                                                      .blurHash,
                                                  ParamType.String,
                                                ),
                                                'name': serializeParam(
                                                  '',
                                                  ParamType.String,
                                                ),
                                                'thumbailId': serializeParam(
                                                  0,
                                                  ParamType.int,
                                                ),
                                                'viewOnly': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      'View',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius: 5.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 30.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      icon: Icon(
                                                        Icons.zoom_in_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 15.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ITEM_INFO_zoom_in_outlined_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                          'ThumbnailViewer',
                                                          queryParameters: {
                                                            'imagePath':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .thumbnail
                                                                  .image
                                                                  .path,
                                                              ParamType.String,
                                                            ),
                                                            'imageId':
                                                                serializeParam(
                                                              0,
                                                              ParamType.int,
                                                            ),
                                                            'catrgoryId':
                                                                serializeParam(
                                                              0,
                                                              ParamType.int,
                                                            ),
                                                            'imageBlurhash':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .thumbnail
                                                                  .image
                                                                  .blurHash,
                                                              ParamType.String,
                                                            ),
                                                            'name':
                                                                serializeParam(
                                                              '',
                                                              ParamType.String,
                                                            ),
                                                            'thumbailId':
                                                                serializeParam(
                                                              0,
                                                              ParamType.int,
                                                            ),
                                                            'viewOnly':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          'Gallery',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: 5.0,
                                        borderWidth: 1.0,
                                        buttonSize: 30.0,
                                        fillColor:
                                            FlutterFlowTheme.of(context).info,
                                        icon: Icon(
                                          Icons.image_search,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 15.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ITEM_INFO_PAGE_image_search_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.pushNamed(
                                            'ThumbnailCategory',
                                            queryParameters: {
                                              'type': serializeParam(
                                                'item',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1.0,
                            ),
                          ),
                          child: Form(
                            key: _model.formKey1,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.nameFieldController,
                                      focusNode: _model.nameFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.nameFieldController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'ITEM_INFO_NameField_ON_TEXTFIELD_CHANGE');
                                          logFirebaseEvent(
                                              'NameField_update_app_state');
                                          FFAppState().updatePageItemInfoStruct(
                                            (e) => e
                                              ..name = _model
                                                  .nameFieldController.text,
                                          );
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'name',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .red400,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 16.0, 16.0, 8.0),
                                        suffixIcon: _model.nameFieldController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.nameFieldController
                                                      ?.clear();
                                                  logFirebaseEvent(
                                                      'ITEM_INFO_NameField_ON_TEXTFIELD_CHANGE');
                                                  logFirebaseEvent(
                                                      'NameField_update_app_state');
                                                  FFAppState()
                                                      .updatePageItemInfoStruct(
                                                    (e) => e
                                                      ..name = _model
                                                          .nameFieldController
                                                          .text,
                                                  );
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  size: 15.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            fontSize: 16.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                            lineHeight: 1.0,
                                          ),
                                      validator: _model
                                          .nameFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.descriptionFieldController,
                                    focusNode: _model.descriptionFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.descriptionFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'ITEM_INFO_DescriptionField_ON_TEXTFIELD_');
                                        logFirebaseEvent(
                                            'DescriptionField_update_app_state');
                                        FFAppState().updatePageItemInfoStruct(
                                          (e) => e
                                            ..description = _model
                                                .descriptionFieldController
                                                .text,
                                        );
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'note',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .red400,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 16.0, 8.0),
                                      suffixIcon: _model
                                              .descriptionFieldController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .descriptionFieldController
                                                    ?.clear();
                                                logFirebaseEvent(
                                                    'ITEM_INFO_DescriptionField_ON_TEXTFIELD_');
                                                logFirebaseEvent(
                                                    'DescriptionField_update_app_state');
                                                FFAppState()
                                                    .updatePageItemInfoStruct(
                                                  (e) => e
                                                    ..description = _model
                                                        .descriptionFieldController
                                                        .text,
                                                );
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                size: 15.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          fontSize: 16.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                          lineHeight: 1.0,
                                        ),
                                    validator: _model
                                        .descriptionFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (!widget.isAdd! &&
                                            FFAppState()
                                                .pageItemInfo
                                                .isArchived)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    'Recover',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderRadius: 5.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  icon: Icon(
                                                    Icons.restore,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .blue600,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ITEM_INFO_PAGE_restore_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_backend_call');
                                                    await FoodexpirationGroup
                                                        .clearItemsCall
                                                        .call(
                                                      idList: (int var1) {
                                                        return [var1];
                                                      }(widget.id!),
                                                      archive: false,
                                                      deviceid:
                                                          FFAppState().deviceId,
                                                    );
                                                    logFirebaseEvent(
                                                        'IconButton_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .removeFromItems(
                                                              FFAppState()
                                                                  .items
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      widget.id)
                                                                  .toList()
                                                                  .first);
                                                    });
                                                    logFirebaseEvent(
                                                        'IconButton_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'กู้คืนเรียบร้อย',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'IBM Plex Sans Thai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'IconButton_navigate_back');
                                                    context.safePop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (!widget.isAdd! &&
                                            !FFAppState()
                                                .pageItemInfo
                                                .isArchived)
                                          Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Text(
                                                  'Move to archived',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius: 5.0,
                                                borderWidth: 1.0,
                                                buttonSize: 30.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                icon: Icon(
                                                  Icons.auto_delete,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 15.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ITEM_INFO_PAGE_auto_delete_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');
                                                  await FoodexpirationGroup
                                                      .clearItemsCall
                                                      .call(
                                                    idList: (int var1) {
                                                      return [var1];
                                                    }(widget.id!),
                                                    archive: true,
                                                    deviceid:
                                                        FFAppState().deviceId,
                                                  );
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .removeFromItems(
                                                            FFAppState()
                                                                .items
                                                                .where((e) =>
                                                                    e.id ==
                                                                    widget.id)
                                                                .toList()
                                                                .first);
                                                  });
                                                  logFirebaseEvent(
                                                      'IconButton_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'ย้ายไปหมดอายุ',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'IBM Plex Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'IconButton_navigate_back');
                                                  context.safePop();
                                                },
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1.0,
                            ),
                          ),
                          child: Form(
                            key: _model.formKey4,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Category',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                fontSize: 16.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        ),
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .categoryOptionValueController ??=
                                              FormFieldController<String>(
                                            _model.categoryOptionValue ??=
                                                FFAppState()
                                                    .pageItemInfo
                                                    .category,
                                          ),
                                          options: FFAppState().categorys,
                                          onChanged: (val) => setState(() =>
                                              _model.categoryOptionValue = val),
                                          width: 200.0,
                                          height: 40.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily,
                                                    fontSize: 16.0,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily),
                                                  ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: 'Choose...',
                                          searchHintText: 'Search category...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Storage ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                            ),
                                      ),
                                      FlutterFlowDropDown<String>(
                                        controller: _model
                                                .locationOptionValueController ??=
                                            FormFieldController<String>(
                                          _model.locationOptionValue ??=
                                              FFAppState()
                                                  .pageItemInfo
                                                  .location
                                                  .name,
                                        ),
                                        options: FFAppState()
                                            .locations
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => setState(() =>
                                            _model.locationOptionValue = val),
                                        width: 200.0,
                                        height: 40.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                        searchTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: 'Choose...',
                                        searchHintText: 'Find a storage...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 2.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ITEM_INFO_PAGE_Row_vzv59fjj_ON_TAP');
                                        logFirebaseEvent('Row_action_block');
                                        await _model.scanBarcode(context);
                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Barcode',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFAppState()
                                                                .pageItemInfo
                                                                .barcode !=
                                                            null &&
                                                        FFAppState()
                                                                .pageItemInfo
                                                                .barcode !=
                                                            ''
                                                    ? FFAppState()
                                                        .pageItemInfo
                                                        .barcode
                                                    : 'Press to scan',
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ITEM_INFO_PAGE_Icon_t1vbs3yz_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                        .updatePageItemInfoStruct(
                                                      (e) => e..barcode = '',
                                                    );
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          'Scan',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 5.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context).info,
                                          icon: FaIcon(
                                            FontAwesomeIcons.barcode,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 15.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ITEM_INFO_PAGE_barcode_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_action_block');
                                            await _model.scanBarcode(context);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1.0,
                            ),
                          ),
                          child: Form(
                            key: _model.formKey3,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller:
                                        _model.forewarnDayFieldController,
                                    focusNode: _model.forewarnDayFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.forewarnDayFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'ITEM_INFO_forewarnDayField_ON_TEXTFIELD_');
                                        logFirebaseEvent(
                                            'forewarnDayField_set_form_field');
                                        setState(() {
                                          _model.forewarnDayFieldController
                                              ?.text = (_model
                                                          .forewarnDayFieldController
                                                          .text !=
                                                      null &&
                                                  _model.forewarnDayFieldController
                                                          .text !=
                                                      ''
                                              ? ((int.parse(_model
                                                          .forewarnDayFieldController
                                                          .text)) <
                                                      0
                                                  ? '1'
                                                  : _model
                                                      .forewarnDayFieldController
                                                      .text)
                                              : '1');
                                        });
                                      },
                                    ),
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Advance notification (days)',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .red400,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 16.0, 8.0),
                                      suffixIcon: _model
                                              .forewarnDayFieldController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model
                                                    .forewarnDayFieldController
                                                    ?.clear();
                                                logFirebaseEvent(
                                                    'ITEM_INFO_forewarnDayField_ON_TEXTFIELD_');
                                                logFirebaseEvent(
                                                    'forewarnDayField_set_form_field');
                                                setState(() {
                                                  _model
                                                      .forewarnDayFieldController
                                                      ?.text = (_model
                                                                  .forewarnDayFieldController
                                                                  .text !=
                                                              null &&
                                                          _model.forewarnDayFieldController
                                                                  .text !=
                                                              ''
                                                      ? ((int.parse(_model
                                                                  .forewarnDayFieldController
                                                                  .text)) <
                                                              0
                                                          ? '1'
                                                          : _model
                                                              .forewarnDayFieldController
                                                              .text)
                                                      : '1');
                                                });
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                size: 15.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          fontSize: 16.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                          lineHeight: 1.0,
                                        ),
                                    maxLines: null,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .forewarnDayFieldControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ITEM_INFO_PAGE_Row_ngp20res_ON_TAP');
                                        logFirebaseEvent(
                                            'Row_date_time_picker');
                                        final _datePicked1Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: getCurrentTimestamp,
                                        );

                                        if (_datePicked1Date != null) {
                                          safeSetState(() {
                                            _model.datePicked1 = DateTime(
                                              _datePicked1Date.year,
                                              _datePicked1Date.month,
                                              _datePicked1Date.day,
                                            );
                                          });
                                        }
                                        if (_model.datePicked1 != null) {
                                          logFirebaseEvent(
                                              'Row_update_app_state');
                                          setState(() {
                                            FFAppState()
                                                .updatePageItemInfoStruct(
                                              (e) => e
                                                ..storageDate =
                                                    _model.datePicked1,
                                            );
                                          });
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Storage date',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFAppState()
                                                            .pageItemInfo
                                                            .storageDate !=
                                                        null
                                                    ? dateTimeFormat(
                                                        'yMMMd',
                                                        FFAppState()
                                                            .pageItemInfo
                                                            .storageDate!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        'yMMMd',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ITEM_INFO_PAGE_Row_pioikcd0_ON_TAP');
                                        logFirebaseEvent(
                                            'Row_date_time_picker');
                                        final _datePicked2Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: getCurrentTimestamp,
                                          lastDate: DateTime(2050),
                                        );

                                        if (_datePicked2Date != null) {
                                          safeSetState(() {
                                            _model.datePicked2 = DateTime(
                                              _datePicked2Date.year,
                                              _datePicked2Date.month,
                                              _datePicked2Date.day,
                                            );
                                          });
                                        }
                                        if (_model.datePicked2 != null) {
                                          logFirebaseEvent(
                                              'Row_update_app_state');
                                          setState(() {
                                            FFAppState()
                                                .updatePageItemInfoStruct(
                                              (e) => e
                                                ..expireDate =
                                                    _model.datePicked2,
                                            );
                                          });
                                          logFirebaseEvent(
                                              'Row_update_page_state');
                                          setState(() {
                                            _model.resetNoti = true;
                                          });
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Expiration date',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFAppState()
                                                            .pageItemInfo
                                                            .expireDate !=
                                                        null
                                                    ? dateTimeFormat(
                                                        'yMMMd',
                                                        FFAppState()
                                                            .pageItemInfo
                                                            .expireDate!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )
                                                    : dateTimeFormat(
                                                        'yMMMd',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Builder(
                                      builder: (context) {
                                        final list = FFAppState()
                                            .addDate
                                            .where((e) => e.day <= 7)
                                            .toList();
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(list.length,
                                              (listIndex) {
                                            final listItem = list[listIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ITEM_INFO_PAGE_Text_ri68hmmf_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                      .updatePageItemInfoStruct(
                                                    (e) => e
                                                      ..expireDate =
                                                          functions.addDate(
                                                              FFAppState()
                                                                  .pageItemInfo
                                                                  .expireDate!,
                                                              listItem.day),
                                                  );
                                                });
                                              },
                                              child: Text(
                                                '+ ${listItem.short}.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .blue600,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            );
                                          }).divide(SizedBox(width: 10.0)),
                                        );
                                      },
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Builder(
                                            builder: (context) {
                                              final list = FFAppState()
                                                  .addDate
                                                  .where((e) => e.day >= 14)
                                                  .toList();
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                    list.length, (listIndex) {
                                                  final listItem =
                                                      list[listIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ITEM_INFO_PAGE_Text_8egbxfpg_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                            .updatePageItemInfoStruct(
                                                          (e) => e
                                                            ..expireDate =
                                                                functions.addDate(
                                                                    FFAppState()
                                                                        .pageItemInfo
                                                                        .expireDate!,
                                                                    listItem
                                                                        .day),
                                                        );
                                                      });
                                                    },
                                                    child: Text(
                                                      '+ ${listItem.short}.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .blue600,
                                                                fontSize: 16.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  );
                                                }).divide(
                                                    SizedBox(width: 10.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          'Reset',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 5.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context).info,
                                          icon: Icon(
                                            Icons.restore,
                                            color: FlutterFlowTheme.of(context)
                                                .blue600,
                                            size: 15.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ITEM_INFO_PAGE_restore_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_update_app_state');
                                            setState(() {
                                              FFAppState()
                                                  .updatePageItemInfoStruct(
                                                (e) => e
                                                  ..expireDate =
                                                      functions.addDate(
                                                          getCurrentTimestamp,
                                                          1)
                                                  ..storageDate =
                                                      getCurrentTimestamp,
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            'Scan',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      if (false)
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 5.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context).info,
                                          icon: Icon(
                                            Icons.document_scanner_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 15.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1.0,
                            ),
                          ),
                          child: Form(
                            key: _model.formKey2,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.quantityFieldController,
                                            focusNode:
                                                _model.quantityFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.quantityFieldController',
                                              Duration(milliseconds: 2000),
                                              () async {
                                                logFirebaseEvent(
                                                    'ITEM_INFO_quantityField_ON_TEXTFIELD_CHA');
                                                logFirebaseEvent(
                                                    'quantityField_update_app_state');
                                                FFAppState()
                                                    .updatePageItemInfoStruct(
                                                  (e) => e
                                                    ..name = _model
                                                        .quantityFieldController
                                                        .text,
                                                );
                                              },
                                            ),
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Quantity',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .red400,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 16.0, 8.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                  lineHeight: 1.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .quantityFieldControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                      FlutterFlowDropDown<String>(
                                        controller:
                                            _model.unitOptionValueController ??=
                                                FormFieldController<String>(
                                          _model.unitOptionValue ??=
                                              valueOrDefault<String>(
                                            FFAppState().pageItemInfo.unit,
                                            'ชิ้น',
                                          ),
                                        ),
                                        options: [
                                          'item',
                                          'wrap',
                                          'bag',
                                          'bottle',
                                          'box',
                                          'unit'
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.unitOptionValue = val),
                                        width: 170.0,
                                        height: 50.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                        searchTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: 'Unit',
                                        searchHintText: 'Find a storage...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
