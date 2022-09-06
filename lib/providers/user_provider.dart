import 'package:flutter/cupertino.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class UserProvider with ChangeNotifier {
  User? user;

  Future<void> getUserProfile(String username) async {
    final url = Uri.parse('${Api.api}/users/$username');

    try {
      final response = await http.get(url);

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      user = User(
        username: responseData['login'],
        imageUrl: responseData['avatar_url'],
        followers: responseData['followers'],
        following: responseData['following'],
        joined_date: responseData['created_at'],
        public_repo: responseData['public_repos'],
      );
      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }
}
