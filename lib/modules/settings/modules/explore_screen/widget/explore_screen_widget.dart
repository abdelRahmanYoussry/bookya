import 'package:bookya/modules/filtter/FilterCubit/filter_cubit.dart';
import 'package:bookya/modules/filtter/pages/filtter_screen.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/explore_item.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

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
                        '29, Sep - 30, Sep',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  color: DarkModeBloc.get(context).isDark
                      ? Colors.white
                      : HexColor('#1a1a1a'),
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
                '7 Hotels found',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: DarkModeBloc.get(context).isDark
                          ? FontWeight.w400
                          : FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Text(
                'Filter',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: DarkModeBloc.get(context).isDark
                          ? FontWeight.w400
                          : FontWeight.w600,
                    ),
              ),
              IconButton(
                  onPressed: ()async {
                   await FilterCubit.get(context).getFacilities();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    IconBroken.Filter_2,
                    color: defaultColor,
                    size: 30,
                  ))
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ConditionalBuilder(
              condition: HomeCubit.get(context).homeModel != null,
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ExploreItem(
                  index: index,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30.0,
                ),
                itemCount:HomeCubit.get(context).homeModel!.data!.data!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
