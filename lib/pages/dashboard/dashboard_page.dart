import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/cubits/menu_item/menu_item_cubit.dart';
import 'package:github_search_app/resources/resources.dart';
import 'package:github_search_app/pages/dashboard/widgets/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 1.sh,
            color: MyColors.cream10Color,
            width: 1.sw,
          ),
          Container(
            width: 301.w,
            height: 590.w,
            decoration: BoxDecoration(
              color: MyColors.darkPurple,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.r)),
            ),
            padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 152.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Pick one!',
                  style: MyTextStyles.body1Text(color: Colors.white),
                ),
              ],
            ),
          ),
          // Title
          Positioned(
              bottom: 615.w,
              left: 21.w,
              child: const Header(
                headerText:
                    'Search any GitHub resources you like with limitless.',
              )),
          // menus
          Positioned(
            bottom: 238.w,
            left: 21.w,
            child: MenuWidget(),
          ),
          // search box
          Positioned(bottom: 80.w, left: 21.w, child: const SearchBar())
        ],
      ),
    );
  }
}
