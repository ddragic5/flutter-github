// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/on_tap provider.dart';
import '../../providers/repository_details_provider.dart';

Padding RedButtonDetailsPage(
    onTapProvider repoUrl, RepositoryDetailsProvider repo) {
  return Padding(
    padding: const EdgeInsets.all(13.0),
    child: Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          child: Container(
              color: Colors.redAccent,
              width: 250,
              height: 30,
              child: InkWell(
                  onTap: () async {
                    (repoUrl.onTap(repoUrl: '${repo.repository!.full_name}'));
                  },
                  child: const Center(child: Text('Take me to website')))),
        ),
      ),
    ),
  );
}
