<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A Flutter package to quickly build login screens writing a minimal number of code lines
with automatic REST API authentication feature.

## Features

  - The quickest way to build a login page with Flutter.
  - Automatic login freature via REST API.

## Getting started

All you need to do is import the package and use it as any other widget.
It uses the (http) package for the REST API authentication.

## Usage

```dart
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

```

## Additional information

This is my first published package.
If you find any bugs, errors or something needs to be imporved, contact me with my email.
