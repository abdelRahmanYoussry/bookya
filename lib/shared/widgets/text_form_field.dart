import 'package:flutter/material.dart';
import 'package:bookya/shared/colors.dart';
class CustomTextFormField extends StatelessWidget {
  String? hint ;
  TextStyle? hintStyle ;
  String? Function(String?)?  onValidator;
  TextEditingController controller ;
  CustomTextFormField(this.controller ,{this.hint, this.hintStyle, this.onValidator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: onValidator,
      decoration: InputDecoration(
          hintText: hint ?? "",
          hintStyle: hintStyle ?? const  TextStyle(color: Colors.grey , fontSize: 20),
          enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.white)),
          focusedBorder:  InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          errorBorder:  UnderlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.red))
      ),
    );
  }
}

