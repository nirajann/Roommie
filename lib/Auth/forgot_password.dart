import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:roomfinding/utlis/validator.dart';
import 'package:roomfinding/widget/common_appbar_view.dart';
import 'package:roomfinding/widget/common_button.dart';
import 'package:roomfinding/widget/common_text_field_view.dart';
import 'package:roomfinding/widget/remove_focuse.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _errorEmail = '';
  final TextEditingController _emailController = TextEditingController();

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
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 24, right: 24),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Resend Email Link",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonTextFieldView(
                      controller: _emailController,
                      titleText: "Email",
                      errorText: _errorEmail,
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24),
                      hintText: "Enter Your Email",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String txt) {},
                    ),
                    CommonButton(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      buttonText: "SEND",
                      onTap: () {
                        if (_allValidation()) {
                          AwesomeNotifications().createNotification(
                              content: NotificationContent(
                                  id: 1,
                                  channelKey: 'basic_channel',
                                  title: 'Roommie',
                                  body: 'Successfully LoggedIn'));

                          MotionToast.success(
                                  description:
                                      const Text("Please Check Your Email"),
                                  onClose: () {})
                              .show(context);
                        }
                      },
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

  Widget appBar() {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      titleText: "Forgot Password",
      onBackClick: () {
        Navigator.pop(context);
      },
    );
  }

  bool _allValidation() {
    bool isValid = true;
    if (_emailController.text.trim().isEmpty) {
      _errorEmail = "Email Cannot BE Empty";
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = "Enter Valid Email";
      isValid = false;
    } else {
      _errorEmail = '';
    }
    setState(() {});
    return isValid;
  }
}
