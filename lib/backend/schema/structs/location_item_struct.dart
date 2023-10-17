// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationItemStruct extends FFFirebaseStruct {
  LocationItemStruct({
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

  static LocationItemStruct fromMap(Map<String, dynamic> data) =>
      LocationItemStruct(
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
      );

  static LocationItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LocationItemStruct.fromMap(data) : null;

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
      }.withoutNulls;

  static LocationItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationItemStruct(
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
      );

  @override
  String toString() => 'LocationItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationItemStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        storageDate == other.storageDate &&
        expireDate == other.expireDate &&
        forewarnDay == other.forewarnDay &&
        isArchived == other.isArchived &&
        category == other.category &&
        barcode == other.barcode &&
        image == other.image;
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
        image
      ]);
}

LocationItemStruct createLocationItemStruct({
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationItemStruct(
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
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationItemStruct? updateLocationItemStruct(
  LocationItemStruct? locationItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationItemStructData(
  Map<String, dynamic> firestoreData,
  LocationItemStruct? locationItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationItem == null) {
    return;
  }
  if (locationItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationItemData =
      getLocationItemFirestoreData(locationItem, forFieldValue);
  final nestedData =
      locationItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationItemFirestoreData(
  LocationItemStruct? locationItem, [
  bool forFieldValue = false,
]) {
  if (locationItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationItem.toMap());

  // Handle nested data for "image" field.
  addImageStructData(
    firestoreData,
    locationItem.hasImage() ? locationItem.image : null,
    'image',
    forFieldValue,
  );

  // Add any Firestore field values
  locationItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationItemListFirestoreData(
  List<LocationItemStruct>? locationItems,
) =>
    locationItems?.map((e) => getLocationItemFirestoreData(e, true)).toList() ??
    [];
