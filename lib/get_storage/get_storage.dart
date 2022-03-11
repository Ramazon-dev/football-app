import 'package:get_storage/get_storage.dart';
import 'package:softcity/get_storage/appkeys.dart';
import 'package:softcity/models/customer.dart';
import 'package:softcity/models/login.dart';

class LocalSource {
  final _localStorage = GetStorage();

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  bool hasProfile() {
    return _localStorage.read<bool>(AppKeys.hasProfile) ?? false;
  }

  String? token() {
    return _localStorage.read(AppKeys.accessToken);
  }

  Future<void> removeProfile() async {
    await _localStorage.remove(AppKeys.hasProfile);
    await _localStorage.remove(AppKeys.customerId);
    await _localStorage.remove(AppKeys.name);
    await _localStorage.remove(AppKeys.locale);
    await _localStorage.remove(AppKeys.phone);
    await _localStorage.remove(AppKeys.accessToken);
    await _localStorage.remove(AppKeys.refreshToken);
    await _localStorage.erase();
  }

  Future<void> setProfile(Customer customer) async {
    await _localStorage.write(AppKeys.hasProfile, true);
    await _localStorage.write(AppKeys.customerId, customer.id);
    await _localStorage.write(AppKeys.name, customer.name);
    await _localStorage.write(AppKeys.phone, customer.phone);
    await _localStorage.write(AppKeys.accessToken, customer.accessToken);
    await _localStorage.write(AppKeys.refreshToken, customer.refreshToken);
    await _localStorage.write(AppKeys.lastName, customer.lastName);
  }

  Future<String> getProfile() async {
    return _localStorage.read(AppKeys.accessToken);
    // await _localStorage.read(AppKeys.name);
    // await _localStorage.read(AppKeys.phone);
    // await _localStorage.read(AppKeys.customerId);
    // await _localStorage.read(AppKeys.refreshToken);
  }
}
