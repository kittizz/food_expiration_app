// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThumbnailCategoryStruct extends FFFirebaseStruct {
  ThumbnailCategoryStruct({
    int? id,
    String? name,
    ImageStruct? image,
    List<ThumbnailStruct>? thumbnails,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _image = image,
        _thumbnails = thumbnails,
        _type = type,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "image" field.
  ImageStruct? _image;
  ImageStruct get image => _image ?? ImageStruct();
  set image(ImageStruct? val) => _image = val;
  void updateImage(Function(ImageStruct) updateFn) =>
      updateFn(_image ??= ImageStruct());
  bool hasImage() => _image != null;

  // "thumbnails" field.
  List<ThumbnailStruct>? _thumbnails;
  List<ThumbnailStruct> get thumbnails => _thumbnails ?? const [];
  set thumbnails(List<ThumbnailStruct>? val) => _thumbnails = val;
  void updateThumbnails(Function(List<ThumbnailStruct>) updateFn) =>
      updateFn(_thumbnails ??= []);
  bool hasThumbnails() => _thumbnails != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static ThumbnailCategoryStruct fromMap(Map<String, dynamic> data) =>
      ThumbnailCategoryStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        image: ImageStruct.maybeFromMap(data['image']),
        thumbnails: getStructList(
          data['thumbnails'],
          ThumbnailStruct.fromMap,
        ),
        type: data['type'] as String?,
      );

  static ThumbnailCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? ThumbnailCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'image': _image?.toMap(),
        'thumbnails': _thumbnails?.map((e) => e.toMap()).toList(),
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
        'thumbnails': serializeParam(
          _thumbnails,
          ParamType.DataStruct,
          true,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static ThumbnailCategoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ThumbnailCategoryStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeStructParam(
          data['image'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        thumbnails: deserializeStructParam<ThumbnailStruct>(
          data['thumbnails'],
          ParamType.DataStruct,
          true,
          structBuilder: ThumbnailStruct.fromSerializableMap,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ThumbnailCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThumbnailCategoryStruct &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        listEquality.equals(thumbnails, other.thumbnails) &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, image, thumbnails, type]);
}

ThumbnailCategoryStruct createThumbnailCategoryStruct({
  int? id,
  String? name,
  ImageStruct? image,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThumbnailCategoryStruct(
      id: id,
      name: name,
      image: image ?? (clearUnsetFields ? ImageStruct() : null),
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThumbnailCategoryStruct? updateThumbnailCategoryStruct(
  ThumbnailCategoryStruct? thumbnailCategory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thumbnailCategory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThumbnailCategoryStructData(
  Map<String, dynamic> firestoreData,
  ThumbnailCategoryStruct? thumbnailCategory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thumbnailCategory == null) {
    return;
  }
  if (thumbnailCategory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && thumbnailCategory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thumbnailCategoryData =
      getThumbnailCategoryFirestoreData(thumbnailCategory, forFieldValue);
  final nestedData =
      thumbnailCategoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = thumbnailCategory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThumbnailCategoryFirestoreData(
  ThumbnailCategoryStruct? thumbnailCategory, [
  bool forFieldValue = false,
]) {
  if (thumbnailCategory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thumbnailCategory.toMap());

  // Handle nested data for "image" field.
  addImageStructData(
    firestoreData,
    thumbnailCategory.hasImage() ? thumbnailCategory.image : null,
    'image',
    forFieldValue,
  );

  // Add any Firestore field values
  thumbnailCategory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThumbnailCategoryListFirestoreData(
  List<ThumbnailCategoryStruct>? thumbnailCategorys,
) =>
    thumbnailCategorys
        ?.map((e) => getThumbnailCategoryFirestoreData(e, true))
        .toList() ??
    [];
