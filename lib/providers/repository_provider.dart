// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:search_github/models/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class RepositoryProvider extends ChangeNotifier {
  var _repositories = <Repository>[];
  var _totalCount;
  var url;
  var getAuthor;
  bool hasMore = true;
  Repository? repositories;
  var finishScroll = false;

  List<Repository> get repoList {
    return [..._repositories];
  }

  get count {
    return _totalCount;
  }

  Future<void> getRepoList(
      {required String repo, int page = 1, int per_page = 10}) async {
    try {
      var url = Uri.parse(
          '${Api.api}/${Api.github_search}?q=$repo&page=$page&per_page=$per_page');

      final response = await http.get(url);

      final responseData = json.decode(response.body);

      var items = responseData['items'] as List;

      _totalCount = (responseData['total_count'] as int);

      _repositories += items.map((e) => Repository.fromJson(e)).toList();

      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }

  Future refresh() async {
    getRepoList(repo: '');
  }
}
