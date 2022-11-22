// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class UserFollowingProvider extends ChangeNotifier {
  List<User>? _userFollowing;
  User? following;
  bool isLoading = true;
  List<User> get followingList {
    return [...?_userFollowing];
  }

  Future<void> getFollowingList(String full_name) async {
    final url = Uri.parse('${Api.api}/users/$full_name/following');

    try {
      final response = await http.get(url);
      List<User> newList = [];

      final responseData = json.decode(response.body) as List<dynamic>;

      for (int i = 0; i < responseData.length; i++) {
        User following = User(
          username: responseData[i]['login'],
          imageUrl: responseData[i]['avatar_url'],
        );
        newList.add(following);
      }
      isLoading = false;
      _userFollowing = newList;

      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }
}
