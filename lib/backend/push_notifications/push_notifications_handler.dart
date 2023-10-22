import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/logo400x400.png',
              width: 120.0,
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Welcome': ParameterData.none(),
  'Signup': ParameterData.none(),
  'Signin': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'Home': ParameterData.none(),
  'Search': ParameterData.none(),
  'Blog': ParameterData.none(),
  'BlogPost': (data) async => ParameterData(
        allParams: {
          'blogId': getParameter<int>(data, 'blogId'),
        },
      ),
  'ItemList': (data) async => ParameterData(
        allParams: {
          'isLocation': getParameter<bool>(data, 'isLocation'),
          'title': getParameter<String>(data, 'title'),
          'locationId': getParameter<int>(data, 'locationId'),
        },
      ),
  'LocationInfo': ParameterData.none(),
  'LocationList': ParameterData.none(),
  'Archived': (data) async => ParameterData(
        allParams: {
          'isLocation': getParameter<bool>(data, 'isLocation'),
        },
      ),
  'Setting': (data) async => ParameterData(
        allParams: {
          'tabId': getParameter<int>(data, 'tabId'),
        },
      ),
  'ThumbnailCategory': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'ThumbnailSelection': (data) async => ParameterData(
        allParams: {
          'thumbnailCategoryId': getParameter<int>(data, 'thumbnailCategoryId'),
        },
      ),
  'ThumbnailViewer': (data) async => ParameterData(
        allParams: {
          'imagePath': getParameter<String>(data, 'imagePath'),
          'imageId': getParameter<int>(data, 'imageId'),
          'catrgoryId': getParameter<int>(data, 'catrgoryId'),
          'imageBlurhash': getParameter<String>(data, 'imageBlurhash'),
          'name': getParameter<String>(data, 'name'),
          'thumbailId': getParameter<int>(data, 'thumbailId'),
          'viewOnly': getParameter<bool>(data, 'viewOnly'),
        },
      ),
  'ItemInfo': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'isAdd': getParameter<bool>(data, 'isAdd'),
          'id': getParameter<int>(data, 'id'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
