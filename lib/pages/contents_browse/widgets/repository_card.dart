import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/resources/models/repository_mdl.dart';
import 'package:github_search_app/resources/resources.dart';

class RepositoryCard extends StatelessWidget {
  RepositoryCard({Key? key, required this.repository}) : super(key: key);

  RepositoryMdl repository;

  @override
  Widget build(BuildContext context) {
    return Text(repository.name);
  }
}
