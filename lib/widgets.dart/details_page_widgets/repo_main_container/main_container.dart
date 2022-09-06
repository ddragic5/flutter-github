// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../providers/repository_details_provider.dart';
import 'main_container_row.dart';

Column MainContainerView(
    DateFormat dateF, RepositoryDetailsProvider repo, BuildContext context) {
  return Column(
    children: [
      MainContainerRow(
          text: 'Created',
          description: dateF.format(DateTime.parse(
            '${repo.repository!.created_date}',
          )),
          context: context),
      repo.repository!.description == null
          ? Container()
          : MainContainerRow(
              text: 'Description',
              description: '${repo.repository!.description}',
              context: context),
      MainContainerRow(
          text: 'Last pushed',
          description: dateF.format(DateTime.parse(
            '${repo.repository!.last_pushed}',
          )),
          context: context),
      MainContainerRow(
          text: 'Branch',
          description: '${repo.repository!.default_branch}',
          context: context),
    ],
  );
}
