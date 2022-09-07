// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../providers/repository_provider.dart';

Column RepoDescription(
  repos,
  int index,
  RepositoryProvider repo,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10,
      ),
      repos.description == null
          ? const Text(
              'No description',
              style: TextStyle(color: Colors.white),
            )
          : ReadMoreText(
              '${repos.description}',
              style: const TextStyle(color: Colors.white),
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              colorClickableText: Colors.greenAccent,
              trimLines: 2,
              trimMode: TrimMode.Line,
            ),
    ],
  );
}
