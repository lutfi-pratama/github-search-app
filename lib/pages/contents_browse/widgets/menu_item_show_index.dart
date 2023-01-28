import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/resources/resources.dart';

class MenuItemShowIndex extends StatelessWidget {
  MenuItemShowIndex(
      {Key? key,
      required this.icon,
      this.isSelected = false,
      required this.callback})
      : super(key: key);

  final IconData? icon;
  bool isSelected;
  void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isSelected ? 81.w : 73.w,
          height: isSelected ? 39.w : 35.w,
          padding: EdgeInsets.symmetric(vertical: isSelected ? 8.w : 10.w),
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: MyColors.redOrangeGradient(true)),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: FittedBox(
            child: Icon(
              icon,
              color: Colors.white.withOpacity(isSelected ? 1 : 0.6),
            ),
          ),
        ));
  }
}
