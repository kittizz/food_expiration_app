// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateImageStruct extends FFFirebaseStruct {
  CreateImageStruct({
    ImageStruct? image,
    String? name,
    KindStruct? kind,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _name = name,
        _kind = kind,
        super(firestoreUtilData);

  // "image" field.
  ImageStruct? _image;
  ImageStruct get image => _image ?? ImageStruct();
  set image(ImageStruct? val) => _image = val;
  void updateImage(Function(ImageStruct) updateFn) =>
      updateFn(_image ??= ImageStruct());
  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "kind" field.
  KindStruct? _kind;
  KindStruct get kind => _kind ?? KindStruct();
  set kind(KindStruct? val) => _kind = val;
  void updateKind(Function(KindStruct) updateFn) =>
      updateFn(_kind ??= KindStruct());
  bool hasKind() => _kind != null;

  static CreateImageStruct fromMap(Map<String, dynamic> data) =>
      CreateImageStruct(
        image: ImageStruct.maybeFromMap(data['image']),
        name: data['name'] as String?,
        kind: KindStruct.maybeFromMap(data['kind']),
      );

  static CreateImageStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CreateImageStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'image': _image?.toMap(),
        'name': _name,
        'kind': _kind?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'kind': serializeParam(
          _kind,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CreateImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateImageStruct(
        image: deserializeStructParam(
          data['image'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        kind: deserializeStructParam(
          data['kind'],
          ParamType.DataStruct,
          false,
          structBuilder: KindStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CreateImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateImageStruct &&
        image == other.image &&
        name == other.name &&
        kind == other.kind;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, kind]);
}

CreateImageStruct createCreateImageStruct({
  ImageStruct? image,
  String? name,
  KindStruct? kind,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreateImageStruct(
      image: image ?? (clearUnsetFields ? ImageStruct() : null),
      name: name,
      kind: kind ?? (clearUnsetFields ? KindStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreateImageStruct? updateCreateImageStruct(
  CreateImageStruct? createImage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    createImage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreateImageStructData(
  Map<String, dynamic> firestoreData,
  CreateImageStruct? createImage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (createImage == null) {
    return;
  }
  if (createImage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && createImage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final createImageData =
      getCreateImageFirestoreData(createImage, forFieldValue);
  final nestedData =
      createImageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = createImage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreateImageFirestoreData(
  CreateImageStruct? createImage, [
  bool forFieldValue = false,
]) {
  if (createImage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(createImage.toMap());

  // Handle nested data for "image" field.
  addImageStructData(
    firestoreData,
    createImage.hasImage() ? createImage.image : null,
    'image',
    forFieldValue,
  );

  // Handle nested data for "kind" field.
  addKindStructData(
    firestoreData,
    createImage.hasKind() ? createImage.kind : null,
    'kind',
    forFieldValue,
  );

  // Add any Firestore field values
  createImage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreateImageListFirestoreData(
  List<CreateImageStruct>? createImages,
) =>
    createImages?.map((e) => getCreateImageFirestoreData(e, true)).toList() ??
    [];
