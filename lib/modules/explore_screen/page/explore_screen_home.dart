import 'package:bookya/modules/explore_screen/widget/explore_screen_widget.dart';
import 'package:bookya/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class ExploreHomeScreen extends StatelessWidget {
  const ExploreHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconBroken.Heart,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.map,
            ),
          ),
        ],
      ),
      body: const ExploreScreenWidget(),
    );
  }
}
