part of './index.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key? key, this.menuItemCubit, this.number}) : super(key: key);

  MenuItemCubit? menuItemCubit;
  int? number;

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
              bool isSelectedUsers = state.selectedItem.id == state.menus[0].id;
              bool isSelectedRepos = state.selectedItem.id == state.menus[1].id;
              bool isSelectedIssues =
                  state.selectedItem.id == state.menus[2].id;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(
                          milliseconds:
                              StringConstant.durationAnimatedContainer),
                      height: isSelectedUsers ? 300.w : 290.w,
                      width: isSelectedUsers ? 140.w : 134.w,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors:
                                  MyColors.redOrangeGradient(isSelectedUsers)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: MenuContentWidget(
                        text: state.menus[0].name,
                        icon: Icons.person_outline,
                        isSelected: isSelectedUsers,
                      ),
                    ),
                    onTap: () {
                      KeyboardBehaviour.keyboardDisappear(context);
                      loadDataCubit.onChangeType(LoadDataCubitType.users);
                      widget.menuItemCubit
                          ?.updateSelectedMenuItem(state.menus[0]);
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
                              width: isSelectedRepos ? 240.w : 1.sh,
                              height: isSelectedRepos ? 176.w : 166.w,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: MyColors.redOrangeGradient(
                                          isSelectedRepos)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: MenuContentWidget(
                                text: state.menus[1].name,
                                icon: Icons.file_copy_outlined,
                                isSelected: isSelectedRepos,
                              ),
                            ),
                            onTap: () {
                              KeyboardBehaviour.keyboardDisappear(context);
                              loadDataCubit
                                  .onChangeType(LoadDataCubitType.repos);
                              widget.menuItemCubit
                                  ?.updateSelectedMenuItem(state.menus[1]);
                            }),
                        SizedBox(
                          height: 15.w,
                        ),
                        GestureDetector(
                            child: Container(
                              height: isSelectedIssues ? 120.w : 110.w,
                              width: isSelectedIssues ? 240.w : 1.sh,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: MyColors.redOrangeGradient(
                                          isSelectedIssues)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: MenuContentWidget(
                                text: state.menus[2].name,
                                icon: Icons.laptop_chromebook_outlined,
                                isSelected: isSelectedIssues,
                              ),
                            ),
                            onTap: () {
                              KeyboardBehaviour.keyboardDisappear(context);
                              loadDataCubit
                                  .onChangeType(LoadDataCubitType.issues);
                              widget.menuItemCubit
                                  ?.updateSelectedMenuItem(state.menus[2]);
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
