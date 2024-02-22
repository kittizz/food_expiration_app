import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1300.ms,
          duration: 400.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.1, 1.1),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.1, 1.1),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 550.ms,
          duration: 600.ms,
          hz: 5,
          offset: Offset(2.0, 0.0),
          rotation: 0.087,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 550.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -3.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Splash'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_PAGE_Splash_ON_INIT_STATE');
      if (isWeb) {
        logFirebaseEvent('Splash_custom_action');
        _model.isAdmibSite = await actions.checkIsAdminDomain();
      }
      logFirebaseEvent('Splash_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      if (loggedIn) {
        logFirebaseEvent('Splash_action_block');
        _model.outputFetchUser = await action_blocks.fetchUser(context);
        if (_model.outputFetchUser!) {
          if ((FFAppState().user.role == 'admin') && _model.isAdmibSite!) {
            logFirebaseEvent('Splash_navigate_to');

            context.goNamedAuth('AdminDashboard', context.mounted);
          } else {
            logFirebaseEvent('Splash_navigate_to');

            context.goNamedAuth('Home', context.mounted);
          }
        } else {
          logFirebaseEvent('Splash_update_app_state');
          FFAppState().deviceId = '';
          logFirebaseEvent('Splash_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          logFirebaseEvent('Splash_navigate_to');

          context.goNamedAuth('Splash', context.mounted);

          return;
        }
      } else {
        logFirebaseEvent('Splash_navigate_to');

        context.goNamedAuth('Welcome', context.mounted);
      }
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/logo200.png',
                            height: 64.0,
                            fit: BoxFit.cover,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Expiry Date',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Itim',
                                    color: FlutterFlowTheme.of(context).red300,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        GoogleFonts.asMap().containsKey('Itim'),
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                          ),
                          Text(
                            '!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Itim',
                                  color: FlutterFlowTheme.of(context).red300,
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Itim'),
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation2']!),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['rowOnPageLoadAnimation1']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
