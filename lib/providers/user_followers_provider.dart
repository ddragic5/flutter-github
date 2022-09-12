import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class UserFollowerProvider extends ChangeNotifier {
  List<User>? _userFollowers;
  User? followers;

  List<User> get followersList {
    return [...?_userFollowers];
  }

  Future<void> getFollowersList(String username) async {
    final link = Uri.parse('${Api.api}/users/$username/followers');

    try {
      final response = await http.get(link);
      List<User> newList = [];

      final responseData = json.decode(response.body) as List<dynamic>;
      for (int i = 0; i < responseData.length; i++) {
        User followers = User(
          username: responseData[i]['login'],
          imageUrl: responseData[i]['avatar_url'],
        );
        newList.add(followers);
      }

      _userFollowers = newList;

      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }
}
