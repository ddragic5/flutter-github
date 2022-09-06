// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/repository_provider.dart';

Column RepoDescription(RepositoryProvider repo, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10,
      ),
      repo.repoList[index].description == null
          ? const Text(
              'No description',
              style: TextStyle(color: Colors.white),
            )
          : Text(
              '${repo.repoList[index].description}',
              style: const TextStyle(color: Colors.white),
            ),
    ],
  );
}
