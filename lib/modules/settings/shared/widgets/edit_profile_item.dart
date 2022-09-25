import 'package:flutter/material.dart';

class EditProfileItem extends StatelessWidget {
  final String text;
  final String hintText;
  final bool isPassword;
  final TextInputType keyBoard;
  String? Function(String?)  onValidator;
  TextEditingController controller ;

  EditProfileItem({
    Key? key,
    required this.text,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.onValidator,
    required this.keyBoard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const Spacer(),
        Container(
          width: 170.0,
          height: 50.0,
          child: TextFormField(
            obscureText: isPassword,
            keyboardType: keyBoard,
            controller: controller,
            validator:onValidator,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.normal,
              ),
            ),
            cursorHeight: 25,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
