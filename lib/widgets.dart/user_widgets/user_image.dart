// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../providers/user_provider_provider.dart';

Column UserImage(UserProvider user, BuildContext context) {
  return Column(children: <Widget>[
    Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.25,
      child: PhotoView(
        backgroundDecoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        enableRotation: true,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!),
          ),
        ),
        imageProvider: NetworkImage(
          '${user.user!.imageUrl}',
        ),
      ),
    ),
    SizedBox(
      height: 250,
    ),
  ]);
}
