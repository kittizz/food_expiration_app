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
    'x-device-id': '[deviceid]',
  };
  static RegisterDeviceCall registerDeviceCall = RegisterDeviceCall();
  static GetUserCall getUserCall = GetUserCall();
  static BlogRecommendCall blogRecommendCall = BlogRecommendCall();
  static BlogByIDCall blogByIDCall = BlogByIDCall();
  static BlogAllCall blogAllCall = BlogAllCall();
  static LocationListCall locationListCall = LocationListCall();
  static DeleteLocationCall deleteLocationCall = DeleteLocationCall();
  static UploadImageCall uploadImageCall = UploadImageCall();
  static GetBannerCall getBannerCall = GetBannerCall();
  static ChangeProfilepictureCall changeProfilepictureCall =
      ChangeProfilepictureCall();
  static ChangeNicknameCall changeNicknameCall = ChangeNicknameCall();
  static ThumbnailCategoryCall thumbnailCategoryCall = ThumbnailCategoryCall();
  static ThumbnailCategoryByIdCall thumbnailCategoryByIdCall =
      ThumbnailCategoryByIdCall();
}

class RegisterDeviceCall {
  Future<ApiCallResponse> call({
    String? authToken = 'no',
    String? nickname = '',
    String? deviceid = '',
  }) {
    final ffApiRequestBody = '''
{
  "auth_token": "${authToken}",
  "nickname": "${nickname}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerDevice',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user/register-device',
      callType: ApiCallType.POST,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
      body: ffApiRequestBody,
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
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
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
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.role''',
      );
  dynamic nickname(dynamic response) => getJsonField(
        response,
        r'''$.nickname''',
      );
  dynamic profilePicture(dynamic response) => getJsonField(
        response,
        r'''$.profilePicture''',
      );
}

class BlogRecommendCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogRecommend',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/recommend',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
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
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogByID',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/query',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
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
  dynamic imagePath(dynamic response) => getJsonField(
        response,
        r'''$.Image.Path''',
      );
  dynamic imageBlurHash(dynamic response) => getJsonField(
        response,
        r'''$.Image.BlurHash''',
      );
}

class BlogAllCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogAll',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/all',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
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
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'locationList',
      apiUrl: '${FoodexpirationGroup.baseUrl}/location/list',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
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

class DeleteLocationCall {
  Future<ApiCallResponse> call({
    int? id,
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteLocation',
      apiUrl: '${FoodexpirationGroup.baseUrl}/location',
      callType: ApiCallType.DELETE,
      headers: {
        'x-device-id': '${deviceid}',
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
}

class UploadImageCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? hash = '',
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'uploadImage',
      apiUrl: '${FoodexpirationGroup.baseUrl}/image/upload',
      callType: ApiCallType.POST,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.ID''',
      );
  dynamic path(dynamic response) => getJsonField(
        response,
        r'''$.Path''',
      );
  dynamic blurHash(dynamic response) => getJsonField(
        response,
        r'''$.BlurHash''',
      );
}

class GetBannerCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getBanner',
      apiUrl: '${FoodexpirationGroup.baseUrl}/image/banner',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic banner(dynamic response) => getJsonField(
        response,
        r'''$.banner''',
      );
}

class ChangeProfilepictureCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? hash = '',
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'changeProfilepicture',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user/change-profilepicture',
      callType: ApiCallType.POST,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {
        'file': file,
        'hash': hash,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeNicknameCall {
  Future<ApiCallResponse> call({
    String? nickname = '',
    String? deviceid = '',
  }) {
    final ffApiRequestBody = '''
{
  "nickname": "${nickname}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeNickname',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user/change-nickname',
      callType: ApiCallType.POST,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ThumbnailCategoryCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'thumbnailCategory',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail/category',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ThumbnailCategoryByIdCall {
  Future<ApiCallResponse> call({
    String? catrgoryId = '',
    String? deviceid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'thumbnailCategoryById',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {
        'catrgoryId': catrgoryId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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
