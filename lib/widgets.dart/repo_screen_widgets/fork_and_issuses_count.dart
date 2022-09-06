// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/repository_provider.dart';

Column ForkAndIssuesCount(RepositoryProvider repo, int index) {
  return Column(
    children: [
      Text(
        'Fork count: ${repo.repoList[index].fork_count}',
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'Issues count : ${repo.repoList[index].issue_count}',
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
