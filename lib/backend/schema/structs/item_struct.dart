// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemStruct extends FFFirebaseStruct {
  ItemStruct({
    int? id,
    String? name,
    String? description,
    DateTime? storageDate,
    DateTime? expireDate,
    int? forewarnDay,
    bool? isArchived,
    String? category,
    String? barcode,
    ImageStruct? image,
    int? locationId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _description = description,
        _storageDate = storageDate,
        _expireDate = expireDate,
        _forewarnDay = forewarnDay,
        _isArchived = isArchived,
        _category = category,
        _barcode = barcode,
        _image = image,
        _locationId = locationId,
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

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

  // "forewarnDay" field.
  int? _forewarnDay;
  int get forewarnDay => _forewarnDay ?? 0;
  set forewarnDay(int? val) => _forewarnDay = val;
  void incrementForewarnDay(int amount) => _forewarnDay = forewarnDay + amount;
  bool hasForewarnDay() => _forewarnDay != null;

  // "isArchived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  set isArchived(bool? val) => _isArchived = val;
  bool hasIsArchived() => _isArchived != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "image" field.
  ImageStruct? _image;
  ImageStruct get image => _image ?? ImageStruct();
  set image(ImageStruct? val) => _image = val;
  void updateImage(Function(ImageStruct) updateFn) =>
      updateFn(_image ??= ImageStruct());
  bool hasImage() => _image != null;

  // "locationId" field.
  int? _locationId;
  int get locationId => _locationId ?? 0;
  set locationId(int? val) => _locationId = val;
  void incrementLocationId(int amount) => _locationId = locationId + amount;
  bool hasLocationId() => _locationId != null;

  static ItemStruct fromMap(Map<String, dynamic> data) => ItemStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        description: data['description'] as String?,
        storageDate: data['storageDate'] as DateTime?,
        expireDate: data['expireDate'] as DateTime?,
        forewarnDay: castToType<int>(data['forewarnDay']),
        isArchived: data['isArchived'] as bool?,
        category: data['category'] as String?,
        barcode: data['barcode'] as String?,
        image: ImageStruct.maybeFromMap(data['image']),
        locationId: castToType<int>(data['locationId']),
      );

  static ItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'storageDate': _storageDate,
        'expireDate': _expireDate,
        'forewarnDay': _forewarnDay,
        'isArchived': _isArchived,
        'category': _category,
        'barcode': _barcode,
        'image': _image?.toMap(),
        'locationId': _locationId,
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
        'description': serializeParam(
          _description,
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
        'forewarnDay': serializeParam(
          _forewarnDay,
          ParamType.int,
        ),
        'isArchived': serializeParam(
          _isArchived,
          ParamType.bool,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
        'locationId': serializeParam(
          _locationId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemStruct(
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
        description: deserializeParam(
          data['description'],
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
        forewarnDay: deserializeParam(
          data['forewarnDay'],
          ParamType.int,
          false,
        ),
        isArchived: deserializeParam(
          data['isArchived'],
          ParamType.bool,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        image: deserializeStructParam(
          data['image'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        locationId: deserializeParam(
          data['locationId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        storageDate == other.storageDate &&
        expireDate == other.expireDate &&
        forewarnDay == other.forewarnDay &&
        isArchived == other.isArchived &&
        category == other.category &&
        barcode == other.barcode &&
        image == other.image &&
        locationId == other.locationId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        description,
        storageDate,
        expireDate,
        forewarnDay,
        isArchived,
        category,
        barcode,
        image,
        locationId
      ]);
}

ItemStruct createItemStruct({
  int? id,
  String? name,
  String? description,
  DateTime? storageDate,
  DateTime? expireDate,
  int? forewarnDay,
  bool? isArchived,
  String? category,
  String? barcode,
  ImageStruct? image,
  int? locationId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemStruct(
      id: id,
      name: name,
      description: description,
      storageDate: storageDate,
      expireDate: expireDate,
      forewarnDay: forewarnDay,
      isArchived: isArchived,
      category: category,
      barcode: barcode,
      image: image ?? (clearUnsetFields ? ImageStruct() : null),
      locationId: locationId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemStruct? updateItemStruct(
  ItemStruct? item, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    item
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemStructData(
  Map<String, dynamic> firestoreData,
  ItemStruct? item,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (item == null) {
    return;
  }
  if (item.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && item.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemData = getItemFirestoreData(item, forFieldValue);
  final nestedData = itemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = item.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemFirestoreData(
  ItemStruct? item, [
  bool forFieldValue = false,
]) {
  if (item == null) {
    return {};
  }
  final firestoreData = mapToFirestore(item.toMap());

  // Handle nested data for "image" field.
  addImageStructData(
    firestoreData,
    item.hasImage() ? item.image : null,
    'image',
    forFieldValue,
  );

  // Add any Firestore field values
  item.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemListFirestoreData(
  List<ItemStruct>? items,
) =>
    items?.map((e) => getItemFirestoreData(e, true)).toList() ?? [];
