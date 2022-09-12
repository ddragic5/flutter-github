// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:search_github/providers/user_following_provider.dart';
import 'package:search_github/widgets.dart/app_bar_theme.dart';

import 'package:provider/provider.dart';

import '../providers/on_tap provider.dart';
import '../providers/repository_provider.dart';

class UserFollowingScreen extends StatefulWidget {
  final String username;
  const UserFollowingScreen({Key? key, required this.username})
      : super(key: key);
  @override
  State<UserFollowingScreen> createState() => _UserFollowingScreenState();
}

class _UserFollowingScreenState extends State<UserFollowingScreen> {
  var _init = true;

  final provider = Provider.of<RepositoryProvider>;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      provider(context).isLoading = true;

      Provider.of<UserFollowingProvider>(context)
          .getFollowingList(widget.username)
          .then((_) {
        provider(context, listen: false).isLoading = false;
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    const provider = Provider.of<RepositoryProvider>;
    final repoUrl = Provider.of<onTapProvider>(context);
    final user = Provider.of<UserFollowingProvider>(context);

    return Scaffold(
      appBar: appBarTheme(title: 'Following'),
      body: provider(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.black87,
              child: Column(
                children: [
                  Text(widget.username),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: user.followingList.length,
                      itemBuilder: ((context, index) => InkWell(
                            hoverColor: Colors.grey,
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  // ignore: duplicate_ignore
                                  onTap: (() async {
                                    (repoUrl.onTap(
                                        repoUrl:
                                            '${user.followingList[index].username}'));
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                      const EdgeInsets.all(100),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
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
                                                    '${user.followingList[index].imageUrl}',
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
                                                '${user.followingList[index].username}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
