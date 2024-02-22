// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageStruct extends FFFirebaseStruct {
  ImageStruct({
    int? id,
    String? path,
    String? blurHash,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _path = path,
        _blurHash = blurHash,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;
  bool hasPath() => _path != null;

  // "blurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;
  bool hasBlurHash() => _blurHash != null;

  static ImageStruct fromMap(Map<String, dynamic> data) => ImageStruct(
        id: castToType<int>(data['id']),
        path: data['path'] as String?,
        blurHash: data['blurHash'] as String?,
      );

  static ImageStruct? maybeFromMap(dynamic data) =>
      data is Map ? ImageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'path': _path,
        'blurHash': _blurHash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'blurHash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        blurHash: deserializeParam(
          data['blurHash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageStruct &&
        id == other.id &&
        path == other.path &&
        blurHash == other.blurHash;
  }

  @override
  int get hashCode => const ListEquality().hash([id, path, blurHash]);
}

ImageStruct createImageStruct({
  int? id,
  String? path,
  String? blurHash,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageStruct(
      id: id,
      path: path,
      blurHash: blurHash,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageStruct? updateImageStruct(
  ImageStruct? image, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    image
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageStructData(
  Map<String, dynamic> firestoreData,
  ImageStruct? image,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (image == null) {
    return;
  }
  if (image.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && image.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageData = getImageFirestoreData(image, forFieldValue);
  final nestedData = imageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = image.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageFirestoreData(
  ImageStruct? image, [
  bool forFieldValue = false,
]) {
  if (image == null) {
    return {};
  }
  final firestoreData = mapToFirestore(image.toMap());

  // Add any Firestore field values
  image.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageListFirestoreData(
  List<ImageStruct>? images,
) =>
    images?.map((e) => getImageFirestoreData(e, true)).toList() ?? [];
