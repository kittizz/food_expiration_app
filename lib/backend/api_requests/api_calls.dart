import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

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
  static DeleteThumbnailCall deleteThumbnailCall = DeleteThumbnailCall();
  static DeleteThumbnailCategoryCall deleteThumbnailCategoryCall =
      DeleteThumbnailCategoryCall();
  static AdminDeleteBlogCall adminDeleteBlogCall = AdminDeleteBlogCall();
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
  static AdminDashboardCall adminDashboardCall = AdminDashboardCall();
  static AdminSetCategoriesCall adminSetCategoriesCall =
      AdminSetCategoriesCall();
  static AdminGetCategoriesCall adminGetCategoriesCall =
      AdminGetCategoriesCall();
  static AdminThumbnailCreateCategoryCall adminThumbnailCreateCategoryCall =
      AdminThumbnailCreateCategoryCall();
  static AdminThumbnailCreateCall adminThumbnailCreateCall =
      AdminThumbnailCreateCall();
  static AdminRenameThumbnailCall adminRenameThumbnailCall =
      AdminRenameThumbnailCall();
  static AdminRenameBlogCall adminRenameBlogCall = AdminRenameBlogCall();
  static AdminUpdateCategoryImageCall adminUpdateCategoryImageCall =
      AdminUpdateCategoryImageCall();
  static AdminUpdateBlogCall adminUpdateBlogCall = AdminUpdateBlogCall();
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? signInProvider(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signInProvider''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.role''',
      ));
  String? nickname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nickname''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profilePicture''',
      ));
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.createdAt''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content''',
      ));
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class DeleteThumbnailCall {
  Future<ApiCallResponse> call({
    int? id,
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteThumbnail',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail',
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
      alwaysAllowBody: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class DeleteThumbnailCategoryCall {
  Future<ApiCallResponse> call({
    int? id,
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteThumbnailCategory',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail/category',
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
      alwaysAllowBody: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class AdminDeleteBlogCall {
  Future<ApiCallResponse> call({
    int? id,
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'adminDeleteBlog',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog',
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  String? banner(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.banner''',
      ));
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }
}

class AdminDashboardCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'adminDashboard',
      apiUrl: '${FoodexpirationGroup.baseUrl}/admin/dashboard',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.users''',
      );
  dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
  dynamic locations(dynamic response) => getJsonField(
        response,
        r'''$.locations''',
      );
}

class AdminSetCategoriesCall {
  Future<ApiCallResponse> call({
    String? categories = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "categories": "${categories}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminSetCategories',
      apiUrl: '${FoodexpirationGroup.baseUrl}/admin/set-category',
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
      alwaysAllowBody: false,
    );
  }
}

class AdminGetCategoriesCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'adminGetCategories',
      apiUrl: '${FoodexpirationGroup.baseUrl}/admin/category',
      callType: ApiCallType.GET,
      headers: {
        'x-device-id': '${deviceid}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic categories(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
      );
}

class AdminThumbnailCreateCategoryCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? imageId,
    String? type = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "imageId": ${imageId},
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminThumbnailCreateCategory',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail/create-category',
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
      alwaysAllowBody: false,
    );
  }
}

class AdminThumbnailCreateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? imageId,
    int? categoryId,
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "imageId": ${imageId},
  "categoryId": ${categoryId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminThumbnailCreate',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail/create-thumbnail',
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
      alwaysAllowBody: false,
    );
  }
}

class AdminRenameThumbnailCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? type = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "name": "${name}",
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminRenameThumbnail',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail/rename',
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
      alwaysAllowBody: false,
    );
  }
}

class AdminRenameBlogCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminRenameBlog',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/rename',
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
      alwaysAllowBody: false,
    );
  }
}

class AdminUpdateCategoryImageCall {
  Future<ApiCallResponse> call({
    int? id,
    int? imageId,
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "imageId": ${imageId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminUpdateCategoryImage',
      apiUrl: '${FoodexpirationGroup.baseUrl}/thumbnail/update-category-image',
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
      alwaysAllowBody: false,
    );
  }
}

class AdminUpdateBlogCall {
  Future<ApiCallResponse> call({
    int? id,
    int? imageId,
    String? title = '',
    String? content = '',
    String? deviceid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "imageId": ${imageId},
  "title": "${title}",
  "content": "${content}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adminUpdateBlog',
      apiUrl: '${FoodexpirationGroup.baseUrl}/blog/update',
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
      alwaysAllowBody: false,
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
