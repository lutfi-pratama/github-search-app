import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/resources/models/index.dart';
import 'package:github_search_app/resources/resources.dart';

class IssueCard extends StatelessWidget {
  IssueCard({Key? key, required this.issue}) : super(key: key);

  IssueMdl issue;

  @override
  Widget build(BuildContext context) {
    return Text(issue.title);
  }
}
