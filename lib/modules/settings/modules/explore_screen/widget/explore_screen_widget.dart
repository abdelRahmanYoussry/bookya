import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/explore_item.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ExploreScreenWidget extends StatelessWidget {
  const ExploreScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose date',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '20, Sep - 25, Sep',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  color: DarkModeBloc.get(context).isDark ? Colors.white :HexColor('#1a1a1a') ,
                  thickness: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Number of rooms',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1 Room 2 People',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 5,
            ),
            child: MyDivider(),
          ),
          Row(
            children: [
              Text(
                '530 Hotels found',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight:DarkModeBloc.get(context).isDark ? FontWeight.w400: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Text(
                'Filter',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: DarkModeBloc.get(context).isDark ? FontWeight.w400: FontWeight.w600,
                    ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconBroken.Filter_2,
                    color: defaultColor,

                  ))
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const ExploreItem(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30.0,
                ),
                itemCount: 4,
            ),
          ),

        ],
      ),
    );
  }
}
