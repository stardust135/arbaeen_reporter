import 'package:hive/hive.dart';

class AppDbManager {
  final String boxName = 'app_db';
  late Box _box;
  late bool hasLoggedIn;
  String? userPhone;

  initValues() async {
    _box = await Hive.openBox(boxName);
    hasLoggedIn = _box.get('hasLoggedIn') ?? false;
    userPhone = _box.get('usePhone');
  }

  setHasLoggedIn(bool value) {
    _box.put('hasLoggedIn', value);
  }

  setUserPhone(String phone) {
    _box.put('userPhone', phone);
  }
}
