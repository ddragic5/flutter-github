// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../providers/repository_details_provider.dart';

Container AuthorImage(BuildContext context, RepositoryDetailsProvider repo) {
  // ignore: sized_box_for_whitespace
  return Container(
    height: MediaQuery.of(context).size.height * 0.35,
    width: MediaQuery.of(context).size.width * 0.25,
    child: CachedNetworkImage(
      fit: BoxFit.fill,
      placeholder: (context, url) => const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
      errorWidget: ((context, url, error) => CircleAvatar(
            child: Material(
              child: CircleAvatar(
                radius: 45,
                child: Image.asset(
                  'assets/images/img_not.png',
                  width: 100,
                ),
              ),
            ),
          )),
      imageUrl: '${repo.repository!.avatarUrl}',
    ),
  );
}
