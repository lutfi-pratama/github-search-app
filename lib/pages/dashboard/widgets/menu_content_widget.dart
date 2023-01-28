// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:github_search_app/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuContentWidget extends StatelessWidget {
  MenuContentWidget({
    Key? key,
    this.icon,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(isSelected ? 1 : 0.6),
          size: 42.w,
        ),
        SizedBox(
          height: 12.5.w,
        ),
        Text(
          text,
          style: MyTextStyles.menu1Text(
              color: Colors.white.withOpacity(isSelected ? 1 : 0.6)),
        )
      ],
    );
  }
}
