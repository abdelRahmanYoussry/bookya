import 'package:bookya/modules/map/map_screen.dart';
import 'package:bookya/modules/settings/modules/explore_screen/widget/explore_screen_widget.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';

import 'package:flutter/material.dart';

class ExploreHomeScreen extends StatelessWidget {
  bool isLiked=false;
   ExploreHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookya',
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     isLiked=true;
          //   },
          //   icon: isLiked? Icon(
          //     IconBroken.Heart,
          //   ):
          //   Icon(
          //     Icons.favorite
          //   ),
          // ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return  MapScreen();
              }));
            },
            icon: const Icon(
              Icons.map,size: 30,
            ),
          ),
        ],
      ),
      body: const ExploreScreenWidget(),
    );
  }
}
