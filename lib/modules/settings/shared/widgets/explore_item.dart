
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/icon_broken.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0,),
                  topLeft: Radius.circular(15.0,),
                ),
                child: Image(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/pools-water.png',),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: DarkModeBloc.get(context).isDark ? HexColor('#2c2c2c') : Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Grand Royal Hotel',
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$150',
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            'Wembley, London',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.teal,
                          ),
                          Text(
                            '2 Km to...',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const Spacer(),
                          Text(
                            '/per night',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              right: 10.0,
            ),
            child: CircleAvatar(
              backgroundColor: DarkModeBloc.get(context).isDark ? HexColor('#1a1a1a') : Colors.white,
              radius: 25.0,
              child: IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    IconBroken.Heart,
                    size: 26,
                    color: defaultColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
