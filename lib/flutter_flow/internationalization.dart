import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Welcome
  {
    'bskuw6oo': {
      'en': 'Expiry Date',
      'th': '',
    },
    '6sraxs1o': {
      'en': '!',
      'th': '',
    },
    'hq4say6o': {
      'en': 'Sign in with Email',
      'th': '',
    },
    '9tejcfeh': {
      'en': 'or use social media',
      'th': '',
    },
    'j5ol90b9': {
      'en': 'Sign in with Google',
      'th': '',
    },
    'bhqsii3r': {
      'en': 'Sign in with Facebook',
      'th': '',
    },
    'n2z6jt1p': {
      'en': 'Already have an account? ',
      'th': '',
    },
    'k2p5rijy': {
      'en': ' Sign in!',
      'th': '',
    },
    'aswql8y2': {
      'en': 'Home',
      'th': '',
    },
  },
  // Signup
  {
    'tl7r1e1r': {
      'en': 'Sign up',
      'th': '',
    },
    'i9n9msxo': {
      'en': 'For a great, seamless experience',
      'th': '',
    },
    'gnhy1df6': {
      'en': 'Name',
      'th': '',
    },
    'zca0py13': {
      'en': 'Email',
      'th': '',
    },
    'b9z5c9ac': {
      'en': 'Password',
      'th': '',
    },
    '52k92fhb': {
      'en': 'Password',
      'th': '',
    },
    '5aseghnx': {
      'en': 'Sign up',
      'th': '',
    },
    'jfg55dv0': {
      'en': 'Home',
      'th': '',
    },
  },
  // Signin
  {
    'buzk97zh': {
      'en': 'Return to the menu and notification system.',
      'th': '',
    },
    '4kyjks4e': {
      'en': 'Email',
      'th': '',
    },
    'swoe8qlq': {
      'en': 'me@kittiza.com',
      'th': '',
    },
    'azncqrv2': {
      'en': 'Password',
      'th': '',
    },
    'plqsr9x6': {
      'en': 'zxc25861',
      'th': '',
    },
    '1alufxxe': {
      'en': 'Forgot your password?',
      'th': '',
    },
    'ih1pvoae': {
      'en': 'Login',
      'th': '',
    },
    'umsfxfp3': {
      'en': 'Home',
      'th': '',
    },
  },
  // ForgotPassword
  {
    '5zgmpd1d': {
      'en': 'Forgot your password',
      'th': '',
    },
    '3ju9m9fy': {
      'en': 'Enter your email to receive an OTP to change your password.',
      'th': '',
    },
    'ktpebxoj': {
      'en': 'Email Address',
      'th': '',
    },
    'd8ab4v5r': {
      'en': 'Send',
      'th': '',
    },
    'vcvr0rdo': {
      'en': 'Home',
      'th': '',
    },
  },
  // Home
  {
    '84eknr3b': {
      'en': 'search...',
      'th': '',
    },
    '5msld3q9': {
      'en': 'Items',
      'th': '',
    },
    'uci58zhy': {
      'en': 'Storage',
      'th': '',
    },
    'n60xch9g': {
      'en': 'Archived',
      'th': '',
    },
    'uhvkz1ai': {
      'en': 'Settings',
      'th': '',
    },
    'upl7eyzw': {
      'en': 'Knowledge articles',
      'th': '',
    },
    'cpn4mztq': {
      'en': 'Home',
      'th': '',
    },
  },
  // Blog
  {
    '6fh86wfd': {
      'en': 'Includes articles about food and other nutrition.',
      'th': '',
    },
    'cechgn8m': {
      'en': 'Knowledge articles',
      'th': '',
    },
    'hnkfoldq': {
      'en': 'Home',
      'th': '',
    },
  },
  // BlogPost
  {
    'woq8ecbv': {
      'en': 'Home',
      'th': '',
    },
  },
  // ItemList
  {
    'kay0ratk': {
      'en': 'search...',
      'th': '',
    },
    'fhj3tpfw': {
      'en': 'search...',
      'th': '',
    },
    'k3hgegjn': {
      'en': 'Storage',
      'th': '',
    },
    'yxt0npbn': {
      'en': 'Search for items...',
      'th': '',
    },
    'y69jdgjk': {
      'en': 'Category',
      'th': '',
    },
    'oyk95vyq': {
      'en': 'Search for items...',
      'th': '',
    },
    'umwyoofu': {
      'en': 'Expired',
      'th': '',
    },
    '2665s624': {
      'en': 'About to expire',
      'th': '',
    },
    '3o3jxuok': {
      'en': 'Remaining',
      'th': '',
    },
    'snbouel1': {
      'en': 'Expiration',
      'th': '',
    },
    '42zvgu1u': {
      'en': 'Search for an item...',
      'th': '',
    },
    'wn4yhd8y': {
      'en': 'Home',
      'th': '',
    },
    '90atx2hx': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // LocationInfo
  {
    'h1wyksg3': {
      'en': 'Add a photo',
      'th': '',
    },
    'rhik2hq1': {
      'en': 'Upload photos here...',
      'th': '',
    },
    'z0m1ey5r': {
      'en': 'Upload',
      'th': '',
    },
    'jyto7gju': {
      'en': 'or',
      'th': '',
    },
    '343kb8yf': {
      'en': 'Select picture',
      'th': '',
    },
    'zk9dyxpe': {
      'en': 'Storage  name',
      'th': '',
    },
    'mmyvdra0': {
      'en': 'Note',
      'th': '',
    },
    'dw0hgpb5': {
      'en': 'Field is required',
      'th': '',
    },
    'nyuw6v8m': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'zxddd6y1': {
      'en': 'Field is required',
      'th': '',
    },
    'vw7ldkd9': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '4uabuobl': {
      'en': 'Home',
      'th': '',
    },
  },
  // LocationList
  {
    '53fax77t': {
      'en': 'Add',
      'th': '',
    },
    'jgngsj3n': {
      'en': 'Storages',
      'th': '',
    },
    'c8yzlq8v': {
      'en': 'Home',
      'th': '',
    },
  },
  // Archived
  {
    'izlqo1kz': {
      'en': 'Archived',
      'th': '',
    },
    'gfedhgfm': {
      'en': 'Home',
      'th': '',
    },
  },
  // Setting
  {
    'or3o9b8g': {
      'en': 'Settings',
      'th': '',
    },
    '4385nih5': {
      'en': 'Notifications',
      'th': '',
    },
    'gjaj6gd1': {
      'en': 'Notifications',
      'th': '',
    },
    '1fwy28ke': {
      'en': 'Receive notifications from the application',
      'th': '',
    },
    'yt4mtp8m': {
      'en': 'Send  notifications at',
      'th': '',
    },
    '9gek6mu0': {
      'en': 'Set a time to receive notifications every day.',
      'th': '',
    },
    'n7cppjwy': {
      'en': 'Profile',
      'th': '',
    },
    '8cls3emy': {
      'en': 'Save',
      'th': '',
    },
    '7f5rptws': {
      'en': 'Name',
      'th': '',
    },
    'raygdrcg': {
      'en': 'Sign out',
      'th': '',
    },
    'x8vi4gn8': {
      'en': 'Home',
      'th': '',
    },
  },
  // ThumbnailCategory
  {
    '9g997eyf': {
      'en': 'Please select an image category.',
      'th': '',
    },
    'tt014sab': {
      'en': 'Category',
      'th': '',
    },
    'w42bf5m7': {
      'en': 'Home',
      'th': '',
    },
  },
  // ThumbnailSelection
  {
    'el9k8vp3': {
      'en': 'Please select a picture.',
      'th': '',
    },
    'ulmaqq2e': {
      'en': 'Pictures',
      'th': '',
    },
    'xnkl1ite': {
      'en': 'Home',
      'th': '',
    },
  },
  // ThumbnailViewer
  {
    'v8y5yk21': {
      'en': 'Cancel',
      'th': '',
    },
    'u3uarbkh': {
      'en': 'Confirm',
      'th': '',
    },
    'o7zp6jkb': {
      'en': 'Home',
      'th': '',
    },
  },
  // ItemInfo
  {
    'juadnolt': {
      'en': 'Add a photo',
      'th': '',
    },
    '07v9ry29': {
      'en': 'Upload photos here...',
      'th': '',
    },
    'k8z306gt': {
      'en': 'View',
      'th': '',
    },
    'bumq7p0j': {
      'en': 'Gallery',
      'th': '',
    },
    'lv8rurwn': {
      'en': 'name',
      'th': '',
    },
    'fdxbaz1u': {
      'en': 'note',
      'th': '',
    },
    'niy8ef4c': {
      'en': 'Recover',
      'th': '',
    },
    'gxn38t5w': {
      'en': 'Move to archived',
      'th': '',
    },
    '12jorak8': {
      'en': 'Please enter the name of the item.',
      'th': '',
    },
    'r7fkq51j': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '0kq8mrly': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'zqbb4f02': {
      'en': 'Category',
      'th': '',
    },
    'b14xeh98': {
      'en': '1',
      'th': '',
    },
    'moljvwoy': {
      'en': 'Choose...',
      'th': '',
    },
    '7dawdbqa': {
      'en': 'Search category...',
      'th': '',
    },
    'hg69anhn': {
      'en': 'Storage ',
      'th': '',
    },
    'nqws6ws7': {
      'en': '1',
      'th': '',
    },
    'jvyr9bub': {
      'en': 'Choose...',
      'th': '',
    },
    '2afhl1rf': {
      'en': 'Find a storage...',
      'th': '',
    },
    '0toljndu': {
      'en': 'Barcode',
      'th': '',
    },
    'zcvtk8n9': {
      'en': 'Scan',
      'th': '',
    },
    'i07t0e8c': {
      'en': 'Advance notification (days)',
      'th': '',
    },
    's2rnfgzt': {
      'en': 'Storage date',
      'th': '',
    },
    't2h35zv0': {
      'en': 'Expiration date',
      'th': '',
    },
    '9pbzxvve': {
      'en': 'Reset',
      'th': '',
    },
    'l12omsze': {
      'en': 'Scan',
      'th': '',
    },
    '4zbf4gt1': {
      'en': 'Please fill out notification in advance.',
      'th': '',
    },
    'i4sh6mac': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '2olh9l70': {
      'en': 'Quantity',
      'th': '',
    },
    'yp72eiii': {
      'en': 'item',
      'th': '',
    },
    'r0i8t97a': {
      'en': 'wrap',
      'th': '',
    },
    '2ta6f6r7': {
      'en': 'bag',
      'th': '',
    },
    '6lhybi8m': {
      'en': 'bottle',
      'th': '',
    },
    'j0peclxo': {
      'en': 'box',
      'th': '',
    },
    'cn807wsj': {
      'en': 'unit',
      'th': '',
    },
    '9iwe0iyy': {
      'en': 'Unit',
      'th': '',
    },
    'qpmndrue': {
      'en': 'Find a storage...',
      'th': '',
    },
    '0payu2p3': {
      'en': 'Please enter quantity',
      'th': '',
    },
    '42quvkk3': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'elsi6gtl': {
      'en': 'Home',
      'th': '',
    },
    '6qoom4gp': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // Splash
  {
    'ugz5042v': {
      'en': 'Expiry Date',
      'th': '',
    },
    'iis7f2xz': {
      'en': '!',
      'th': '',
    },
    'qupfai8p': {
      'en': 'Home',
      'th': '',
    },
  },
  // AdminDashboard
  {
    'c5xeaq9z': {
      'en': 'ผู้ใช้งาน ทั้งหมด',
      'th': '',
    },
    'ei9jumvr': {
      'en': 'คน',
      'th': '',
    },
    '86ag7vku': {
      'en': 'จำนวน รายการ ทั้งหมด',
      'th': '',
    },
    'a27m9rg4': {
      'en': 'รายการ',
      'th': '',
    },
    'j7vp9193': {
      'en': 'จำนวน สถานที่เก็บ ทั้งหมด',
      'th': '',
    },
    '8qgi5nlx': {
      'en': 'แหล่ง',
      'th': '',
    },
    'urboaoxx': {
      'en': 'Home',
      'th': '',
    },
  },
  // AdminImage
  {
    'e5moehbi': {
      'en': 'คลังภาพ',
      'th': '',
    },
    'hh8pppsh': {
      'en': 'ประเภท',
      'th': '',
    },
    '2y3hnwsv': {
      'en': 'หมวดหมู่',
      'th': '',
    },
    'vr8xgawd': {
      'en': 'เพิ่ม',
      'th': '',
    },
    'afbxam0j': {
      'en': 'ลบ',
      'th': '',
    },
    'u0s13zyz': {
      'en': 'เปลี่ยนชื่อ',
      'th': '',
    },
    'fc7o6377': {
      'en': 'เลือกภาพ',
      'th': '',
    },
    'gw8b4ujj': {
      'en': 'ยกเลิก',
      'th': '',
    },
    'xjr9dvfl': {
      'en': 'ภาพ',
      'th': '',
    },
    '1pc8ws6h': {
      'en': 'เพิ่ม',
      'th': '',
    },
    'hjahqbu7': {
      'en': '(โปรดเลือกหมวดหมู่)',
      'th': '',
    },
    'txsx3pg2': {
      'en': 'Home',
      'th': '',
    },
  },
  // AdminCategory
  {
    'u8w65r8a': {
      'en': 'หมวดหมู่',
      'th': '',
    },
    'bvyyl93c': {
      'en': 'บันทึก',
      'th': '',
    },
    'n90cjscx': {
      'en': 'หมวดหมู่',
      'th': '',
    },
    'xl9ljc88': {
      'en': 'Home',
      'th': '',
    },
  },
  // AdminBlog
  {
    'pjruehit': {
      'en': 'บทความ',
      'th': '',
    },
    'c64mty4z': {
      'en': 'เพิ่ม',
      'th': '',
    },
    '62w579j7': {
      'en': '\tหัวข้อ...',
      'th': '',
    },
    'hqj0vfh5': {
      'en': '(เลือกภาพ)',
      'th': '',
    },
    'jqn8ualu': {
      'en': 'บันทึก',
      'th': '',
    },
    '7jhm6547': {
      'en': 'ยกเลิก',
      'th': '',
    },
    'd5x4rq5b': {
      'en': 'เลือกภาพ',
      'th': '',
    },
    'czskkd9v': {
      'en': 'ลบ',
      'th': '',
    },
    'hacexiez': {
      'en': 'ทั้งหมด',
      'th': '',
    },
    'ln2cw1vr': {
      'en': 'แก้ไข',
      'th': '',
    },
    'ts5n7ots': {
      'en': 'อัปโหลดภาพ',
      'th': '',
    },
    'uw8vebvp': {
      'en': 'ลิ้งภาพ...',
      'th': '',
    },
    '2w88rgxm': {
      'en': 'คัดลอก',
      'th': '',
    },
    '7p1a5e65': {
      'en': 'Home',
      'th': '',
    },
  },
  // ListItems
  {
    'gxq9u7ap': {
      'en': 'Discard',
      'th': '',
    },
    'l7sigmac': {
      'en': 'There are no items.',
      'th': '',
    },
  },
  // noLocation
  {
    '39ykv9cj': {
      'en': 'There is no storage location.',
      'th': '',
    },
  },
  // sideNav
  {
    's1kz0c1i': {
      'en': 'ผู้ดูแลระบบ',
      'th': '',
    },
    '9ubvfjgb': {
      'en': 'แดชบอร์ด',
      'th': '',
    },
    '9i6597tv': {
      'en': 'คลังภาพ',
      'th': '',
    },
    'echjr5rc': {
      'en': 'หมวดหมู่',
      'th': '',
    },
    'ehosxlts': {
      'en': 'บทความ',
      'th': '',
    },
    'glwyy0rp': {
      'en': 'ออกจากระบบ',
      'th': '',
    },
  },
  // ModalAdminAddImage
  {
    'boyveh8t': {
      'en': 'Add Photo',
      'th': '',
    },
    'fghvq5qy': {
      'en': 'Upload an image here...',
      'th': '',
    },
    'ew1mq539': {
      'en': 'ชื่อ',
      'th': '',
    },
    'xvs1wvmo': {
      'en': 'Option 1',
      'th': '',
    },
    '1v7a6msn': {
      'en': 'เลือกชนิด....',
      'th': '',
    },
    'gf1r76ct': {
      'en': 'Search for an item...',
      'th': '',
    },
    '9z1omedk': {
      'en': 'สร้าง',
      'th': '',
    },
    '9umda4mk': {
      'en': 'Field is required',
      'th': '',
    },
    'hxyvtmfp': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
  },
  // ModalRename
  {
    'jz2szer5': {
      'en': 'Change name',
      'th': '',
    },
    'j9jw170q': {
      'en': 'Leave note here...',
      'th': '',
    },
    'h0goderm': {
      'en': 'Save',
      'th': '',
    },
  },
  // ModalAdminEditImage
  {
    'rsx9y5mm': {
      'en': 'Add Photo',
      'th': '',
    },
    'p6hy7k64': {
      'en': 'Upload an image here...',
      'th': '',
    },
    'qawtfrbp': {
      'en': 'Confirm',
      'th': '',
    },
    'x152vunc': {
      'en': 'Field is required',
      'th': '',
    },
    'rmqelayq': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
  },
  // Miscellaneous
  {
    'spfwi0pu': {
      'en': '',
      'th': '',
    },
    'o432812a': {
      'en': '',
      'th': '',
    },
    'hehmwra5': {
      'en': 'Used for notifications within this app.',
      'th': '',
    },
    'ks7efllk': {
      'en': 'ข้อผิดพลาด : [error]',
      'th': '',
    },
    'u3ihkk4s': {
      'en': 'ส่งอีเมลรีเซ็ตรหัสผ่าน!',
      'th': '',
    },
    'tbt57yq1': {
      'en': 'ต้องใช้ อีเมล!',
      'th': '',
    },
    '2hk1gooq': {
      'en': 'ต้องระบุหมายเลขโทรศัพท์และต้องขึ้นต้นด้วย +',
      'th': '',
    },
    'p478g7n7': {
      'en': 'รหัสผ่านไม่ตรงกัน',
      'th': '',
    },
    '39srqso8': {
      'en': 'ป้อนรหัสยืนยันทาง SMS',
      'th': '',
    },
    '47l909fi': {
      'en':
          'นานเกินไปนับตั้งแต่ลงชื่อเข้าใช้ครั้งล่าสุด ลงชื่อเข้าใช้อีกครั้งก่อนที่จะลบบัญชีของคุณ',
      'th': '',
    },
    'xi94kqji': {
      'en':
          'นานเกินไปนับตั้งแต่ลงชื่อเข้าใช้ครั้งล่าสุด ลงชื่อเข้าใช้อีกครั้งก่อนอัปเดตอีเมลของคุณ',
      'th': '',
    },
    'qeprk0uu': {
      'en': 'ป้อน อีเมล ยืนยันการเปลี่ยนแปลงอีเมล',
      'th': '',
    },
    'oqm7ic3f': {
      'en': 'รูปแบบไฟล์ไม่ถูกต้อง',
      'th': '',
    },
    'bqork282': {
      'en': 'กำลังอัปโหลดไฟล์...',
      'th': '',
    },
    '0ocpkb7r': {
      'en': 'อัปโหลดสำเร็จ',
      'th': '',
    },
    'smu3p0tz': {
      'en': 'อัปโหลดข้อมูลผิดพลาด',
      'th': '',
    },
    '1jnrfawq': {
      'en': '',
      'th': '',
    },
    '54j7oeqm': {
      'en': 'เลือก แหล่งที่มา',
      'th': '',
    },
    'cquvznph': {
      'en': 'แกลเลอรี่',
      'th': '',
    },
    'hai4aoss': {
      'en': 'แกลเลอรี่ (รูปถ่าย)',
      'th': '',
    },
    'z18jd9ms': {
      'en': 'แกลเลอรี่  (วีดีโอ)',
      'th': '',
    },
    'r8vd4qds': {
      'en': 'กล้อง',
      'th': '',
    },
    '03xltj3h': {
      'en': '',
      'th': '',
    },
    'n2z83hnw': {
      'en': '',
      'th': '',
    },
    'onttd8uy': {
      'en': '',
      'th': '',
    },
    'maqpzyvu': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
