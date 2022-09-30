import 'package:bookya/modules/filtter/pages/filtter_screen.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_states.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/explore_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ExploreScreenWidget extends StatefulWidget {
  const ExploreScreenWidget({Key? key}) : super(key: key);

  @override
  State<ExploreScreenWidget> createState() => _ExploreScreenWidgetState();
}

class _ExploreScreenWidgetState extends State<ExploreScreenWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.extentAfter == 0 &&
          !HomeCubit.get(context).isEnd && HomeCubit.get(context).lastPage > HomeCubit.get(context).currentIndex
      ) {
        debugPrint('Max Scroll end');
        debugPrint(HomeCubit.get(context).homeModel!.data!.lastPage!.toString());
        HomeCubit.get(context).toggleIsEnd();
        HomeCubit.get(context).getHotels();
      }
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverAppBarDelegate(
              minHeight: 150,
              maxHeight: 154,
              child: Container(
                color:  Theme.of(context).scaffoldBackgroundColor,
                height: 150,
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
                          '${HomeCubit.get(context).homeModel!.data!.total} Hotels found',
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
                            onPressed: () {
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
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ConditionalBuilder(
                condition: HomeCubit.get(context).homeModel != null,
                fallback: (context) => Center(
                  child: CircularProgressIndicator(
                    color: defaultColor,
                  ),
                ),
                builder: (context) => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ExploreItem(
                    index: index,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 30.0,
                  ),
                  itemCount:
                      HomeCubit.get(context).homeModel!.data!.data!.length,
                ),
              ),
            ]
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    // debugPrint('progress => $progress');

    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
