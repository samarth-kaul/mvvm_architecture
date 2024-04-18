import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/repos/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/routes/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("Login Successful", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      Utils.flushBarErrorMessage("Register Successful", context);
      if (kDebugMode) {
        print(value.toString());
      }
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
