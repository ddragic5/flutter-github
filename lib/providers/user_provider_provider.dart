import 'package:flutter/cupertino.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class UserProvider with ChangeNotifier {
  User? user;
  bool isLoading = true;
  Future<void> getUserProfile(String username) async {
    final url = Uri.parse('${Api.api}/users/$username');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(isLoading);
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print(responseData);
        user = User(
          username: responseData['login'],
          imageUrl: responseData['avatar_url'],
          followers: responseData['followers'],
          following: responseData['following'],
          joined_date: responseData['created_at'],
          public_repo: responseData['public_repos'],
        );
        isLoading = false;
        print(isLoading);
        notifyListeners();
      } else {
        throw 'Error';
      }
    } catch (e) {
      throw 'e';
    } // ignore: empty_catches
  }
}
