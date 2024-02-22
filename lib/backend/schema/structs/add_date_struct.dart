// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddDateStruct extends FFFirebaseStruct {
  AddDateStruct({
    String? short,
    int? day,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _short = short,
        _day = day,
        super(firestoreUtilData);

  // "short" field.
  String? _short;
  String get short => _short ?? '';
  set short(String? val) => _short = val;
  bool hasShort() => _short != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;
  void incrementDay(int amount) => _day = day + amount;
  bool hasDay() => _day != null;

  static AddDateStruct fromMap(Map<String, dynamic> data) => AddDateStruct(
        short: data['short'] as String?,
        day: castToType<int>(data['day']),
      );

  static AddDateStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddDateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'short': _short,
        'day': _day,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'short': serializeParam(
          _short,
          ParamType.String,
        ),
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddDateStruct(
        short: deserializeParam(
          data['short'],
          ParamType.String,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddDateStruct && short == other.short && day == other.day;
  }

  @override
  int get hashCode => const ListEquality().hash([short, day]);
}

AddDateStruct createAddDateStruct({
  String? short,
  int? day,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddDateStruct(
      short: short,
      day: day,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddDateStruct? updateAddDateStruct(
  AddDateStruct? addDate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addDate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddDateStructData(
  Map<String, dynamic> firestoreData,
  AddDateStruct? addDate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addDate == null) {
    return;
  }
  if (addDate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addDate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addDateData = getAddDateFirestoreData(addDate, forFieldValue);
  final nestedData = addDateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addDate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddDateFirestoreData(
  AddDateStruct? addDate, [
  bool forFieldValue = false,
]) {
  if (addDate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addDate.toMap());

  // Add any Firestore field values
  addDate.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddDateListFirestoreData(
  List<AddDateStruct>? addDates,
) =>
    addDates?.map((e) => getAddDateFirestoreData(e, true)).toList() ?? [];
