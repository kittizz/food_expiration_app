// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageItemInfoStruct extends FFFirebaseStruct {
  PageItemInfoStruct({
    String? name,
    String? description,
    int? forewarnDay,
    String? category,
    LocationStruct? location,
    String? barcode,
    DateTime? storageDate,
    DateTime? expireDate,
    int? quantity,
    String? unit,
    bool? isArchived,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _forewarnDay = forewarnDay,
        _category = category,
        _location = location,
        _barcode = barcode,
        _storageDate = storageDate,
        _expireDate = expireDate,
        _quantity = quantity,
        _unit = unit,
        _isArchived = isArchived,
        super(firestoreUtilData);

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

  // "forewarnDay" field.
  int? _forewarnDay;
  int get forewarnDay => _forewarnDay ?? 0;
  set forewarnDay(int? val) => _forewarnDay = val;
  void incrementForewarnDay(int amount) => _forewarnDay = forewarnDay + amount;
  bool hasForewarnDay() => _forewarnDay != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;
  void updateLocation(Function(LocationStruct) updateFn) =>
      updateFn(_location ??= LocationStruct());
  bool hasLocation() => _location != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "storageDate" field.
  DateTime? _storageDate;
  DateTime? get storageDate => _storageDate;
  set storageDate(DateTime? val) => _storageDate = val;
  bool hasStorageDate() => _storageDate != null;

  // "expireDate" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? val) => _expireDate = val;
  bool hasExpireDate() => _expireDate != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "isArchived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  set isArchived(bool? val) => _isArchived = val;
  bool hasIsArchived() => _isArchived != null;

  static PageItemInfoStruct fromMap(Map<String, dynamic> data) =>
      PageItemInfoStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        forewarnDay: castToType<int>(data['forewarnDay']),
        category: data['category'] as String?,
        location: LocationStruct.maybeFromMap(data['location']),
        barcode: data['barcode'] as String?,
        storageDate: data['storageDate'] as DateTime?,
        expireDate: data['expireDate'] as DateTime?,
        quantity: castToType<int>(data['quantity']),
        unit: data['unit'] as String?,
        isArchived: data['isArchived'] as bool?,
      );

  static PageItemInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PageItemInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'forewarnDay': _forewarnDay,
        'category': _category,
        'location': _location?.toMap(),
        'barcode': _barcode,
        'storageDate': _storageDate,
        'expireDate': _expireDate,
        'quantity': _quantity,
        'unit': _unit,
        'isArchived': _isArchived,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'forewarnDay': serializeParam(
          _forewarnDay,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'storageDate': serializeParam(
          _storageDate,
          ParamType.DateTime,
        ),
        'expireDate': serializeParam(
          _expireDate,
          ParamType.DateTime,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'isArchived': serializeParam(
          _isArchived,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PageItemInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageItemInfoStruct(
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
        forewarnDay: deserializeParam(
          data['forewarnDay'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        storageDate: deserializeParam(
          data['storageDate'],
          ParamType.DateTime,
          false,
        ),
        expireDate: deserializeParam(
          data['expireDate'],
          ParamType.DateTime,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        isArchived: deserializeParam(
          data['isArchived'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PageItemInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageItemInfoStruct &&
        name == other.name &&
        description == other.description &&
        forewarnDay == other.forewarnDay &&
        category == other.category &&
        location == other.location &&
        barcode == other.barcode &&
        storageDate == other.storageDate &&
        expireDate == other.expireDate &&
        quantity == other.quantity &&
        unit == other.unit &&
        isArchived == other.isArchived;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        forewarnDay,
        category,
        location,
        barcode,
        storageDate,
        expireDate,
        quantity,
        unit,
        isArchived
      ]);
}

PageItemInfoStruct createPageItemInfoStruct({
  String? name,
  String? description,
  int? forewarnDay,
  String? category,
  LocationStruct? location,
  String? barcode,
  DateTime? storageDate,
  DateTime? expireDate,
  int? quantity,
  String? unit,
  bool? isArchived,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageItemInfoStruct(
      name: name,
      description: description,
      forewarnDay: forewarnDay,
      category: category,
      location: location ?? (clearUnsetFields ? LocationStruct() : null),
      barcode: barcode,
      storageDate: storageDate,
      expireDate: expireDate,
      quantity: quantity,
      unit: unit,
      isArchived: isArchived,
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

  // Handle nested data for "location" field.
  addLocationStructData(
    firestoreData,
    pageItemInfo.hasLocation() ? pageItemInfo.location : null,
    'location',
    forFieldValue,
  );

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
