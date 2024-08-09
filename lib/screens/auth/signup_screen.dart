import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/screens/auth/widgets/account_widget.dart';
import 'package:instagramui/screens/auth/widgets/custom_signupfield.dart';
import 'package:instagramui/utils/constant_images.dart';
import 'package:instagramui/utils/constant_strings.dart';
import 'package:instagramui/utils/exception.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../api/firebase_auth.dart';
import '../../utils/constant_variables.dart';
import '../../utils/dialog.dart';
import 'auth_controller.dart';

class SignupScreen extends ConsumerWidget {
  final VoidCallback show;
  const SignupScreen(this.show, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    final authControllerNotifier = ref.read(authControllerProvider.notifier);

    return ModalProgressHUD(
      inAsyncCall: authController.showSpinner,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight / 60),
                  Center(
                    child: SizedBox(
                      width: deviceWidth / 2.2,
                      height: deviceHeight / 10,
                      child: Image.asset(ConstantImages.INSTAGRAM_LOGO),
                    ),
                  ),
                  SizedBox(height: deviceHeight / 30),
                  InkWell(
                    onTap: () async {
                      await authControllerNotifier.pickImage();
                    },
                    child: CircleAvatar(
                      radius: deviceHeight / 18,
                      backgroundColor: Colors.grey,
                      child: authController.imageFile == null
                          ? CircleAvatar(
                              radius: deviceHeight / 18.5,
                              backgroundImage:
                                  const AssetImage(ConstantImages.PERSON),
                              backgroundColor: Colors.grey.shade200,
                            )
                          : CircleAvatar(
                              radius: deviceHeight / 18.5,
                              backgroundImage: Image.file(
                                authController.imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                              backgroundColor: Colors.grey.shade200,
                            ),
                    ),
                  ),
                  SizedBox(height: deviceHeight / 20),
                  CustomSignupTextField(
                    controller: authController.email,
                    focusNode: authController.emailFocus,
                    typename: ConstantStrings.EMAIL,
                    icon: Icons.email,
                  ),
                  SizedBox(height: deviceHeight / 40),
                  CustomSignupTextField(
                    controller: authController.username,
                    focusNode: authController.usernameFocus,
                    typename: ConstantStrings.USER_NAME,
                    icon: Icons.person,
                  ),
                  SizedBox(height: deviceHeight / 40),
                  CustomSignupTextField(
                    controller: authController.bio,
                    focusNode: authController.bioFocus,
                    typename: ConstantStrings.BIO,
                    icon: Icons.abc,
                  ),
                  SizedBox(height: deviceHeight / 40),
                  CustomSignupTextField(
                    controller: authController.password,
                    focusNode: authController.passwordFocus,
                    typename: ConstantStrings.PASSWORD,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: deviceHeight / 40),
                  CustomSignupTextField(
                    controller: authController.passwordConfirm,
                    focusNode: authController.passwordConfirmFocus,
                    typename: ConstantStrings.CONFIRM_PASSWORD,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: deviceHeight / 30),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * .025),
                    child: InkWell(
                      onTap: () async {
                        authControllerNotifier.showSpinner = true;
                        try {
                          await Authentication()
                              .Signup(
                                email: authControllerNotifier.email.text,
                                password: authControllerNotifier.password.text,
                                passwordConfirme:
                                    authControllerNotifier.passwordConfirm.text,
                                username: authControllerNotifier.username.text,
                                bio: authControllerNotifier.bio.text,
                                profile: authControllerNotifier.imageFile ??
                                    File(''),
                              )
                              .then((value) =>
                                  authControllerNotifier.showSpinner = false);
                        } on exceptions catch (e) {
                          dialogBuilder(context, e.message);
                        }
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
                          ConstantStrings.SIGN_UP,
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
                  Have(show: show),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
