import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture/resources/components/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/routes/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  TextEditingController emailCtor = TextEditingController();
  TextEditingController passwordCtor = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailCtor.dispose();
    passwordCtor.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("LOGIN"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtor,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  onFieldSubmitted: (val) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      controller: passwordCtor,
                      obscureText: obscurePassword.value,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.password_sharp),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscurePassword.value = !obscurePassword.value;
                          },
                          child: Icon(obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundButton(
                  title: "Login",
                  onPress: () {
                    if (emailCtor.text.isEmpty) {
                      Utils.flushBarErrorMessage("Enter your email", context);
                    } else if (passwordCtor.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Enter your password", context);
                    } else if (passwordCtor.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          "Password should be atleast 6 characterrs", context);
                    } else {
                      print("api hit");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
