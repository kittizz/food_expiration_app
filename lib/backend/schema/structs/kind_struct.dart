// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KindStruct extends FFFirebaseStruct {
  KindStruct({
    String? name,
    String? key,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _key = key,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;
  bool hasKey() => _key != null;

  static KindStruct fromMap(Map<String, dynamic> data) => KindStruct(
        name: data['name'] as String?,
        key: data['key'] as String?,
      );

  static KindStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? KindStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'key': _key,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
      }.withoutNulls;

  static KindStruct fromSerializableMap(Map<String, dynamic> data) =>
      KindStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'KindStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KindStruct && name == other.name && key == other.key;
  }

  @override
  int get hashCode => const ListEquality().hash([name, key]);
}

KindStruct createKindStruct({
  String? name,
  String? key,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    KindStruct(
      name: name,
      key: key,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

KindStruct? updateKindStruct(
  KindStruct? kind, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    kind
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addKindStructData(
  Map<String, dynamic> firestoreData,
  KindStruct? kind,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (kind == null) {
    return;
  }
  if (kind.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && kind.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final kindData = getKindFirestoreData(kind, forFieldValue);
  final nestedData = kindData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = kind.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getKindFirestoreData(
  KindStruct? kind, [
  bool forFieldValue = false,
]) {
  if (kind == null) {
    return {};
  }
  final firestoreData = mapToFirestore(kind.toMap());

  // Add any Firestore field values
  kind.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getKindListFirestoreData(
  List<KindStruct>? kinds,
) =>
    kinds?.map((e) => getKindFirestoreData(e, true)).toList() ?? [];
