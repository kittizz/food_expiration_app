// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageStruct extends FFFirebaseStruct {
  ImageStruct({
    String? blurHash,
    String? path,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _blurHash = blurHash,
        _path = path,
        super(firestoreUtilData);

  // "BlurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;
  bool hasBlurHash() => _blurHash != null;

  // "Path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;
  bool hasPath() => _path != null;

  static ImageStruct fromMap(Map<String, dynamic> data) => ImageStruct(
        blurHash: data['BlurHash'] as String?,
        path: data['Path'] as String?,
      );

  static ImageStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ImageStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'BlurHash': _blurHash,
        'Path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'BlurHash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
        'Path': serializeParam(
          _path,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageStruct(
        blurHash: deserializeParam(
          data['BlurHash'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['Path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageStruct &&
        blurHash == other.blurHash &&
        path == other.path;
  }

  @override
  int get hashCode => const ListEquality().hash([blurHash, path]);
}

ImageStruct createImageStruct({
  String? blurHash,
  String? path,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageStruct(
      blurHash: blurHash,
      path: path,
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
