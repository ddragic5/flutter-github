// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_github/models/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class RepositoryProvider extends ChangeNotifier {
  var _repositories = <Repository>[];
  var _totalCount;
  var url;
  var getAuthor;
  Repository? repositories;
  var isLoading = true;
  bool hasMore = true;
  List<Repository> get repoList {
    return [..._repositories];
  }

  List<Repository> get sortedByAlphaList {
    _repositories.sort(
        (a, b) => a.author!.toLowerCase().compareTo(b.author!.toLowerCase()));
    return [..._repositories];
  }

  get count {
    return _totalCount;
  }

  List<Repository> get sortedByStars {
    _repositories.sort((a, b) => b.stars!.compareTo(a.stars!));
    return [..._repositories];
  }

  Future<void> getRepoList({
    required String repo,
    int page = 1,
  }) async {
    try {
      if (page == 1 && _repositories.isNotEmpty) {
        _repositories.clear();
      }

      var url = Uri.parse(
          '${Api.api}/${Api.github_search}?q=$repo&page=$page&per_page=25');

      final response = await http.get(url);

      final responseData = json.decode(response.body);

      var items = responseData['items'] as List;

      _totalCount = (responseData['total_count'] as int);

      _repositories += items.map((e) => Repository.fromJson(e)).toList();

      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }
}
