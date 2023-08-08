import 'package:flutter/material.dart';
import 'package:roomfinding/widget/common_appbar_view.dart';
import 'package:roomfinding/widget/common_button.dart';
import 'package:roomfinding/widget/common_text_field_view.dart';
import 'package:roomfinding/widget/remove_focuse.dart';

class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  String _errorNewPassword = '';
  String _errorConfirmPassword = '';
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

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
              titleText: "Change Password",
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
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
                              "Enter Your New Password",
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
                      controller: _newController,
                      titleText: "New Password",
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      hintText: "Enter New Password",
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorNewPassword,
                    ),
                    CommonTextFieldView(
                      controller: _confirmController,
                      titleText: "Confirm Password",
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24),
                      hintText: "Enter Confirm Password",
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorConfirmPassword,
                    ),
                    CommonButton(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      buttonText: "Apply",
                      onTap: () {
                        if (_allValidation()) {
                          Navigator.pop(context);
                        }
                      },
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

  bool _allValidation() {
    bool isValid = true;
    if (_newController.text.trim().isEmpty) {
      _errorNewPassword = "Password Cannot Be Empty";
      isValid = false;
    } else if (_newController.text.trim().length < 6) {
      _errorNewPassword = "Enter Valid Password";
      isValid = false;
    } else {
      _errorNewPassword = '';
    }
    if (_confirmController.text.trim().isEmpty) {
      _errorConfirmPassword = "Password Cannot Be Empty";
      isValid = false;
    } else if (_newController.text.trim() != _confirmController.text.trim()) {
      _errorConfirmPassword = "Password DOesnot Match";
      isValid = false;
    } else {
      _errorConfirmPassword = '';
    }
    setState(() {});
    return isValid;
  }
}
