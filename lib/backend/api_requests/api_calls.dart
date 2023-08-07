import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start foodexpiration Group Code

class FoodexpirationGroup {
  static String baseUrl = 'https://food_expiration.kittiza.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static RegisterDeviceCall registerDeviceCall = RegisterDeviceCall();
  static GetUserCall getUserCall = GetUserCall();
}

class RegisterDeviceCall {
  Future<ApiCallResponse> call({
    String? authToken = 'no',
  }) {
    final body = '''
{
  "auth_token": "${authToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerDevice',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user/register-device',
      callType: ApiCallType.POST,
      headers: {
        ...FoodexpirationGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic deviceid(dynamic response) => getJsonField(
        response,
        r'''$.device_id''',
      );
}

class GetUserCall {
  Future<ApiCallResponse> call({
    String? deviceId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        ...FoodexpirationGroup.headers,
        'deviceId': '${deviceId}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic signInProvider(dynamic response) => getJsonField(
        response,
        r'''$.signInProvider''',
      );
}

/// End foodexpiration Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
