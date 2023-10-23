// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterStruct extends FFFirebaseStruct {
  FilterStruct({
    String? search,
    String? barcode,
    List<String>? location,
    List<String>? category,
    List<String>? expStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _search = search,
        _barcode = barcode,
        _location = location,
        _category = category,
        _expStatus = expStatus,
        super(firestoreUtilData);

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  set search(String? val) => _search = val;
  bool hasSearch() => _search != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "location" field.
  List<String>? _location;
  List<String> get location => _location ?? const [];
  set location(List<String>? val) => _location = val;
  void updateLocation(Function(List<String>) updateFn) =>
      updateFn(_location ??= []);
  bool hasLocation() => _location != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  set category(List<String>? val) => _category = val;
  void updateCategory(Function(List<String>) updateFn) =>
      updateFn(_category ??= []);
  bool hasCategory() => _category != null;

  // "expStatus" field.
  List<String>? _expStatus;
  List<String> get expStatus => _expStatus ?? const [];
  set expStatus(List<String>? val) => _expStatus = val;
  void updateExpStatus(Function(List<String>) updateFn) =>
      updateFn(_expStatus ??= []);
  bool hasExpStatus() => _expStatus != null;

  static FilterStruct fromMap(Map<String, dynamic> data) => FilterStruct(
        search: data['search'] as String?,
        barcode: data['barcode'] as String?,
        location: getDataList(data['location']),
        category: getDataList(data['category']),
        expStatus: getDataList(data['expStatus']),
      );

  static FilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FilterStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'search': _search,
        'barcode': _barcode,
        'location': _location,
        'category': _category,
        'expStatus': _expStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'search': serializeParam(
          _search,
          ParamType.String,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
          true,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
          true,
        ),
        'expStatus': serializeParam(
          _expStatus,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static FilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterStruct(
        search: deserializeParam(
          data['search'],
          ParamType.String,
          false,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        location: deserializeParam<String>(
          data['location'],
          ParamType.String,
          true,
        ),
        category: deserializeParam<String>(
          data['category'],
          ParamType.String,
          true,
        ),
        expStatus: deserializeParam<String>(
          data['expStatus'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'FilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterStruct &&
        search == other.search &&
        barcode == other.barcode &&
        listEquality.equals(location, other.location) &&
        listEquality.equals(category, other.category) &&
        listEquality.equals(expStatus, other.expStatus);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([search, barcode, location, category, expStatus]);
}

FilterStruct createFilterStruct({
  String? search,
  String? barcode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterStruct(
      search: search,
      barcode: barcode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterStruct? updateFilterStruct(
  FilterStruct? filter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterStructData(
  Map<String, dynamic> firestoreData,
  FilterStruct? filter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filter == null) {
    return;
  }
  if (filter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterData = getFilterFirestoreData(filter, forFieldValue);
  final nestedData = filterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterFirestoreData(
  FilterStruct? filter, [
  bool forFieldValue = false,
]) {
  if (filter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filter.toMap());

  // Add any Firestore field values
  filter.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterListFirestoreData(
  List<FilterStruct>? filters,
) =>
    filters?.map((e) => getFilterFirestoreData(e, true)).toList() ?? [];
