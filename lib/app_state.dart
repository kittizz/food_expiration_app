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

  String _thumbnailCategoryMode = '';
  String get thumbnailCategoryMode => _thumbnailCategoryMode;
  set thumbnailCategoryMode(String _value) {
    _thumbnailCategoryMode = _value;
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
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
