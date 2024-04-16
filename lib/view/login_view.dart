import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/routes/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, RoutesName.home);
            // Utils.toastMessage("toast message");
            Utils.flushBarErrorMessage("no internet", context);
          },
          child: Text("CLICK"),
        ),
      ),
    );
  }
}
