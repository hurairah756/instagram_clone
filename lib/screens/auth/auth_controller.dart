// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/imagepicker.dart';

final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});

class AuthController extends ChangeNotifier {
  final email = TextEditingController();
  final emailFocus = FocusNode();
  final password = TextEditingController();
  final passwordFocus = FocusNode();
  final passwordConfirm = TextEditingController();
  final passwordConfirmFocus = FocusNode();
  final username = TextEditingController();
  final usernameFocus = FocusNode();
  final bio = TextEditingController();
  final bioFocus = FocusNode();
  File? _imageFile;
  bool _showSpinner = false;
  bool _showLoginScreen = true;
  int _selectedIndex = 0;

  bool get showSpinner => _showSpinner;
  File? get imageFile => _imageFile;
  bool get showLoginScreen => _showLoginScreen;
  int get selectedIndex => _selectedIndex;

  set showSpinner(bool value) {
    _showSpinner = value;
    notifyListeners();
  }

  set imageFile(File? value) {
    _imageFile = value;
    notifyListeners();
  }

  set showLoginScreen(bool value) {
    _showLoginScreen = value;
    notifyListeners();
  }

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<void> pickImage() async {
    File _imageFile = await ImagePickerr().uploadImage('gallery');
    imageFile = _imageFile;
  }

  @override
  void dispose() {
    email.dispose();
    emailFocus.dispose();
    password.dispose();
    passwordFocus.dispose();
    passwordConfirm.dispose();
    passwordConfirmFocus.dispose();
    username.dispose();
    usernameFocus.dispose();
    bio.dispose();
    bioFocus.dispose();
    super.dispose();
  }
}
