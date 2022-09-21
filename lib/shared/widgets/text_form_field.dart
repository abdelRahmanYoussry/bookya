import 'package:bookya/shared/colors.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  String? hint ;
  TextStyle? hintStyle ;
  String? Function(String?)?  onValidator;
  void Function()?  onIconPress;
  TextEditingController controller ;
  Icon? suffexIcon ;
  bool? obscureText ;
  CustomTextFormField(this.controller ,{this.hint, this.hintStyle, this.onValidator,this.suffexIcon ,this.onIconPress ,this.obscureText  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: onValidator,
      obscureText: obscureText ?? false ,
      decoration: InputDecoration(
          hintText: hint ?? "",
          hintStyle: hintStyle ?? const  TextStyle(color: Colors.grey , fontSize: 20),
          enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.white)),
          focusedBorder:  InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          errorBorder:  UnderlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.red)),
          suffixIcon: GestureDetector(
              onTap: (){
                if(onIconPress != null){
                  onIconPress!();
                }
              },
              child: suffexIcon ??  Container(width: 0,height: 0,)) ,
        suffixIconColor: mainColor

      ),
    );
  }
}

