import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:roomfinding/Auth/loginpage.dart';
import 'package:roomfinding/constants/app_colors.dart';
import 'package:roomfinding/utlis/text_styles.dart';
import 'package:roomfinding/utlis/validator.dart';
import 'package:roomfinding/widget/common_appbar_view.dart';
import 'package:roomfinding/widget/common_button.dart';
import 'package:roomfinding/widget/common_text_field_view.dart';
import 'package:roomfinding/widget/remove_focuse.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _errorEmail = '';
  final TextEditingController _emailController = TextEditingController();
  String _errorPassword = '';
  final TextEditingController _passwordController = TextEditingController();
  String _errorFName = '';
  final TextEditingController _fnameController = TextEditingController();
  String _errorLName = '';
  final TextEditingController _lnameController = TextEditingController();

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
            _appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    CommonTextFieldView(
                      controller: _fnameController,
                      errorText: _errorFName,
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 24, right: 24),
                      titleText: "First Name",
                      hintText: "Enter First Name",
                      keyboardType: TextInputType.name,
                      onChanged: (String txt) {},
                    ),
                    CommonTextFieldView(
                      controller: _lnameController,
                      errorText: _errorLName,
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 24, right: 24),
                      titleText: "Lastname",
                      hintText: "Enter Last Name",
                      keyboardType: TextInputType.name,
                      onChanged: (String txt) {},
                    ),
                    CommonTextFieldView(
                      controller: _emailController,
                      errorText: _errorEmail,
                      titleText: "Email",
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      hintText: "enter your email",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String txt) {},
                    ),
                    CommonTextFieldView(
                      titleText: "Password",
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24),
                      hintText: "enter password",
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorPassword,
                      controller: _passwordController,
                    ),
                    CommonButton(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                      buttonText: "Signup",
                      onTap: () {
                        if (_allValidation()) {
                          AwesomeNotifications().createNotification(
                              content: NotificationContent(
                                  id: 1,
                                  channelKey: 'basic_channel',
                                  title: 'Roommie',
                                  body: 'Successfully LoggedIn'));

                          MotionToast.success(
                              description: const Text("Signup Successfull"),
                              onClose: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              }).show(context);
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Terms and Condition",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already Have Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Login",
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 24,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      onBackClick: () {
        Navigator.pop(context);
      },
    );
  }

  bool _allValidation() {
    bool isValid = true;

    if (_fnameController.text.trim().isEmpty) {
      _errorFName = "First Name Cannot Be Empty";
      isValid = false;
    } else {
      _errorFName = '';
    }

    if (_lnameController.text.trim().isEmpty) {
      _errorLName = "Name Cannot Be Empty";
      isValid = false;
    } else {
      _errorLName = '';
    }

    if (_emailController.text.trim().isEmpty) {
      _errorEmail = "Email Cannot Be Empty";
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = "Valid Email";
      isValid = false;
    } else {
      _errorEmail = '';
    }

    if (_passwordController.text.trim().isEmpty) {
      _errorPassword = "Password cannot be empty";
      isValid = false;
    } else if (_passwordController.text.trim().length < 6) {
      _errorPassword = "valid";
      isValid = false;
    } else {
      _errorPassword = '';
    }
    setState(() {});
    return isValid;
  }
}
