import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_search_app/cubits/load_data/load_data_cubit.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/menu_item/menu_item_cubit.dart';
import "./widgets/index.dart";

class ContentsBrowsePage extends StatelessWidget {
  const ContentsBrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoadDataCubit loadDataCubit = context.read<LoadDataCubit>();
    // final MenuItemCubit menuItemCubit = BlocProvider.of<MenuItemCubit>(context);
    final MenuItemCubit watchMenuItemCubit = context.watch<MenuItemCubit>();
    bool isIndexView = watchMenuItemCubit.state.isIndexViewData;

    return BlocBuilder<LoadDataCubit, LoadDataState>(
      builder: (context, state) {
        int currentPageIndex = state.type == LoadDataCubitType.users
            ? state.paramsGetUsers.page
            : state.type == LoadDataCubitType.repos
                ? state.paramsGetRepositories.page
                : state.paramsGetIssues.page;
        return Scaffold(
          backgroundColor: MyColors.cream10Color,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (_, __) {
              return <Widget>[
                SliverAppBar(
                  centerTitle: true,
                  forceElevated: true,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r)),
                  ),
                  backgroundColor: MyColors.darkPurple,
                  pinned: true,
                  leading: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.darkPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        loadDataCubit.clearAllLoadedData();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                      )),
                  title: SearchBarResultAppBar(
                    searchText: state.textFieldValue,
                  ),
                ),
                SliverPersistentHeader(
                  delegate: MenuItemSliverDelegate(),
                  pinned: true,
                ),
                SliverPersistentHeader(
                  delegate: ToggleViewDataSliverDelegate(),
                  pinned: true,
                ),
              ];
            },
            body: LazyLoadScrollView(
              onEndOfPage: () {
                if (!isIndexView) {
                  loadDataCubit.onNextPage();
                  loadDataCubit.onLoadDataList(
                      selectedMenuItemName:
                          watchMenuItemCubit.state.selectedItem.name);
                }
              },
              child: RefreshIndicator(
                backgroundColor: MyColors.cream10Color,
                color: MyColors.darkPurple,
                onRefresh: () async => loadDataCubit.onLoadDataList(
                    selectedMenuItemName:
                        watchMenuItemCubit.state.selectedItem.name),
                child: Column(
                  children: [
                    Expanded(
                      child: DataBodyListView(
                        loadDataState: state,
                        type: state.type,
                        isIndexView: isIndexView,
                      ),
                    ),
                    if (state.loadDataShow.isLoading) ...[
                      SpinKitDoubleBounce(color: MyColors.red10Color),
                      SizedBox(
                        height: 10.w,
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: isIndexView
              ? Container(
                  width: 1.sw,
                  padding: EdgeInsets.only(bottom: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: state.activePage == 1
                            ? null
                            : () {
                                loadDataCubit.onBackPage();
                                loadDataCubit.onLoadDataList(
                                    selectedMenuItemName: watchMenuItemCubit
                                        .state.selectedItem.name);
                                // loadDataCubit.considerLoadDataOnBackIndex(
                                //     watchMenuItemCubit.state.selectedItem.name);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.darkPurple,
                          minimumSize: Size(10.w, 10.w),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 3),
                        ),
                        child: const Icon(
                          Icons.arrow_left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          '$currentPageIndex',
                          style: MyTextStyles.menu1Text(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          loadDataCubit.onNextPage();
                          loadDataCubit.onLoadDataList(
                              selectedMenuItemName:
                                  watchMenuItemCubit.state.selectedItem.name);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.darkPurple,
                          minimumSize: Size(10.w, 10.w),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 3),
                        ),
                        child: const Icon(
                          Icons.arrow_right,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
