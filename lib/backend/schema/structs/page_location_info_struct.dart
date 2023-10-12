// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageLocationInfoStruct extends FFFirebaseStruct {
  PageLocationInfoStruct({
    bool? isAdd,
    String? name,
    String? description,
    int? locationId,
    int? imageId,
    String? image,
    String? imageBlurhash,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isAdd = isAdd,
        _name = name,
        _description = description,
        _locationId = locationId,
        _imageId = imageId,
        _image = image,
        _imageBlurhash = imageBlurhash,
        super(firestoreUtilData);

  // "isAdd" field.
  bool? _isAdd;
  bool get isAdd => _isAdd ?? false;
  set isAdd(bool? val) => _isAdd = val;
  bool hasIsAdd() => _isAdd != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "locationId" field.
  int? _locationId;
  int get locationId => _locationId ?? 0;
  set locationId(int? val) => _locationId = val;
  void incrementLocationId(int amount) => _locationId = locationId + amount;
  bool hasLocationId() => _locationId != null;

  // "imageId" field.
  int? _imageId;
  int get imageId => _imageId ?? 0;
  set imageId(int? val) => _imageId = val;
  void incrementImageId(int amount) => _imageId = imageId + amount;
  bool hasImageId() => _imageId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "imageBlurhash" field.
  String? _imageBlurhash;
  String get imageBlurhash => _imageBlurhash ?? '';
  set imageBlurhash(String? val) => _imageBlurhash = val;
  bool hasImageBlurhash() => _imageBlurhash != null;

  static PageLocationInfoStruct fromMap(Map<String, dynamic> data) =>
      PageLocationInfoStruct(
        isAdd: data['isAdd'] as bool?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        locationId: castToType<int>(data['locationId']),
        imageId: castToType<int>(data['imageId']),
        image: data['image'] as String?,
        imageBlurhash: data['imageBlurhash'] as String?,
      );

  static PageLocationInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? PageLocationInfoStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'isAdd': _isAdd,
        'name': _name,
        'description': _description,
        'locationId': _locationId,
        'imageId': _imageId,
        'image': _image,
        'imageBlurhash': _imageBlurhash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isAdd': serializeParam(
          _isAdd,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'locationId': serializeParam(
          _locationId,
          ParamType.int,
        ),
        'imageId': serializeParam(
          _imageId,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'imageBlurhash': serializeParam(
          _imageBlurhash,
          ParamType.String,
        ),
      }.withoutNulls;

  static PageLocationInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PageLocationInfoStruct(
        isAdd: deserializeParam(
          data['isAdd'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        locationId: deserializeParam(
          data['locationId'],
          ParamType.int,
          false,
        ),
        imageId: deserializeParam(
          data['imageId'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        imageBlurhash: deserializeParam(
          data['imageBlurhash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PageLocationInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageLocationInfoStruct &&
        isAdd == other.isAdd &&
        name == other.name &&
        description == other.description &&
        locationId == other.locationId &&
        imageId == other.imageId &&
        image == other.image &&
        imageBlurhash == other.imageBlurhash;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [isAdd, name, description, locationId, imageId, image, imageBlurhash]);
}

PageLocationInfoStruct createPageLocationInfoStruct({
  bool? isAdd,
  String? name,
  String? description,
  int? locationId,
  int? imageId,
  String? image,
  String? imageBlurhash,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageLocationInfoStruct(
      isAdd: isAdd,
      name: name,
      description: description,
      locationId: locationId,
      imageId: imageId,
      image: image,
      imageBlurhash: imageBlurhash,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageLocationInfoStruct? updatePageLocationInfoStruct(
  PageLocationInfoStruct? pageLocationInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageLocationInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageLocationInfoStructData(
  Map<String, dynamic> firestoreData,
  PageLocationInfoStruct? pageLocationInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageLocationInfo == null) {
    return;
  }
  if (pageLocationInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageLocationInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageLocationInfoData =
      getPageLocationInfoFirestoreData(pageLocationInfo, forFieldValue);
  final nestedData =
      pageLocationInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageLocationInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageLocationInfoFirestoreData(
  PageLocationInfoStruct? pageLocationInfo, [
  bool forFieldValue = false,
]) {
  if (pageLocationInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageLocationInfo.toMap());

  // Add any Firestore field values
  pageLocationInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageLocationInfoListFirestoreData(
  List<PageLocationInfoStruct>? pageLocationInfos,
) =>
    pageLocationInfos
        ?.map((e) => getPageLocationInfoFirestoreData(e, true))
        .toList() ??
    [];
