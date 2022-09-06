// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/repository_provider.dart';

Row AuthorAndRepoName(RepositoryProvider repo, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Author : ${repo.repoList[index].author}',
        style: const TextStyle(color: Colors.white),
      ),
      Text(
        'Repository name: ${repo.repoList[index].reponame}',
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
