// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../providers/user_provider_provider.dart';

Column UserImage(UserProvider user) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 500,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    // ignore: prefer_const_constructors
                    // ignore: sort_child_properties_last
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xff330033),
                      ),
                    ),
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(100),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(8, 32, 50, 1),
                        borderRadius: BorderRadius.circular(20)),
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
                  imageUrl: '${user.user!.imageUrl}',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
