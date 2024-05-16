import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_Controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoginPage = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthController>();
    return Scaffold(
      body: Form(
        key: isLoginPage
            ? authProvider.formKeyLogin
            : authProvider.formKeyRegister,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
          child: ListView(
            children: [
              Text(
                isLoginPage ? 'Login Page' : 'Register Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                isLoginPage ? 'Welcome Back' : 'Yuk Register Segera',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("lib/assets/images/login.png")],
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                controller: authProvider.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              TextFormField(
                key: ValueKey('password'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                controller: authProvider.passwordController,
                obscureText: authProvider.obscurePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<AuthController>().actionObscurePassword();
                    },
                    icon: Icon(authProvider.obscurePassword == true
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  if (isLoginPage) {
                    context.read<AuthController>().processLogin(context);
                  } else {
                    context.read<AuthController>().processRegister(context, () {
                      setState(() {
                        isLoginPage = true;
                      });
                    },);
                  }
                },
                child: Text(
                  isLoginPage ? 'Login' : 'Register',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 48),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLoginPage = !isLoginPage;
                  });
                },
                child: Text(
                  isLoginPage
                      ? 'Don\'t have an account? Register'
                      : 'Already have an account? Login',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
