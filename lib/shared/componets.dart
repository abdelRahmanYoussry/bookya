
import 'package:flutter/material.dart';

void navigateTo(context, {required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) => Widget),
        (route) => false);
