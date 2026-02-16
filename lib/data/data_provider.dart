import 'package:flutter/cupertino.dart';
import 'package:mydj/data/jurnal.dart';
import 'login_info.dart';

// Note: LoginInfo uses SharedPreferences internally.

class DataProvider extends ChangeNotifier {
  final List<Jurnal> _jurnalTersimpan = [];

  void addNew(Jurnal jurnal) {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }

  List<Jurnal> get jurnalTersimpan => List.unmodifiable(_jurnalTersimpan);

  // Cek sudah login atau belum
  Future<bool> isLoggedIn() async {
    LoginInfo loginInfo = await LoginInfo.fromSharedPreferences();
    return loginInfo.isLoggedIn;
  }

  // Simpan informasi sesi ketika login
  Future<void> saveLoginInfo(String username, String password) async {
    LoginInfo loginInfo = await LoginInfo.fromSharedPreferences();
    // Isi
    loginInfo.username = username;
    loginInfo.password = password;
    loginInfo.isLoggedIn = true;
    // Simpan
    await loginInfo.saveToSharedPreferences();
  }
}
