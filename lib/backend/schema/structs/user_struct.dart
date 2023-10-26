// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? email,
    String? signInProvider,
    String? role,
    String? nickname,
    String? profilePicture,
    String? profilePictureBlurHash,
    bool? notification,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _signInProvider = signInProvider,
        _role = role,
        _nickname = nickname,
        _profilePicture = profilePicture,
        _profilePictureBlurHash = profilePictureBlurHash,
        _notification = notification,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "signInProvider" field.
  String? _signInProvider;
  String get signInProvider => _signInProvider ?? '';
  set signInProvider(String? val) => _signInProvider = val;
  bool hasSignInProvider() => _signInProvider != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) => _nickname = val;
  bool hasNickname() => _nickname != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  set profilePicture(String? val) => _profilePicture = val;
  bool hasProfilePicture() => _profilePicture != null;

  // "profilePictureBlurHash" field.
  String? _profilePictureBlurHash;
  String get profilePictureBlurHash => _profilePictureBlurHash ?? '';
  set profilePictureBlurHash(String? val) => _profilePictureBlurHash = val;
  bool hasProfilePictureBlurHash() => _profilePictureBlurHash != null;

  // "notification" field.
  bool? _notification;
  bool get notification => _notification ?? false;
  set notification(bool? val) => _notification = val;
  bool hasNotification() => _notification != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        signInProvider: data['signInProvider'] as String?,
        role: data['role'] as String?,
        nickname: data['nickname'] as String?,
        profilePicture: data['profilePicture'] as String?,
        profilePictureBlurHash: data['profilePictureBlurHash'] as String?,
        notification: data['notification'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'signInProvider': _signInProvider,
        'role': _role,
        'nickname': _nickname,
        'profilePicture': _profilePicture,
        'profilePictureBlurHash': _profilePictureBlurHash,
        'notification': _notification,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'signInProvider': serializeParam(
          _signInProvider,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'profilePicture': serializeParam(
          _profilePicture,
          ParamType.String,
        ),
        'profilePictureBlurHash': serializeParam(
          _profilePictureBlurHash,
          ParamType.String,
        ),
        'notification': serializeParam(
          _notification,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        signInProvider: deserializeParam(
          data['signInProvider'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        profilePicture: deserializeParam(
          data['profilePicture'],
          ParamType.String,
          false,
        ),
        profilePictureBlurHash: deserializeParam(
          data['profilePictureBlurHash'],
          ParamType.String,
          false,
        ),
        notification: deserializeParam(
          data['notification'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        signInProvider == other.signInProvider &&
        role == other.role &&
        nickname == other.nickname &&
        profilePicture == other.profilePicture &&
        profilePictureBlurHash == other.profilePictureBlurHash &&
        notification == other.notification;
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        signInProvider,
        role,
        nickname,
        profilePicture,
        profilePictureBlurHash,
        notification
      ]);
}

UserStruct createUserStruct({
  String? email,
  String? signInProvider,
  String? role,
  String? nickname,
  String? profilePicture,
  String? profilePictureBlurHash,
  bool? notification,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      email: email,
      signInProvider: signInProvider,
      role: role,
      nickname: nickname,
      profilePicture: profilePicture,
      profilePictureBlurHash: profilePictureBlurHash,
      notification: notification,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
