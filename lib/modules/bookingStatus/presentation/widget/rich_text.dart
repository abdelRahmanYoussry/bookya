import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:flutter/material.dart';

class TextWithTwoColors extends StatelessWidget {
  final String bigText;
  final String smallText;
  final Color bigTextColor;
  final Color smallTextColor;
  final double bigTextFontSize;
  final double smallTextFontSize;
  TextWithTwoColors({
    Key? key,
    required this.bigText,
    required this.smallText,
    this.smallTextFontSize = 16,
    this.bigTextFontSize = 18,
    this.bigTextColor = Colors.black,
    this.smallTextColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: DarkModeBloc.get(context).isDark ? const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: Colors.white,
        ): Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 18.0,
        ),
        text: bigText,
        children: [
          TextSpan(
              text: smallText,
              style: DarkModeBloc.get(context).isDark ? const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ) : Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 16.0,
              ),
          ),
        ],
      ),
    );
  }
}
