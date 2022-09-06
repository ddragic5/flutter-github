import 'package:flutter/material.dart';

import '../../../providers/repository_details_provider.dart';
import 'repo_bottom_bar_row.dart';

// ignore: non_constant_identifier_names
Padding RepoInfoBottomContainer(RepositoryDetailsProvider repo) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          color: Colors.teal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RepoContainerRow(
                  icon: const Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
                  description: 'Stars: ${repo.repository!.stars.toString()}'),
              RepoContainerRow(
                  icon: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.white,
                  ),
                  description: 'Watchers: ${repo.repository!.watchers_count}'),
              RepoContainerRow(
                icon: const Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
                description: 'Language: ${repo.repository!.language}',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
