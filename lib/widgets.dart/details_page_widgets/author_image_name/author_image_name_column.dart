// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../providers/repository_details_provider.dart';
import 'author_image_container.dart';
import 'author_name_container.dart';

Padding AuthorImageAndName(
    BuildContext context, RepositoryDetailsProvider repo) {
  return Padding(
    padding: const EdgeInsets.only(left: 100),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AuthorImage(context, repo),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        AuthorNameContainer(repo: '${repo.repository!.author}'),
      ],
    ),
  );
}
