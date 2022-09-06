// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';

// ignore: camel_case_types
class onTapProvider extends ChangeNotifier {
  Future<void> onTap({required String repoUrl}) async {
    var url = Uri.parse('${Api.user_profile}$repoUrl');
    if (await canLaunchUrl(url)) await launchUrl(url);
    notifyListeners();
  }
}
