import 'package:bookya/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  BuildContext context ;
  String title;
  void Function()? onTap;
   CustomTextButton( this.context,this.title,{Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onTap!();
      } ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
        padding:const  EdgeInsets.symmetric(horizontal: 40 , vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(32)
        ),
        child: Text(title , style:  const TextStyle(color: Colors.white, fontSize: 18 , fontWeight: FontWeight.w500),),
      ),
    );
  }
}

