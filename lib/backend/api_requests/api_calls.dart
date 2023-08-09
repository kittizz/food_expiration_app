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
  static BlogRecommendCall blogRecommendCall = BlogRecommendCall();
  static BlogByIDCall blogByIDCall = BlogByIDCall();
  static BlogAllCall blogAllCall = BlogAllCall();
  static LocationListCall locationListCall = LocationListCall();
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
  dynamic deviceId(dynamic response) => getJsonField(
        response,
        r'''$.deviceId''',
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
      },
      params: {
        'deviceId': deviceId,
      },
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

class BlogRecommendCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'blogRecommend',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/recommend',
      callType: ApiCallType.GET,
      headers: {
        ...FoodexpirationGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BlogByIDCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogByID',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/query',
      callType: ApiCallType.GET,
      headers: {
        ...FoodexpirationGroup.headers,
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.createdAt''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.content''',
      );
  dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.image''',
      );
}

class BlogAllCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'blogAll',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/all',
      callType: ApiCallType.GET,
      headers: {
        ...FoodexpirationGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LocationListCall {
  Future<ApiCallResponse> call({
    String? deviceId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'locationList',
      apiUrl: '${FoodexpirationGroup.baseUrl}/location/list',
      callType: ApiCallType.GET,
      headers: {
        ...FoodexpirationGroup.headers,
      },
      params: {
        'deviceId': deviceId,
      },
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
