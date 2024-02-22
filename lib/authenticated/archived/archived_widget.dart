import '/backend/schema/structs/index.dart';
import '/component/list_items/list_items_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'archived_model.dart';
export 'archived_model.dart';

class ArchivedWidget extends StatefulWidget {
  const ArchivedWidget({super.key});

  @override
  State<ArchivedWidget> createState() => _ArchivedWidgetState();
}

class _ArchivedWidgetState extends State<ArchivedWidget> {
  late ArchivedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArchivedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Archived'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ARCHIVED_PAGE_Archived_ON_INIT_STATE');
      logFirebaseEvent('Archived_update_app_state');
      setState(() {
        FFAppState().items = [];
      });
      logFirebaseEvent('Archived_action_block');
      await action_blocks.fetchLocations(context);
      setState(() {});
      logFirebaseEvent('Archived_action_block');
      await action_blocks.fetchItems(
        context,
        archive: true,
        locationId: 0,
      );
      setState(() {});
    });

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              logFirebaseEvent('ARCHIVED_arrow_back_ios_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Archived',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleLargeFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(),
              child: RefreshIndicator(
                color: FlutterFlowTheme.of(context).red200,
                onRefresh: () async {
                  logFirebaseEvent('ARCHIVED_Column_e2nftuog_ON_PULL_TO_REFR');
                  logFirebaseEvent('Column_action_block');
                  await action_blocks.fetchLocations(context);
                  setState(() {});
                  logFirebaseEvent('Column_action_block');
                  await action_blocks.fetchItems(
                    context,
                    archive: true,
                    locationId: 0,
                  );
                  setState(() {});
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.listItemsModel,
                        updateCallback: () => setState(() {}),
                        child: ListItemsWidget(
                          title: '',
                          showClear: true,
                          locationId: 0,
                          dateType: '',
                          isArchived: true,
                        ),
                      ),
                    ],
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
