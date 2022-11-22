import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:search_github/widgets.dart/app_bar_theme.dart';

import 'package:provider/provider.dart';

import '../providers/on_tap provider.dart';
import '../providers/repository_provider.dart';
import '../providers/user_followers_provider.dart';

class UserFollowersScreen extends StatelessWidget {
  final String username;
  const UserFollowersScreen({Key? key, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const provider = Provider.of<RepositoryProvider>;
    Provider.of<UserFollowerProvider>(context)
        .getFollowersList(username)
        .then((_) {
      provider(context, listen: false).isLoading = false;
    });
    final user = Provider.of<UserFollowerProvider>(context);
    final repoUrl = Provider.of<onTapProvider>(context);

    return Scaffold(
      appBar: appBarTheme(title: 'Followers'),
      body: provider(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.black87,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      username,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: user.followersList.length,
                      itemBuilder: ((context, index) => InkWell(
                            hoverColor: Colors.grey,
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: (() async {
                                      (repoUrl.onTap(
                                          repoUrl:
                                              '${user.followersList[index].username}'));
                                    }),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        color: Colors.black12,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(150),
                                                child: CachedNetworkImage(
                                                  placeholder: (context, url) =>
                                                      Container(
                                                    // ignore: prefer_const_constructors
                                                    // ignore: sort_child_properties_last
                                                    child:
                                                        const CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0xff330033),
                                                      ),
                                                    ),
                                                    width: 50,
                                                    height: 30,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            100),
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromRGBO(
                                                            8, 32, 50, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                                  errorWidget: ((context, url,
                                                          error) =>
                                                      CircleAvatar(
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
                                                  imageUrl:
                                                      '${user.followersList[index].imageUrl}',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${user.followersList[index].username}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
