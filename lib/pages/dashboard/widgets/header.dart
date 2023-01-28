part of './index.dart';

class Header extends StatelessWidget {
  const Header({Key? key, this.headerText = ''}) : super(key: key);

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/dashboard/github_search.svg'),
          SizedBox(
            height: 19.w,
          ),
          Text(
            headerText,
            style: MyTextStyles.body1Text(),
          ),
        ],
      ),
    );
  }
}
