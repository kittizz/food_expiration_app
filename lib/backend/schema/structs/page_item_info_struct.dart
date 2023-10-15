// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageItemInfoStruct extends FFFirebaseStruct {
  PageItemInfoStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static PageItemInfoStruct fromMap(Map<String, dynamic> data) =>
      PageItemInfoStruct(
        name: data['name'] as String?,
      );

  static PageItemInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PageItemInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PageItemInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageItemInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PageItemInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageItemInfoStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

PageItemInfoStruct createPageItemInfoStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageItemInfoStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageItemInfoStruct? updatePageItemInfoStruct(
  PageItemInfoStruct? pageItemInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageItemInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageItemInfoStructData(
  Map<String, dynamic> firestoreData,
  PageItemInfoStruct? pageItemInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageItemInfo == null) {
    return;
  }
  if (pageItemInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageItemInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageItemInfoData =
      getPageItemInfoFirestoreData(pageItemInfo, forFieldValue);
  final nestedData =
      pageItemInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageItemInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageItemInfoFirestoreData(
  PageItemInfoStruct? pageItemInfo, [
  bool forFieldValue = false,
]) {
  if (pageItemInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageItemInfo.toMap());

  // Add any Firestore field values
  pageItemInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageItemInfoListFirestoreData(
  List<PageItemInfoStruct>? pageItemInfos,
) =>
    pageItemInfos?.map((e) => getPageItemInfoFirestoreData(e, true)).toList() ??
    [];
