// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogStruct extends FFFirebaseStruct {
  BlogStruct({
    int? id,
    String? createdAt,
    String? title,
    String? content,
    ImageStruct? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _createdAt = createdAt,
        _title = title,
        _content = content,
        _image = image,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "Image" field.
  ImageStruct? _image;
  ImageStruct get image => _image ?? ImageStruct();
  set image(ImageStruct? val) => _image = val;
  void updateImage(Function(ImageStruct) updateFn) =>
      updateFn(_image ??= ImageStruct());
  bool hasImage() => _image != null;

  static BlogStruct fromMap(Map<String, dynamic> data) => BlogStruct(
        id: castToType<int>(data['id']),
        createdAt: data['createdAt'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        image: ImageStruct.maybeFromMap(data['Image']),
      );

  static BlogStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BlogStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'createdAt': _createdAt,
        'title': _title,
        'content': _content,
        'Image': _image?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'Image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static BlogStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlogStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        image: deserializeStructParam(
          data['Image'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BlogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BlogStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        title == other.title &&
        content == other.content &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, createdAt, title, content, image]);
}

BlogStruct createBlogStruct({
  int? id,
  String? createdAt,
  String? title,
  String? content,
  ImageStruct? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlogStruct(
      id: id,
      createdAt: createdAt,
      title: title,
      content: content,
      image: image ?? (clearUnsetFields ? ImageStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlogStruct? updateBlogStruct(
  BlogStruct? blog, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blog
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlogStructData(
  Map<String, dynamic> firestoreData,
  BlogStruct? blog,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blog == null) {
    return;
  }
  if (blog.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && blog.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blogData = getBlogFirestoreData(blog, forFieldValue);
  final nestedData = blogData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blog.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlogFirestoreData(
  BlogStruct? blog, [
  bool forFieldValue = false,
]) {
  if (blog == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blog.toMap());

  // Handle nested data for "Image" field.
  addImageStructData(
    firestoreData,
    blog.hasImage() ? blog.image : null,
    'Image',
    forFieldValue,
  );

  // Add any Firestore field values
  blog.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlogListFirestoreData(
  List<BlogStruct>? blogs,
) =>
    blogs?.map((e) => getBlogFirestoreData(e, true)).toList() ?? [];
