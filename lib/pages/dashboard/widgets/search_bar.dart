part of './index.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loadDataCubit = context.read<LoadDataCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 90.w),
          child: Row(
            children: [
              Text(
                'Search around the ',
                style: MyTextStyles.body1Text(color: Colors.white),
              ),
              Text(
                'GitHub world!',
                style: MyTextStyles.body2Text(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        Container(
          width: 1.sw, //!
          height: 62.w,
          padding: EdgeInsets.fromLTRB(10.w, 7.w, 0, 7.w),
          decoration: BoxDecoration(
            color: MyColors.cream20Color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.r),
                topLeft: Radius.circular(100.r)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<MenuItemCubit, MenuItemState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: (() {
                      loadDataCubit.onTextFieldChange(_controller.text);
                      loadDataCubit.onLoadDataList(
                        selectedMenuItemName: state.selectedItem.name,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              ContentsBrowsePage(),
                        ),
                      );

                      _controller.clear();
                    }),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.red10Color,
                      minimumSize: Size(82.w, 48.w),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r))),
                    ),
                    child: Icon(
                      Icons.search_outlined,
                      size: 35.w,
                    ),
                  );
                },
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                  child: TextFieldWidget(
                controller: _controller,
              ))
            ],
          ),
        )
      ],
    );
  }
}
