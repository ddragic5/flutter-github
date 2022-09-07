// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/repository_provider.dart';

Row AuthorAndRepoName(
  repos,
  int index,
  RepositoryProvider repo,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Author : ${repos.author}',
        style: const TextStyle(color: Colors.white),
      ),
      Text(
        'Repository name: ${repos.reponame}',
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
