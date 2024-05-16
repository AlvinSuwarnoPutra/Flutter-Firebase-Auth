import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginState = StateLogin.initial;
  var username = '';
  var uid = '';
  var messageError = '';
  bool obscurePassword = true;

  void processRegister(BuildContext context, VoidCallback onSuccess) async {
    if (formKeyRegister.currentState!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        User dataUser = result.user!;
        username = emailController.text;
        uid = dataUser.uid;
        loginState = StateLogin.success;
        showAlertSuccess(context, 'Registration Successful!', uid, onSuccess);
      } on FirebaseAuthException catch (error) {
        loginState = StateLogin.error;
        messageError = error.message!;
        showAlertError(context, messageError);
      } catch (e) {
        loginState = StateLogin.error;
        messageError = e.toString();
        showAlertError(context, messageError);
      }
    } else {
      showAlertError(context, 'Please fill out all fields!');
    }

    notifyListeners();
  }

  void processLogin(BuildContext context) async {
    if (formKeyLogin.currentState!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        User dataUser = result.user!;
        username = emailController.text;
        uid = dataUser.uid;
        loginState = StateLogin.success;
        showAlertSuccess(context, 'Login Successful!', uid, () {
          Navigator.pop(context);
        });
      } on FirebaseAuthException catch (error) {
        loginState = StateLogin.error;
        messageError = error.message!;
        showAlertError(context, messageError);
      } catch (e) {
        loginState = StateLogin.error;
        messageError = e.toString();
        showAlertError(context, messageError);
      }
    } else {
      showAlertError(context, 'Please fill out all fields!');
    }

    notifyListeners();
  }

  void actionObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}

enum StateLogin { initial, success, error }

void showAlertError(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'))
        ],
      );
    },
  );
}

void showAlertSuccess(
    BuildContext context, String message, String uid, VoidCallback onSuccess) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Success'),
        content: Text('$message\nUID: $uid'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onSuccess();
              },
              child: const Text('Ok'))
        ],
      );
    },
  );
}
