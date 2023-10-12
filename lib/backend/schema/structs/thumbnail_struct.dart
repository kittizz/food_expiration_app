// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThumbnailStruct extends FFFirebaseStruct {
  ThumbnailStruct({
    int? id,
    String? name,
    ImageStruct? image,
    int? thumbnailCategoryID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _image = image,
        _thumbnailCategoryID = thumbnailCategoryID,
        super(firestoreUtilData);

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Image" field.
  ImageStruct? _image;
  ImageStruct get image => _image ?? ImageStruct();
  set image(ImageStruct? val) => _image = val;
  void updateImage(Function(ImageStruct) updateFn) =>
      updateFn(_image ??= ImageStruct());
  bool hasImage() => _image != null;

  // "ThumbnailCategoryID" field.
  int? _thumbnailCategoryID;
  int get thumbnailCategoryID => _thumbnailCategoryID ?? 0;
  set thumbnailCategoryID(int? val) => _thumbnailCategoryID = val;
  void incrementThumbnailCategoryID(int amount) =>
      _thumbnailCategoryID = thumbnailCategoryID + amount;
  bool hasThumbnailCategoryID() => _thumbnailCategoryID != null;

  static ThumbnailStruct fromMap(Map<String, dynamic> data) => ThumbnailStruct(
        id: castToType<int>(data['ID']),
        name: data['Name'] as String?,
        image: ImageStruct.maybeFromMap(data['Image']),
        thumbnailCategoryID: castToType<int>(data['ThumbnailCategoryID']),
      );

  static ThumbnailStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ThumbnailStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
        'Name': _name,
        'Image': _image?.toMap(),
        'ThumbnailCategoryID': _thumbnailCategoryID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
        'ThumbnailCategoryID': serializeParam(
          _thumbnailCategoryID,
          ParamType.int,
        ),
      }.withoutNulls;

  static ThumbnailStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThumbnailStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        image: deserializeStructParam(
          data['Image'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        thumbnailCategoryID: deserializeParam(
          data['ThumbnailCategoryID'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ThumbnailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThumbnailStruct &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        thumbnailCategoryID == other.thumbnailCategoryID;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, image, thumbnailCategoryID]);
}

ThumbnailStruct createThumbnailStruct({
  int? id,
  String? name,
  ImageStruct? image,
  int? thumbnailCategoryID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThumbnailStruct(
      id: id,
      name: name,
      image: image ?? (clearUnsetFields ? ImageStruct() : null),
      thumbnailCategoryID: thumbnailCategoryID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThumbnailStruct? updateThumbnailStruct(
  ThumbnailStruct? thumbnail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thumbnail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThumbnailStructData(
  Map<String, dynamic> firestoreData,
  ThumbnailStruct? thumbnail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thumbnail == null) {
    return;
  }
  if (thumbnail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && thumbnail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thumbnailData = getThumbnailFirestoreData(thumbnail, forFieldValue);
  final nestedData = thumbnailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = thumbnail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThumbnailFirestoreData(
  ThumbnailStruct? thumbnail, [
  bool forFieldValue = false,
]) {
  if (thumbnail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thumbnail.toMap());

  // Handle nested data for "Image" field.
  addImageStructData(
    firestoreData,
    thumbnail.hasImage() ? thumbnail.image : null,
    'Image',
    forFieldValue,
  );

  // Add any Firestore field values
  thumbnail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThumbnailListFirestoreData(
  List<ThumbnailStruct>? thumbnails,
) =>
    thumbnails?.map((e) => getThumbnailFirestoreData(e, true)).toList() ?? [];
