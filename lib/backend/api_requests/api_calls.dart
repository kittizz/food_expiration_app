import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
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
  static BlogByIdCall blogByIdCall = BlogByIdCall();
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
  static CreateLocationCall createLocationCall = CreateLocationCall();
  static GetLocationByIdCall getLocationByIdCall = GetLocationByIdCall();
  static UpdateLocationCall updateLocationCall = UpdateLocationCall();
  static CategoryCall categoryCall = CategoryCall();
  static CreateItemCall createItemCall = CreateItemCall();
  static UpdateItemCall updateItemCall = UpdateItemCall();
  static LocationsItemCall locationsItemCall = LocationsItemCall();
  static ClearItemsCall clearItemsCall = ClearItemsCall();
  static DeleteItemsCall deleteItemsCall = DeleteItemsCall();
  static GetItemCall getItemCall = GetItemCall();
  static UpdateFCMCall updateFCMCall = UpdateFCMCall();
  static UpdateSettingsCall updateSettingsCall = UpdateSettingsCall();
}

class RegisterDeviceCall {
  Future<ApiCallResponse> call({
    String? authToken = 'no',
    String? nickname = '',
    String? deviceid = '',
  }) async {
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
  }) async {
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
  dynamic profilePictureBlurHash(dynamic response) => getJsonField(
        response,
        r'''$.profilePictureBlurHash''',
      );
  dynamic notification(dynamic response) => getJsonField(
        response,
        r'''$.notification''',
      );
}

class BlogRecommendCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) async {
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

class BlogByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'blogById',
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
        r'''$.image.path''',
      );
  dynamic imageBlurHash(dynamic response) => getJsonField(
        response,
        r'''$.image.blurHash''',
      );
}

class BlogAllCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) async {
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
  }) async {
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
  }) async {
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

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class UploadImageCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? hash = '',
    String? deviceid = '',
  }) async {
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
        r'''$.id''',
      );
  dynamic path(dynamic response) => getJsonField(
        response,
        r'''$.path''',
      );
  dynamic blurHash(dynamic response) => getJsonField(
        response,
        r'''$.blurHash''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetBannerCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) async {
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
  }) async {
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
  }) async {
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
  }) async {
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
  }) async {
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

class CreateLocationCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    int? imageId,
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}",
  "imageId": ${imageId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createLocation',
      apiUrl: '${FoodexpirationGroup.baseUrl}/location',
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
}

class GetLocationByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    bool? items = false,
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLocationById',
      apiUrl: '${FoodexpirationGroup.baseUrl}/location',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {
        'id': id,
        'items': items,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateLocationCall {
  Future<ApiCallResponse> call({
    int? locationId,
    int? imageId,
    String? name = '',
    String? description = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}",
  "imageId": ${imageId},
  "locationId": ${locationId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateLocation',
      apiUrl: '${FoodexpirationGroup.baseUrl}/location',
      callType: ApiCallType.PUT,
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
}

class CategoryCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'category',
      apiUrl: '${FoodexpirationGroup.baseUrl}/category',
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

class CreateItemCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? storageDate = '',
    String? expireDate = '',
    int? forewarnDay,
    String? category = '',
    String? barcode = '',
    int? imageId,
    int? locationId,
    int? quantity,
    String? unit = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}",
  "storageDate": "${storageDate}",
  "expireDate": "${expireDate}",
  "forewarnDay": ${forewarnDay},
  "category": "${category}",
  "barcode": "${barcode}",
  "quantity": ${quantity},
  "unit": "${unit}",
  "imageId": ${imageId},
  "locationId": ${locationId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createItem',
      apiUrl: '${FoodexpirationGroup.baseUrl}/item/create',
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
}

class UpdateItemCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? storageDate = '',
    String? expireDate = '',
    int? forewarnDay,
    String? category = '',
    String? barcode = '',
    int? imageId,
    int? locationId,
    int? quantity,
    String? unit = '',
    int? id,
    bool? resetNotification,
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "name": "${name}",
  "description": "${description}",
  "storageDate": "${storageDate}",
  "expireDate": "${expireDate}",
  "forewarnDay": ${forewarnDay},
  "category": "${category}",
  "barcode": "${barcode}",
  "quantity": ${quantity},
  "unit": "${unit}",
  "imageId": ${imageId},
  "locationId": ${locationId},
  "resetNotification": ${resetNotification}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateItem ',
      apiUrl: '${FoodexpirationGroup.baseUrl}/item/${id}',
      callType: ApiCallType.PUT,
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
}

class LocationsItemCall {
  Future<ApiCallResponse> call({
    bool? isArchived,
    int? id,
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "isArchived": ${isArchived}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'locationsItem',
      apiUrl: '${FoodexpirationGroup.baseUrl}/item/location',
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

class ClearItemsCall {
  Future<ApiCallResponse> call({
    List<int>? idList,
    bool? archive,
    String? deviceid = '',
  }) async {
    final id = _serializeList(idList);

    final ffApiRequestBody = '''
{
  "id": ${id},
  "archive": ${archive}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'clearItems',
      apiUrl: '${FoodexpirationGroup.baseUrl}/item/clear',
      callType: ApiCallType.PUT,
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
}

class DeleteItemsCall {
  Future<ApiCallResponse> call({
    List<int>? idList,
    String? deviceid = '',
  }) async {
    final id = _serializeList(idList);

    final ffApiRequestBody = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteItems',
      apiUrl: '${FoodexpirationGroup.baseUrl}/item/delete',
      callType: ApiCallType.PATCH,
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
}

class GetItemCall {
  Future<ApiCallResponse> call({
    int? id,
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getItem',
      apiUrl: '${FoodexpirationGroup.baseUrl}/item/${id}',
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

class UpdateFCMCall {
  Future<ApiCallResponse> call({
    String? userDocPath = '',
    String? fcmToken = '',
    String? deviceType = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userDocPath": "${userDocPath}",
  "fcmToken": "${fcmToken}",
  "deviceType": "${deviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateFCM',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user/update-fcm',
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

class UpdateSettingsCall {
  Future<ApiCallResponse> call({
    bool? notification,
    String? notificationAt = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "notification": ${notification},
  "notificationAt": "${notificationAt}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateSettings',
      apiUrl: '${FoodexpirationGroup.baseUrl}/user/update-settings',
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
