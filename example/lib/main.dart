import 'package:flutter/material.dart';
import 'package:rest_login/rest_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginController controller = LoginController(
    url: "https://example/api/login",
    body: {
      "email": "example@gmail.com",
      "password": "123456",
    },
    headers: {"Content-Type": "application/json"}, // Default value
    tokenPath: ["data"],
    apiTokenKey: "accessToken",
    hasLoading: true, // Default value
  );

  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return RestLogin(
      loginController: controller,
      emailController: emailCon,
      passwordController: passwordCon,
      context: context,
      obscurePassword: obscurePassword,
      rememberMeOption: false,
      onShowPassword: () {
        setState(() {
          obscurePassword = !obscurePassword;
        });
      },
      loginOptions: const ["google", "apple"],
      withGoogle: () {
        // Sign in with Google
      },
      withApple: () {
        // Sign in with Apple
      },
      afterLogin: () {
        debugPrint(controller.accessToken);
      },
    );
  }
}
