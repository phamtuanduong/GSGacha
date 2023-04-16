// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const String URI_DOMAIN = 'http://127.0.0.100:8080/';
  static BuildContext? buildContext;

  static void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(buildContext!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static const String apiResponseKey = 'API_RESPONSE_KEY';
}

enum GetStorageEnum { ACCESS_TOKEN }
