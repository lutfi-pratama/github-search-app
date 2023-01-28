part of './index.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, this.controller}) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: MyColors.red10Color,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: 'search...',
          contentPadding: EdgeInsets.symmetric(vertical: 0)),
    );
  }
}
