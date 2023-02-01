import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/cubits/load_data/load_data_cubit.dart';
import 'package:github_search_app/cubits/menu_item/menu_item_cubit.dart';
import 'package:github_search_app/pages/contents_browse/widgets/index.dart';
import 'package:github_search_app/resources/resources.dart';
import 'package:github_search_app/utils/keyboard_behaviour.dart';

class MenuItemSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 70.w;

  @override
  double get minExtent => 70.w;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    MenuItemCubit menuItemCubit = context.read<MenuItemCubit>();
    LoadDataCubit loadDataCubit = context.read<LoadDataCubit>();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Container(
              width: 310.w,
              height: 60.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: MyColors.cream20Color,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r)),
              ),
              child: BlocBuilder<MenuItemCubit, MenuItemState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MenuItemShowIndex(
                          icon: Icons.person_outline,
                          isSelected:
                              state.menus[0].id == state.selectedMenu.id,
                          callback: () {
                            KeyboardBehaviour.keyboardDisappear(context);
                            loadDataCubit.onChangeType(LoadDataType.users);
                            menuItemCubit
                                .updateSelectedMenuItem(state.menus[0]);
                            loadDataCubit.onLoadDataList(
                                selectedMenuItemName: state.selectedMenu.name);
                          }),
                      MenuItemShowIndex(
                          icon: Icons.file_copy_outlined,
                          isSelected:
                              state.menus[1].id == state.selectedMenu.id,
                          callback: () {
                            KeyboardBehaviour.keyboardDisappear(context);
                            loadDataCubit.onChangeType(LoadDataType.repos);
                            menuItemCubit
                                .updateSelectedMenuItem(state.menus[1]);
                            loadDataCubit.onLoadDataList(
                                selectedMenuItemName: state.selectedMenu.name);
                          }),
                      MenuItemShowIndex(
                          icon: Icons.laptop_chromebook_outlined,
                          isSelected:
                              state.menus[2].id == state.selectedMenu.id,
                          callback: () {
                            KeyboardBehaviour.keyboardDisappear(context);
                            loadDataCubit.onChangeType(LoadDataType.issues);
                            menuItemCubit
                                .updateSelectedMenuItem(state.menus[2]);
                            loadDataCubit.onLoadDataList(
                                selectedMenuItemName: state.selectedMenu.name);
                          }),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.w,
            )
          ],
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
