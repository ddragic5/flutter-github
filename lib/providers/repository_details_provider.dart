// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:search_github/models/repository_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class RepositoryDetailsProvider with ChangeNotifier {
  RepositoryDetails? repository;
  bool isLoading = true;
  Future<void> detailedRepository(String full_name) async {
    final url = Uri.parse('${Api.api}/repos/$full_name');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonD = json.decode(response.body) as Map<String, dynamic>;

      notifyListeners();
      repository = RepositoryDetails(
        id: jsonD['id'],
        reponame: jsonD['name'],
        stars: jsonD['stargazers_count'],
        description: jsonD['description'],
        url: jsonD['html_url'],
        fork_count: jsonD['forks_count'],
        issue_count: jsonD['open_issues_count'],
        author: jsonD['owner']['login'],
        avatarUrl: jsonD['owner']['avatar_url'],
        full_name: jsonD['full_name'],
        created_date: jsonD['created_at'],
        last_pushed: jsonD['updated_at'],
        language: jsonD['language'],
        watchers_count: jsonD['watchers_count'],
        default_branch: jsonD['default_branch'],
      );
      isLoading = false;
      notifyListeners();
      // ignore: empty_catches
    } else
      (e) {
        print(e);
      };
  }
}
