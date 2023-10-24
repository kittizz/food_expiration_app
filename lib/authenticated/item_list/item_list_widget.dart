import '/backend/schema/structs/index.dart';
import '/component/list_items/list_items_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'item_list_model.dart';
export 'item_list_model.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({
    Key? key,
    bool? isLocation,
    this.title,
    this.locationId,
    bool? isScan,
    bool? isSearch,
  })  : this.isLocation = isLocation ?? false,
        this.isScan = isScan ?? false,
        this.isSearch = isSearch ?? false,
        super(key: key);

  final bool isLocation;
  final String? title;
  final int? locationId;
  final bool isScan;
  final bool isSearch;

  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  late ItemListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().items = [];
        FFAppState().filter =
            FilterStruct.fromSerializableMap(jsonDecode('{}'));
      });
      await action_blocks.fetchLocations(context);
      setState(() {});
      await action_blocks.fetchItems(
        context,
        archive: false,
        locationId: widget.isLocation ? widget.locationId : 0,
      );
      setState(() {});
      if (widget.isScan) {
        await _model.scanBarcode(context);
        setState(() {});
      }
    });

    _model.search1FieldController ??= TextEditingController();
    _model.search1FieldFocusNode ??= FocusNode();
    _model.search2FieldController ??= TextEditingController();
    _model.search2FieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (widget.isLocation) {
              FFAppState().updatePageItemInfoStruct(
                (e) => e
                  ..updateLocation(
                    (e) => e
                      ..name = FFAppState()
                          .locations
                          .where((e) => e.id == widget.locationId)
                          .toList()
                          .first
                          .name,
                  ),
              );
            }
            await action_blocks.openAddItem(
              context,
              replace: true,
            );
            setState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).red50,
          elevation: 5.0,
          child: Icon(
            Icons.add_alert,
            color: FlutterFlowTheme.of(context).red300,
            size: 25.0,
          ),
        ),
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
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.isLocation
                  ? FFAppState().pageLocationInfo.name
                  : widget.title,
              'null',
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleLargeFamily),
                ),
          ),
          actions: [
            Visibility(
              visible: widget.isLocation,
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.edit,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await action_blocks.fetchLocationInfo(
                        context,
                        id: widget.locationId,
                      );
                      setState(() {});

                      context.pushNamed('LocationInfo');
                    },
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            color: FlutterFlowTheme.of(context).red200,
            onRefresh: () async {
              await action_blocks.fetchItems(
                context,
                archive: false,
                locationId: widget.isLocation ? widget.locationId : 0,
              );
              setState(() {});
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().filter =
                                        FilterStruct.fromSerializableMap(
                                            jsonDecode('{}'));
                                  });
                                  setState(() {
                                    _model.search1FieldController?.clear();
                                    _model.search2FieldController?.clear();
                                  });
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'ล้างตัวกรอง',
                                        style: TextStyle(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.filter_list_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            if (!widget.isSearch)
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Container(
                                  width: 180.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        FFAppState().filter.search != null &&
                                                FFAppState().filter.search != ''
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        FlutterFlowTheme.of(context).alternate,
                                      ),
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 3.0, 3.0, 3.0),
                                    child: TextFormField(
                                      controller: _model.search1FieldController,
                                      focusNode: _model.search1FieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.search1FieldController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          setState(() {
                                            FFAppState().updateFilterStruct(
                                              (e) => e
                                                ..search = _model
                                                    .search1FieldController
                                                    .text,
                                            );
                                          });
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        setState(() {
                                          FFAppState().updateFilterStruct(
                                            (e) => e
                                              ..search = _model
                                                  .search1FieldController.text,
                                          );
                                        });
                                      },
                                      textCapitalization:
                                          TextCapitalization.none,
                                      textInputAction: TextInputAction.search,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'ค้นหา...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        suffixIcon: _model
                                                .search1FieldController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.search1FieldController
                                                      ?.clear();
                                                  setState(() {
                                                    FFAppState()
                                                        .updateFilterStruct(
                                                      (e) => e
                                                        ..search = _model
                                                            .search1FieldController
                                                            .text,
                                                    );
                                                  });
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 10.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .search1FieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget.isSearch)
                              Container(
                                width: 180.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      FFAppState().filter.search != null &&
                                              FFAppState().filter.search != ''
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      FlutterFlowTheme.of(context).alternate,
                                    ),
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 3.0, 3.0, 3.0),
                                  child: TextFormField(
                                    controller: _model.search2FieldController,
                                    focusNode: _model.search2FieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.search2FieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          FFAppState().updateFilterStruct(
                                            (e) => e
                                              ..search = _model
                                                  .search2FieldController.text,
                                          );
                                        });
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        FFAppState().updateFilterStruct(
                                          (e) => e
                                            ..search = _model
                                                .search2FieldController.text,
                                        );
                                      });
                                    },
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.search,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'ค้นหา...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      suffixIcon: _model.search2FieldController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.search2FieldController
                                                    ?.clear();
                                                setState(() {
                                                  FFAppState()
                                                      .updateFilterStruct(
                                                    (e) => e
                                                      ..search = _model
                                                          .search2FieldController
                                                          .text,
                                                  );
                                                });
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 10.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    validator: _model
                                        .search2FieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            FlutterFlowIconButton(
                              borderColor: valueOrDefault<Color>(
                                FFAppState().filter.barcode != null &&
                                        FFAppState().filter.barcode != ''
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              borderRadius: 8.0,
                              borderWidth: 2.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: FaIcon(
                                FontAwesomeIcons.barcode,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                await _model.scanBarcode(context);
                                setState(() {});
                              },
                            ),
                            FlutterFlowDropDown<String>(
                              controller:
                                  _model.filterLocationValueController ??=
                                      FormFieldController<String>(null),
                              options: FFAppState()
                                  .locations
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: null,
                              width: 240.0,
                              height: 40.0,
                              searchHintTextStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'สถานที่เก็บ',
                              searchHintText: 'ค้นหารายการ...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: valueOrDefault<Color>(
                                FFAppState().filter.location.length != 0
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 2.0, 16.0, 2.0),
                              hidesUnderline: true,
                              isSearchable: true,
                              isMultiSelect: true,
                              onChangedForMultiSelect: (val) async {
                                setState(
                                    () => _model.filterLocationValue = val);
                                setState(() {
                                  FFAppState().updateFilterStruct(
                                    (e) => e
                                      ..location =
                                          _model.filterLocationValue!.toList(),
                                  );
                                });
                              },
                            ),
                            FlutterFlowDropDown<String>(
                              controller: _model.filterCateValueController ??=
                                  FormFieldController<String>(null),
                              options: FFAppState().categorys,
                              onChanged: null,
                              width: 240.0,
                              height: 40.0,
                              searchHintTextStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'หมวดหมู่',
                              searchHintText: 'ค้นหารายการ...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: valueOrDefault<Color>(
                                FFAppState().filter.category.length != 0
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 2.0, 16.0, 2.0),
                              hidesUnderline: true,
                              isSearchable: true,
                              isMultiSelect: true,
                              onChangedForMultiSelect: (val) async {
                                setState(() => _model.filterCateValue = val);
                                setState(() {
                                  FFAppState().updateFilterStruct(
                                    (e) => e
                                      ..category =
                                          _model.filterCateValue!.toList(),
                                  );
                                });
                              },
                            ),
                            FlutterFlowDropDown<String>(
                              controller:
                                  _model.filterExpStatusValueController ??=
                                      FormFieldController<String>(null),
                              options: [
                                'หมดอายุไปแล้ว',
                                'ใกล้จะหมดอายุ',
                                'รายการที่เหลือ'
                              ],
                              onChanged: null,
                              width: 240.0,
                              height: 40.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'วันหมดอายุ',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: valueOrDefault<Color>(
                                FFAppState().filter.expStatus.length != 0
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 2.0, 16.0, 2.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: true,
                              onChangedForMultiSelect: (val) async {
                                setState(
                                    () => _model.filterExpStatusValue = val);
                                setState(() {
                                  FFAppState().updateFilterStruct(
                                    (e) => e
                                      ..expStatus =
                                          _model.filterExpStatusValue!.toList(),
                                  );
                                });
                              },
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ),
                    ),
                  ),
                  if (widget.isLocation)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 135.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).grey50,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: Color(0x1C000000),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 135.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Stack(
                                  children: [
                                    InkWell(
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
                                                  FFAppState()
                                                      .pageLocationInfo
                                                      .imageBlurhash,
                                                ),
                                                image:
                                                    CachedNetworkImageProvider(
                                                  functions.getImage(
                                                      '${FFAppState().pageLocationInfo.image}?i=${widget.locationId?.toString()}'),
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: functions.getImage(
                                                  '${FFAppState().pageLocationInfo.image}?i=${widget.locationId?.toString()}'),
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: functions.getImage(
                                            '${FFAppState().pageLocationInfo.image}?i=${widget.locationId?.toString()}'),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: OctoImage(
                                            placeholderBuilder:
                                                OctoPlaceholder.blurHash(
                                              FFAppState()
                                                  .pageLocationInfo
                                                  .imageBlurhash,
                                            ),
                                            image: CachedNetworkImageProvider(
                                              functions.getImage(
                                                  '${FFAppState().pageLocationInfo.image}?i=${widget.locationId?.toString()}'),
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 1.00),
                                      child: Icon(
                                        Icons.zoom_in_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).grey50,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color(0x34474747),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: SelectionArea(
                                              child: Text(
                                            FFAppState()
                                                .pageLocationInfo
                                                .description,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: wrapWithModel(
                      model: _model.listItemsModel1,
                      updateCallback: () => setState(() {}),
                      child: ListItemsWidget(
                        title: 'หมดอายุไปแล้ว',
                        showClear: true,
                        locationId: widget.isLocation ? widget.locationId! : 0,
                        dateType: 'expired',
                        isArchived: false,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: wrapWithModel(
                      model: _model.listItemsModel2,
                      updateCallback: () => setState(() {}),
                      child: ListItemsWidget(
                        title: 'ใกล้จะหมดอายุ',
                        showClear: false,
                        locationId: widget.isLocation ? widget.locationId! : 0,
                        dateType: 'about_to_expire',
                        isArchived: false,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                      child: wrapWithModel(
                        model: _model.listItemsModel3,
                        updateCallback: () => setState(() {}),
                        child: ListItemsWidget(
                          title: 'รายการที่เหลือ',
                          showClear: false,
                          locationId:
                              widget.isLocation ? widget.locationId! : 0,
                          dateType: 'ok',
                          isArchived: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
