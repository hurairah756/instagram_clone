// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/screens/auth/auth_controller.dart';
import 'package:instagramui/screens/auth/widgets/custom_signinfield.dart';
import 'package:instagramui/screens/auth/widgets/forget_widget.dart';
import 'package:instagramui/utils/constant_strings.dart';
import 'package:instagramui/utils/constant_variables.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../api/firebase_auth.dart';
import '../../utils/constant_images.dart';

class LoginScreen extends ConsumerWidget {
  final VoidCallback show;
  const LoginScreen(this.show, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(authControllerProvider);
    return ModalProgressHUD(
      inAsyncCall: _controller.showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight / 6),
                  Center(
                    child: SizedBox(
                      width: deviceWidth / 2.2,
                      height: deviceHeight / 10,
                      child: Image.asset(ConstantImages.INSTAGRAM_LOGO),
                    ),
                  ),
                  SizedBox(height: deviceHeight / 10),
                  CustomSignInTextField(
                    controller: _controller.email,
                    focusNode: _controller.emailFocus,
                    typename: ConstantStrings.EMAIL,
                    icon: Icons.email,
                  ),
                  SizedBox(height: deviceHeight / 40),
                  CustomSignInTextField(
                      controller: _controller.password,
                      focusNode: _controller.passwordFocus,
                      typename: ConstantStrings.PASSWORD,
                      icon: Icons.lock),
                  SizedBox(height: deviceHeight / 40),
                  const Forget(),
                  SizedBox(height: deviceHeight / 40),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * .025),
                    child: InkWell(
                      onTap: () async {
                        _controller.showSpinner = true;
                        await Authentication()
                            .Login(
                                email: _controller.email.text,
                                password: _controller.password.text)
                            .then((value) => _controller.showSpinner = false);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: deviceHeight / 17,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(deviceHeight / 80),
                        ),
                        child: Text(
                          ConstantStrings.LOGIN,
                          style: TextStyle(
                            fontSize: deviceHeight / 45,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight / 40),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * .025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ConstantStrings.DONT_HAVE_AN_ACCOUNT,
                          style: TextStyle(
                            fontSize: deviceHeight / 55,
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: show,
                          child: Text(
                            ConstantStrings.SIGN_UP,
                            style: TextStyle(
                                fontSize: deviceHeight / 52,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Have()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
