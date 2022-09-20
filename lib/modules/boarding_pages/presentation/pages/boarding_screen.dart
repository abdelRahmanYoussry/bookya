import 'package:bookya/modules/boarding_pages/presentation/widgets/first_widget.dart';
import 'package:flutter/material.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: FirstWidget(),
    );
  }
}
