import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/resources/resources.dart';

class SearchBarResultAppBar extends StatelessWidget {
  const SearchBarResultAppBar({Key? key, required this.searchText})
      : super(key: key);

  final String searchText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 2.w),
      child: Column(
        children: [
          Text(
            'Search for',
            style: MyTextStyles.body1Text(color: Colors.white.withOpacity(0.8)),
          ),
          SizedBox(
            height: 2.w,
          ),
          FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.w),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white),
                ),
              ),
              child: Center(
                child: Text(
                  searchText,
                  style: MyTextStyles.menu2Text(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
