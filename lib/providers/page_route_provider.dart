// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:search_github/screens/details_screen.dart';

import '../screens/user_screen.dart';

// ignore: camel_case_types
class onPressedProvider extends ChangeNotifier {
  Future<void> onPressed({required String username, context}) async {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => UserDetails(username: username)));
    notifyListeners();
  }

  Future<void> onPressedOpenRepo(
      {required String full_name, context, required String username}) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => RepositoryDetails(
        full_name: full_name,
        username: username,
      ),
    ));
    notifyListeners();
  }
}
