import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:roomfinding/Auth/forgot_password.dart';
import 'package:roomfinding/Auth/signup.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/navigator.dart';
import 'package:roomfinding/widget/common_appbar_view.dart';
import 'package:roomfinding/widget/common_button.dart';
import 'package:roomfinding/widget/common_text_field_view.dart';
import 'package:roomfinding/widget/remove_focuse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _errorEmail = '';
  final TextEditingController _emailController =
      TextEditingController(text: 'gnira46@gmail.com');
  String _errorPassword = '';
  final TextEditingController _passwordController =
      TextEditingController(text: 'nirajan123');

  @override
  void initState() {
    _checkNotification();
    super.initState();
  }

  _checkNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowded) {
      if (!isAllowded) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  _loginUser() async {
    if (_emailController.text == 'gnira46@gmail.com' &&
        _passwordController.text == "nirajan123") {
      await _updateUserPoints(10); // Add points for login
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            title: 'Roommie',
            body: 'Successfully LoggedIn'));

    int totalPoints = await _getUserPoints();
    MotionToast.success(
      description: const Text("Success! You earned 10 points."),
      onClose: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainNavigator(totalPoints: totalPoints)),
        );
      },
    ).show(context);
  }

  _showMessage() {
    MotionToast.error(
      description: const Text("Username or Password Invalid"),
    ).show(context);
  }

  _updateUserPoints(int pointsToAdd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentPoints = prefs.getInt('userPoints') ?? 0;
    int updatedPoints = currentPoints + pointsToAdd;
    await prefs.setInt('userPoints', updatedPoints);
  }

  Future<int> _getUserPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userPoints') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.arrow_back,
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff632B13),
                        ),
                      ),
                    ),
                    CommonTextFieldView(
                      controller: _emailController,
                      errorText: _errorEmail,
                      titleText: "Email",
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      hintText: "Enter Your Email",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String txt) {},
                    ),
                    CommonTextFieldView(
                      titleText: "password",
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      hintText: "enter your password",
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorPassword,
                      controller: _passwordController,
                    ),
                    _forgotYourPasswordUI(),
                    CommonButton(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      buttonText: "login",
                      onTap: () {
                        if (_allValidation()) {
                          _loginUser();
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _forgotYourPasswordUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "forgot your password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _allValidation() {
    bool isValid = true;
    if (_emailController.text.trim().isEmpty) {
      _errorEmail = "email cannot be empty";
      isValid = false;
    } else {
      _errorEmail = '';
    }

    if (_passwordController.text.trim().isEmpty) {
      _errorPassword = "password cannot be empty";
      isValid = false;
    } else if (_passwordController.text.trim().length < 6) {
      _errorPassword = "valid_password";
      isValid = false;
    } else {
      _errorPassword = '';
    }
    setState(() {});
    return isValid;
  }
}
