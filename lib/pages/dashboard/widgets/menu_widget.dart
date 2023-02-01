part of './index.dart';

class MenuWidget extends StatefulWidget {
  final int? number;

  const MenuWidget({super.key, this.number});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final loadDataCubit = context.read<LoadDataCubit>();
    final menuItemCubit = context.read<MenuItemCubit>();
    menuItemCubit.getMenuItem([
      const MenuItemMdl(id: '1', name: 'Users'),
      const MenuItemMdl(id: '2', name: 'Repos'),
      const MenuItemMdl(id: '3', name: 'Issues'),
    ]);

    return SizedBox(
      width: 300.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<MenuItemCubit, MenuItemState>(
            builder: (_, state) {
              bool isMenuUsersActive =
                  state.selectedMenu.id == state.menus[0].id;
              bool isMenuReposActive =
                  state.selectedMenu.id == state.menus[1].id;
              bool isMenuIssuesActive =
                  state.selectedMenu.id == state.menus[2].id;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(
                          milliseconds:
                              StringConstant.durationAnimatedContainer),
                      height: isMenuUsersActive ? 300.w : 290.w,
                      width: isMenuUsersActive ? 140.w : 134.w,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: MyColors.redOrangeGradient(
                                  isMenuUsersActive)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: MenuContentWidget(
                        text: state.menus[0].name,
                        icon: Icons.person_outline,
                        isSelected: isMenuUsersActive,
                      ),
                    ),
                    onTap: () {
                      KeyboardBehaviour.keyboardDisappear(context);
                      loadDataCubit.onChangeType(LoadDataType.users);
                      menuItemCubit.updateSelectedMenuItem(state.menus[0]);
                    },
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: isMenuReposActive ? 240.w : 1.sh,
                              height: isMenuReposActive ? 176.w : 166.w,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: MyColors.redOrangeGradient(
                                          isMenuReposActive)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: MenuContentWidget(
                                text: state.menus[1].name,
                                icon: Icons.file_copy_outlined,
                                isSelected: isMenuReposActive,
                              ),
                            ),
                            onTap: () {
                              KeyboardBehaviour.keyboardDisappear(context);
                              loadDataCubit.onChangeType(LoadDataType.repos);
                              menuItemCubit
                                  .updateSelectedMenuItem(state.menus[1]);
                            }),
                        SizedBox(
                          height: 15.w,
                        ),
                        GestureDetector(
                            child: Container(
                              height: isMenuIssuesActive ? 120.w : 110.w,
                              width: isMenuIssuesActive ? 240.w : 1.sh,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: MyColors.redOrangeGradient(
                                          isMenuIssuesActive)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: MenuContentWidget(
                                text: state.menus[2].name,
                                icon: Icons.laptop_chromebook_outlined,
                                isSelected: isMenuIssuesActive,
                              ),
                            ),
                            onTap: () {
                              KeyboardBehaviour.keyboardDisappear(context);
                              loadDataCubit.onChangeType(LoadDataType.issues);
                              menuItemCubit
                                  .updateSelectedMenuItem(state.menus[2]);
                            }),
                      ],
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
