library rest_login;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestLogin extends StatelessWidget {
  ///
  /// [loginController] is required only when
  /// auto REST API authentication is intended.
  final LoginController? loginController;

  ///
  /// [context] is required for loading indicator.
  final BuildContext context;
  final AppBar? appBar;
  final bool? resizeToAvoidBottomInset;

  ///
  /// [logo] fits inside the [header container]
  ///
  /// doesn't necessarily have to be an image,
  /// it can be any widget.
  final Widget? logo;

  ///
  /// [backgroundColor] is the page background color.
  final Color? backgroundColor;

  ///
  /// [logoAlignment] defines the position of the [logo] widget.
  final AlignmentDirectional? logoAlignment;

  final double? headerHeight;

  final EdgeInsets? headerPadding;

  ///
  /// header background color.
  final Color headerColor;

  ///
  /// [contentPadding] only takes effect below the header container.
  final EdgeInsets? contentPadding;

  /// [flexibleWidget] takes place at the bottom of the page.
  ///
  /// It takes any widget type.
  final Widget? flexibleWidget;

  ///
  /// [loginOptions] only takes three pre-defined options,
  ///
  /// inside a list of strings ["google", "apple", "facebook"].
  ///
  /// It creates a clickable button for each option exists in the list.
  ///
  /// Each button has a callback function property that can be used.
  final List<String> loginOptions;

  // Textfield attributes
  final double? fieldHeight;
  final EdgeInsets? fieldPadding;
  final EdgeInsets fieldMargin;
  final Color? fieldFillColor;
  final double? fieldRadius;
  final Color? fieldBorderColor;
  final double? fieldBorderThickness;
  final Color? cursorColor;
  final bool emailField;
  final bool passwordField;
  final bool phoneField;
  final Function(String? value)? emailValidation;
  final Function(String? value)? passwordValidation;
  final Function(String? value)? phoneValidation;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? phoneController;

  ///
  /// Enable or disable the prefixIcon in all textfields.
  final bool fieldIcon;

  ///
  /// Icon color in all textfields.
  final Color? iconColor;
  final IconData? emailIcon;
  final IconData? passwordIcon;
  final IconData? phoneIcon;
  final bool? enableLabel;
  final bool? fixedLabel;
  final String? emailLabel;
  final String? passwordLabel;
  final String? phoneLabel;
  final bool? enableHint;
  final String? emailHint;
  final String? passwordHint;
  final String? phoneHint;
  final TextStyle? fieldStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool obscurePassword;
  final bool hasBorder;

  ///
  /// Show or hide obscureText icon in the password textfield.
  final bool visiblePassword;

  ///
  /// [visiblePasswordIcon] is the password textfield suffixIcon.
  final Icon? visiblePasswordIcon;

  ///
  /// The action taken when the password's textfield suffixIcon is pressed.
  ///
  /// Required when there is an obscure text functionality.
  final Function()? onShowPassword;

  // Login Button
  final Widget? loginButton;
  final bool bottomLoginButton;
  final double loginButtonWidth;
  final double loginButtonHeight;
  final double loginElevation;
  final Color loginButtonColor;
  final Color loginShadowColor;
  final double loginButtonRadius;
  final double loginButtonBorderWidth;
  final Color loginButtonBorderColor;
  final bool loginButtonSplash;
  final Color loginButtonHighlightColor;
  final Text loginText;
  final Icon? loginIcon;

  ///
  /// [onLogin] is required only when the [loginController] is null.
  ///
  /// [loginController] is overridden when [onLogin] is provided (not null).
  final Function()? onLogin;

  ///
  /// Callback function for Google option.
  final Function()? withGoogle;

  ///
  /// Callback function for Apple option.
  final Function()? withApple;

  ///
  /// Callback function for Facebook option.
  final Function()? withFacebook;

  ///
  /// [afterLogin] function is invoked after getting the token API successfully.
  final Function? afterLogin;

  ///
  /// [onSubmitted] is required only when the [loginController] is null.
  ///
  /// [loginController] is overridden when [onSubmitted] is provided (not null).
  final Function(String value)? onSubmitted;

  // Forgot password
  ///
  /// Hide or show forgot password option.
  final bool forgotpasswordOption;
  final String forgotPassText;
  final TextStyle forgotPassStyle;

  ///
  /// Callback function.
  final Function()? onForgot;

  // Remember me option
  ///
  /// Hide or show forgot remember me option.
  final bool rememberMeOption;
  final String rememberMeText;
  final TextStyle? rememberMeStyle;

  ///
  /// Remember me value (true, false).
  final bool rememberMeValue;

  ///
  /// Callback function.
  final Function(bool? value)? onRemeberMe;

  const RestLogin({
    super.key,
    this.appBar,
    this.loginController,
    required this.context,
    this.resizeToAvoidBottomInset = false,
    this.logo,
    this.backgroundColor = Colors.white,
    this.logoAlignment = AlignmentDirectional.center,
    this.headerHeight = 100.0,
    this.headerPadding,
    this.headerColor = Colors.white,
    this.contentPadding = const EdgeInsets.all(30.0),
    this.flexibleWidget,
    this.loginOptions = const [],
    this.fieldHeight = 60,
    this.fieldPadding = const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 15,
    ),
    this.fieldMargin = const EdgeInsets.only(top: 20.0),
    this.fieldFillColor = Colors.black12,
    this.fieldRadius = 8,
    this.fieldBorderColor = Colors.black,
    this.fieldBorderThickness = 1.0,
    this.cursorColor = Colors.black,
    this.emailField = true,
    this.passwordField = true,
    this.phoneField = false,
    this.emailValidation,
    this.passwordValidation,
    this.phoneValidation,
    this.emailController,
    this.passwordController,
    this.phoneController,
    this.iconColor = Colors.black,
    this.fieldIcon = true,
    this.emailIcon = Icons.email,
    this.passwordIcon = Icons.lock,
    this.phoneIcon = Icons.phone_android,
    this.enableLabel = false,
    this.fixedLabel = true,
    this.emailLabel = "Email",
    this.passwordLabel = "Password",
    this.phoneLabel = "Mobile Number",
    this.enableHint = true,
    this.emailHint = "example@gmail.com",
    this.passwordHint = "Enter password",
    this.phoneHint = "+966 50......",
    this.fieldStyle,
    this.labelStyle,
    this.hintStyle,
    required this.obscurePassword,
    this.hasBorder = false,
    this.visiblePassword = true,
    this.visiblePasswordIcon,
    this.onShowPassword,
    // Login Button Attributes
    this.loginButton,
    this.bottomLoginButton = true,
    this.loginButtonWidth = double.infinity,
    this.loginButtonHeight = 50,
    this.loginElevation = 10,
    this.loginButtonColor = Colors.deepOrange,
    this.loginShadowColor = Colors.black45,
    this.loginButtonRadius = 8,
    this.loginButtonBorderWidth = 0,
    this.loginButtonBorderColor = Colors.black,
    this.loginButtonSplash = false,
    this.loginButtonHighlightColor = Colors.white24,
    this.loginText = const Text(
      "Login",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    this.loginIcon,
    this.onLogin,
    this.withGoogle,
    this.withApple,
    this.withFacebook,
    this.afterLogin,
    this.onSubmitted,
    this.forgotpasswordOption = true,
    this.forgotPassText = "Forgot your password?",
    this.forgotPassStyle = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
    ),
    this.onForgot,
    this.rememberMeOption = true,
    this.rememberMeText = "Remember me",
    this.rememberMeStyle,
    this.rememberMeValue = false,
    this.onRemeberMe,
  });

  Future<void> loginValidation() async {
    if (loginController != null) {
      if (loginController!.hasLoading) {
        loading();
      }

      try {
        final response = await http.post(
          Uri.parse(loginController!.url),
          headers: loginController!.headers,
          body: jsonEncode(loginController!.body),
        );

        if (response.statusCode == 200) {
          Map map = jsonDecode(response.body);
          Map data = map;
          loginController!.data = map;

          for (int i = 0; i < loginController!.tokenPath.length; i++) {
            data = data[loginController!.tokenPath[i]];
          }

          String? token = data[loginController!.apiTokenKey];

          if (token != null) {
            if (loginController!.hasLoading) {
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
            if (loginController!.printToken) {
              debugPrint("Token: $token");
            }
            afterLogin!();
          }
          loginController!.accessToken = token;
        } else {
          loginController!.accessToken = null;
          if (loginController!.hasLoading) {
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            debugPrint("Status Code: ${response.statusCode}");
          }
        }
      } catch (e) {
        loginController!.accessToken = null;
        debugPrint("API request failed!");
      }
    }
  }

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            height: 120,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: false,
      appBar: appBar ??
          AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: headerColor,
          ),
      body: Form(
        child: Container(
          color: backgroundColor,
          child: Column(
            children: [
              // This is a flexible area at the top of the page
              // You can put your logo or text here
              // You can control the height of the space as well as
              // controlling the alignment as you wish
              Container(
                color: headerColor,
                padding: headerPadding,
                alignment: logoAlignment,
                height: headerHeight,
                child: logo,
              ),

              // Content
              Expanded(
                child: Container(
                  padding: contentPadding,
                  child: Column(
                    children: [
                      // Email Textfield
                      if (emailField)
                        Container(
                          height: fieldHeight,
                          margin: fieldMargin,
                          child: TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: cursorColor,
                            style: fieldStyle,
                            decoration: InputDecoration(
                              filled: fieldFillColor != null ? true : false,
                              fillColor: fieldFillColor,
                              focusColor: fieldFillColor,
                              contentPadding: fieldPadding,
                              floatingLabelBehavior: fixedLabel!
                                  ? FloatingLabelBehavior.always
                                  : FloatingLabelBehavior.auto,
                              labelText: enableLabel! ? emailLabel : null,
                              labelStyle: labelStyle,
                              hintText: enableHint! ? emailHint : null,
                              hintStyle: hintStyle,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(fieldRadius!),
                                borderSide: hasBorder
                                    ? BorderSide(
                                        color: fieldBorderColor!,
                                        width: fieldBorderThickness!,
                                      )
                                    : BorderSide.none,
                              ),
                              prefixIcon: fieldIcon
                                  ? Icon(
                                      emailIcon!,
                                      color: iconColor,
                                    )
                                  : null,
                            ),
                          ),
                        ),

                      // Phone Textfield
                      if (phoneField)
                        Container(
                          height: fieldHeight,
                          margin: fieldMargin,
                          child: TextFormField(
                            controller: phoneController,
                            textInputAction: TextInputAction.done,
                            cursorColor: cursorColor,
                            style: fieldStyle,
                            decoration: InputDecoration(
                              filled: fieldFillColor != null ? true : false,
                              fillColor: fieldFillColor,
                              focusColor: fieldFillColor,
                              contentPadding: fieldPadding,
                              floatingLabelBehavior: fixedLabel!
                                  ? FloatingLabelBehavior.always
                                  : FloatingLabelBehavior.auto,
                              labelText: enableLabel! ? phoneLabel : null,
                              labelStyle: labelStyle,
                              hintText: enableHint! ? phoneHint : null,
                              hintStyle: hintStyle,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(fieldRadius!),
                                borderSide: hasBorder
                                    ? BorderSide(
                                        color: fieldBorderColor!,
                                        width: fieldBorderThickness!,
                                      )
                                    : BorderSide.none,
                              ),
                              prefixIcon: fieldIcon
                                  ? Icon(
                                      phoneIcon!,
                                      color: iconColor,
                                    )
                                  : null,
                            ),
                          ),
                        ),

                      // Password Textfield
                      if (passwordField)
                        Container(
                          height: fieldHeight,
                          margin: fieldMargin,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            textInputAction: TextInputAction.done,
                            cursorColor: cursorColor,
                            style: fieldStyle,
                            decoration: InputDecoration(
                              filled: fieldFillColor != null ? true : false,
                              fillColor: fieldFillColor,
                              focusColor: fieldFillColor,
                              contentPadding: fieldPadding,
                              floatingLabelBehavior: fixedLabel!
                                  ? FloatingLabelBehavior.always
                                  : FloatingLabelBehavior.auto,
                              labelText: enableLabel! ? passwordLabel : null,
                              labelStyle: labelStyle,
                              hintText: enableHint! ? passwordHint : null,
                              hintStyle: hintStyle,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(fieldRadius!),
                                borderSide: hasBorder
                                    ? BorderSide(
                                        color: fieldBorderColor!,
                                        width: fieldBorderThickness!,
                                      )
                                    : BorderSide.none,
                              ),
                              prefixIcon: fieldIcon
                                  ? Icon(
                                      passwordIcon!,
                                      color: iconColor,
                                    )
                                  : null,
                              suffixIcon: IconButton(
                                onPressed: onShowPassword,
                                icon: visiblePasswordIcon ??
                                    Icon(obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                              ),
                            ),
                            onFieldSubmitted: onSubmitted ??
                                (loginController != null
                                    ? (value) => loginValidation()
                                    : onSubmitted),
                          ),
                        ),

                      // Forgot + Save
                      if (rememberMeOption || forgotpasswordOption)
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (rememberMeOption)
                                Row(
                                  children: [
                                    Text(
                                      rememberMeText,
                                      style: rememberMeStyle,
                                    ),
                                    Checkbox(
                                      value: rememberMeValue,
                                      onChanged: onRemeberMe,
                                    ),
                                  ],
                                ),
                              const Expanded(child: SizedBox()),
                              if (forgotpasswordOption)
                                GestureDetector(
                                  onTap: onForgot,
                                  child: Text(
                                    forgotPassText,
                                    style: forgotPassStyle,
                                  ),
                                ),
                            ],
                          ),
                        ),

                      // Flexible Space
                      if (bottomLoginButton)
                        const Expanded(
                          child: SizedBox(),
                        )
                      else
                        const SizedBox(
                          height: 50,
                        ),

                      // Login button
                      if (loginButton == null)
                        ElevatedButton(
                          onPressed: onLogin ??
                              (loginController != null
                                  ? loginValidation
                                  : onLogin),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double?>(
                              loginElevation,
                            ),
                            shadowColor: MaterialStateProperty.all<Color?>(
                              loginShadowColor,
                            ),
                            backgroundColor: MaterialStateProperty.all<Color?>(
                              loginButtonColor,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color?>(
                              Colors.white,
                            ),
                            overlayColor: MaterialStateProperty.all<Color?>(
                              loginButtonHighlightColor,
                            ),
                            splashFactory: loginButtonSplash
                                ? InkSplash.splashFactory
                                : NoSplash.splashFactory,
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(loginButtonRadius),
                                side: loginButtonBorderWidth != 0
                                    ? BorderSide(
                                        color: loginButtonBorderColor,
                                        width: loginButtonBorderWidth,
                                      )
                                    : BorderSide.none,
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(loginButtonWidth, loginButtonHeight),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loginText,
                              const SizedBox(
                                width: 10,
                              ),
                              if (loginIcon != null) loginIcon!
                            ],
                          ),
                        )
                      else
                        loginButton!,

                      if (loginOptions.isNotEmpty)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Divider(
                                    color: Colors.black87,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: backgroundColor,
                                    child: const Text(
                                      "OR",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (loginOptions.contains("google"))
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Ink(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Image(
                                                image: AssetImage(
                                                    "images/google.png")),
                                          ),
                                        ),
                                      ),
                                    if (loginOptions.contains("apple") &&
                                        loginOptions.contains("google"))
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    if (loginOptions.contains("apple"))
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Ink(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Image(
                                                image: AssetImage(
                                                    "images/apple.png")),
                                          ),
                                        ),
                                      ),
                                    if (loginOptions.contains("facebook") &&
                                        loginOptions.length > 1)
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    if (loginOptions.contains("facebook"))
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Ink(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Image(
                                                image: AssetImage(
                                                    "images/facebook.png")),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      if (flexibleWidget != null) flexibleWidget!,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginController {
  final String url;
  final List<String> tokenPath;
  final String apiTokenKey;
  final Map<String, String> headers;
  final Map<String, dynamic> body;
  final bool hasLoading;
  final bool printToken;
  String? accessToken;
  Map? data;

  LoginController({
    required this.url,
    this.tokenPath = const [],
    this.apiTokenKey = "token",
    this.headers = const {"Content-Type": "application/json"},
    required this.body,
    this.hasLoading = true,
    this.printToken = false,
  });

  void setToken(String? token) {
    accessToken = token;
  }
}
