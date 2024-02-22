import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_user')) {
        try {
          final serializedData = prefs.getString('ff_user') ?? '{}';
          _user = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String _value) {
    _deviceId = _value;
    prefs.setString('ff_deviceId', _value);
  }

  List<ItemStruct> _items = [];
  List<ItemStruct> get items => _items;
  set items(List<ItemStruct> _value) {
    _items = _value;
  }

  void addToItems(ItemStruct _value) {
    _items.add(_value);
  }

  void removeFromItems(ItemStruct _value) {
    _items.remove(_value);
  }

  void removeAtIndexFromItems(int _index) {
    _items.removeAt(_index);
  }

  void updateItemsAtIndex(
    int _index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    _items[_index] = updateFn(_items[_index]);
  }

  void insertAtIndexInItems(int _index, ItemStruct _value) {
    _items.insert(_index, _value);
  }

  PageLocationInfoStruct _pageLocationInfo =
      PageLocationInfoStruct.fromSerializableMap(
          jsonDecode('{\"isAdd\":\"true\"}'));
  PageLocationInfoStruct get pageLocationInfo => _pageLocationInfo;
  set pageLocationInfo(PageLocationInfoStruct _value) {
    _pageLocationInfo = _value;
  }

  void updatePageLocationInfoStruct(Function(PageLocationInfoStruct) updateFn) {
    updateFn(_pageLocationInfo);
  }

  PageItemInfoStruct _pageItemInfo = PageItemInfoStruct.fromSerializableMap(
      jsonDecode('{\"location\":\"{\\\"image\\\":\\\"{}\\\"}\"}'));
  PageItemInfoStruct get pageItemInfo => _pageItemInfo;
  set pageItemInfo(PageItemInfoStruct _value) {
    _pageItemInfo = _value;
  }

  void updatePageItemInfoStruct(Function(PageItemInfoStruct) updateFn) {
    updateFn(_pageItemInfo);
  }

  ThumbnailStruct _thumbnail =
      ThumbnailStruct.fromSerializableMap(jsonDecode('{\"image\":\"{}\"}'));
  ThumbnailStruct get thumbnail => _thumbnail;
  set thumbnail(ThumbnailStruct _value) {
    _thumbnail = _value;
  }

  void updateThumbnailStruct(Function(ThumbnailStruct) updateFn) {
    updateFn(_thumbnail);
  }

  List<LocationStruct> _locations = [];
  List<LocationStruct> get locations => _locations;
  set locations(List<LocationStruct> _value) {
    _locations = _value;
  }

  void addToLocations(LocationStruct _value) {
    _locations.add(_value);
  }

  void removeFromLocations(LocationStruct _value) {
    _locations.remove(_value);
  }

  void removeAtIndexFromLocations(int _index) {
    _locations.removeAt(_index);
  }

  void updateLocationsAtIndex(
    int _index,
    LocationStruct Function(LocationStruct) updateFn,
  ) {
    _locations[_index] = updateFn(_locations[_index]);
  }

  void insertAtIndexInLocations(int _index, LocationStruct _value) {
    _locations.insert(_index, _value);
  }

  bool _isDebug = true;
  bool get isDebug => _isDebug;
  set isDebug(bool _value) {
    _isDebug = _value;
  }

  String _cdn = 'th-bkk-1.xvercloud.com';
  String get cdn => _cdn;
  set cdn(String _value) {
    _cdn = _value;
  }

  UserStruct _user = UserStruct.fromSerializableMap(jsonDecode(
      '{\"role\":\"user\",\"nickname\":\"ผู้ใช้\",\"profilePicture\":\"/images/user.png\",\"profilePictureBlurHash\":\"LIEpzCa#1mt7EjWB?Hof5Xoe}fR%\"}'));
  UserStruct get user => _user;
  set user(UserStruct _value) {
    _user = _value;
    prefs.setString('ff_user', _value.serialize());
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    prefs.setString('ff_user', _user.serialize());
  }

  List<AddDateStruct> _addDate = [
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"1 ว\",\"day\":\"1\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"3 ว\",\"day\":\"3\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"5 ว\",\"day\":\"5\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"1 ส\",\"day\":\"7\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"1 ด\",\"day\":\"30\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"3 ด\",\"day\":\"90\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"1 ป\",\"day\":\"365\"}')),
    AddDateStruct.fromSerializableMap(
        jsonDecode('{\"short\":\"2 ส\",\"day\":\"14\"}'))
  ];
  List<AddDateStruct> get addDate => _addDate;
  set addDate(List<AddDateStruct> _value) {
    _addDate = _value;
  }

  void addToAddDate(AddDateStruct _value) {
    _addDate.add(_value);
  }

  void removeFromAddDate(AddDateStruct _value) {
    _addDate.remove(_value);
  }

  void removeAtIndexFromAddDate(int _index) {
    _addDate.removeAt(_index);
  }

  void updateAddDateAtIndex(
    int _index,
    AddDateStruct Function(AddDateStruct) updateFn,
  ) {
    _addDate[_index] = updateFn(_addDate[_index]);
  }

  void insertAtIndexInAddDate(int _index, AddDateStruct _value) {
    _addDate.insert(_index, _value);
  }

  List<String> _categorys = [];
  List<String> get categorys => _categorys;
  set categorys(List<String> _value) {
    _categorys = _value;
  }

  void addToCategorys(String _value) {
    _categorys.add(_value);
  }

  void removeFromCategorys(String _value) {
    _categorys.remove(_value);
  }

  void removeAtIndexFromCategorys(int _index) {
    _categorys.removeAt(_index);
  }

  void updateCategorysAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _categorys[_index] = updateFn(_categorys[_index]);
  }

  void insertAtIndexInCategorys(int _index, String _value) {
    _categorys.insert(_index, _value);
  }

  FilterStruct _filter = FilterStruct.fromSerializableMap(jsonDecode('{}'));
  FilterStruct get filter => _filter;
  set filter(FilterStruct _value) {
    _filter = _value;
  }

  void updateFilterStruct(Function(FilterStruct) updateFn) {
    updateFn(_filter);
  }

  List<KindStruct> _kind = [
    KindStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"รายการ\",\"key\":\"item\"}')),
    KindStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"สถานที่เก็บ\",\"key\":\"location\"}'))
  ];
  List<KindStruct> get kind => _kind;
  set kind(List<KindStruct> _value) {
    _kind = _value;
  }

  void addToKind(KindStruct _value) {
    _kind.add(_value);
  }

  void removeFromKind(KindStruct _value) {
    _kind.remove(_value);
  }

  void removeAtIndexFromKind(int _index) {
    _kind.removeAt(_index);
  }

  void updateKindAtIndex(
    int _index,
    KindStruct Function(KindStruct) updateFn,
  ) {
    _kind[_index] = updateFn(_kind[_index]);
  }

  void insertAtIndexInKind(int _index, KindStruct _value) {
    _kind.insert(_index, _value);
  }

  String _markdownEditor = '';
  String get markdownEditor => _markdownEditor;
  set markdownEditor(String _value) {
    _markdownEditor = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
