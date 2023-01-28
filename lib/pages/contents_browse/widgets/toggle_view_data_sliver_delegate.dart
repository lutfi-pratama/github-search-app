import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/cubits/menu_item/menu_item_cubit.dart';
import 'package:github_search_app/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleViewDataSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    MenuItemCubit menuItemCubit = context.read<MenuItemCubit>();

    final percent = shrinkOffset / (maxExtent - minExtent);
    final isSmallItem = percent > 0;

    return BlocBuilder<MenuItemCubit, MenuItemState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              top: isSmallItem ? -100.w : 2.5.w,
              child: GestureDetector(
                onTap: () => menuItemCubit.onToggleViewData(),
                child: Container(
                  width: 200.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                      color: MyColors.cream10Color,
                      borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 15.0,
                          spreadRadius: -11.0,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('lazyload', style: MyTextStyles.menu1Text()),
                      Text('Index', style: MyTextStyles.menu1Text()),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              top: isSmallItem ? -100.w : 0.w,
              right: state.isIndexViewData ? 80.w : 160.w,
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                width: state.isIndexViewData ? 105.w : 120.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: MyColors.red10Color,
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                ),
                child: Center(
                  child: Text(
                    state.isIndexViewData ? 'Index' : 'Lazyload',
                    style: MyTextStyles.menu2Text(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
