import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/home/HomeCubit/home_state.dart';
import 'package:bookya/modules/home/presentation/widgets/TextFormField.dart';
import 'package:bookya/modules/settings/modules/explore_screen/page/explore_screen_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExploreModel {
  final String image;
  final String title;
  final String body;

  ExploreModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

ExploreModel? model;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var myScrollCon1 = ScrollController();
    var myScrollCon2 = ScrollController();
    var boardController = PageController();
    List<ExploreModel> exploreList = [
      ExploreModel(
          image: 'assets/images/rome.jpg',
          title: 'Rome ',
          body: ' Have Fun in Rome'),
      ExploreModel(
          image: 'assets/images/cairo2.jpg',
          title: 'Cairo',
          body: 'Have Fun in Cairo '),
      ExploreModel(
          image: 'assets/images/london.jpg',
          title: 'London ',
          body: 'Have Fun in London'),
    ];

    TextEditingController searchTextController = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.2),

          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: myScrollCon1,
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                expandedHeight: mediaQuery.height / 2.5,
                pinned: true,
                automaticallyImplyLeading: false,
                toolbarHeight: mediaQuery.height / 6,
                title:  MyTextFormField(
                    onTap: () {},
                    onSubmit: () {},
                    prefix: IconButton(
                        icon: Icon(Icons.search,
                            color: Theme.of(context).primaryColor,
                            size: 28),
                        onPressed: () {}),
                    hintStyle: TextStyle(
                        color: Theme.of(context).backgroundColor),
                    readOnly: true,
                    onChanged: () {},
                    control: searchTextController,
                    type: TextInputType.text,
                    isPassword: false,
                    hint: 'Where are you going',
                    borderColor: Theme.of(context).textTheme.subtitle1!.color,
                    labelColor: Theme.of(context).textTheme.caption!.color!,
                    textColor: Theme.of(context).backgroundColor,
                    backgroundColor: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .color!),
                flexibleSpace: Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.bottomLeft,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: mediaQuery.height,
                          autoPlay: true,
                          autoPlayAnimationDuration: (const Duration(seconds: 2)),
                          reverse: false,
                          initialPage: 0,
                          autoPlayCurve: Curves.bounceInOut,
                          scrollDirection: Axis.horizontal,
                          autoPlayInterval: const Duration(seconds: 5),
                          viewportFraction: 1,
                          onPageChanged: (int index, reson) {
                            HomeCubit.get(context).changeIndicatorIndex(index, reson);
                          }),
                      items: exploreList.map((e) => Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(e.image))),
                              ),
                          Padding(
                            padding:  const EdgeInsets.symmetric(
                                horizontal: 20.0,vertical: 40),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const ExploreHomeScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor
                                        .withOpacity(0.5),
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                      right: Radius.circular(20),
                                    )),
                                width:mediaQuery.width/2.5,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Hotels in ${e.title}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                        color: Theme.of(
                                            context)
                                            .backgroundColor,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding:  EdgeInsets.symmetric(vertical:
                          //       mediaQuery.height/8
                          //   ),
                          //   child: FlexibleSpaceBar(
                          //     stretchModes: const [
                          //       StretchMode.fadeTitle
                          //     ],
                          //     title: Text(
                          //       e.title.toUpperCase(),
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .subtitle1!
                          //           .copyWith(color: Colors.white),
                          //     ),
                          //   ),
                          // ) ,

                          // FlexibleSpaceBar(
                          //   stretchModes: const [
                          //     StretchMode.fadeTitle
                          //   ],
                          //   title: Text(
                          //     e.body,
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .headline6!
                          //         .copyWith(color: Colors.white),
                          //   ),
                          // ) ,

                        ],
                      ))
                          .toList(),
                    ),
                    //button
                    //indicator
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                          child: AnimatedSmoothIndicator(
                            activeIndex:
                            HomeCubit.get(context)
                                .indicatorIndex,
                            count: exploreList.length,
                            effect: WormEffect(
                                activeDotColor: Theme.of(context).primaryColor,
                                dotColor: Theme.of(context).primaryColor.withOpacity(0.2)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                stretch: true,
              ),
              SliverToBoxAdapter(
                child:    Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'Beast Deals',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .color,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            'View all',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ) ,
              ),
              SliverList(delegate: SliverChildListDelegate([
                ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                )),
                            child: Row(
                              children: [
                                Container(
                                  width: mediaQuery.height / 6,
                                  height: mediaQuery.width / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.black.withOpacity(0.6),
                                          Colors.black.withOpacity(0.2)
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                            Colors.black.withOpacity(0.4),
                                            spreadRadius: 1,
                                            blurRadius: 9,
                                            offset: const Offset(-12, 12)),
                                        // BoxShadow(
                                        //   color: Colors.black.withOpacity(0.3),
                                        //   spreadRadius:1,
                                        //   blurRadius: 8,
                                        //   offset: Offset(-10,10)
                                        //
                                        // ),
                                      ],
                                      image: const DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: AssetImage(
                                              'assets/images/hotel1.jpg'))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text('Grand Royal Hotel',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge),
                                      Text(
                                        'wembley,london',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 18,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            Text(
                                              '2.0 Km to city',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$180',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            Text(
                                              '/per night',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: 6)

              ]

              ))
            ],
          ),
        );
      },
    );
  }
}

Widget carouselSliderViewBuilder(context) {
  List<ExploreModel> exploreList = [
    ExploreModel(
        image: 'assets/images/rome.jpg',
        title: 'Rome ',
        body: ' Have Fun in Rome'),
    ExploreModel(
        image: 'assets/images/cairo2.jpg',
        title: 'Egypt',
        body: 'Have Fun in Cairo '),
    ExploreModel(
        image: 'assets/images/london.jpg',
        title: 'London ',
        body: 'Have Fun in London'),
  ];
  var mediaQuery = MediaQuery.of(context).size;
  TextEditingController searchTextController = TextEditingController();
  return CarouselSlider(
    options: CarouselOptions(
        height: mediaQuery.height,
        autoPlay: true,
        autoPlayAnimationDuration: (const Duration(seconds: 2)),
        reverse: false,
        initialPage: 0,
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        autoPlayInterval: const Duration(seconds: 5),
        viewportFraction: 1,
        onPageChanged: (int index, reson) {
          HomeCubit.get(context).changeIndicatorIndex(index, reson);
        }),
    items: exploreList
        .map((e) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(e.image))),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
                child: Stack(
                  children: [
                    MyTextFormField(
                        onTap: () {},
                        onSubmit: () {},
                        prefix: IconButton(
                            icon: Icon(Icons.search,
                                color: Theme.of(context).primaryColor,
                                size: 28),
                            onPressed: () {}),
                        hintStyle:
                            TextStyle(color: Theme.of(context).backgroundColor),
                        readOnly: true,
                        onChanged: () {},
                        control: searchTextController,
                        type: TextInputType.text,
                        isPassword: false,
                        hint: 'Where are you going',
                        borderColor:
                            Theme.of(context).textTheme.subtitle1!.color,
                        labelColor: Theme.of(context).textTheme.caption!.color!,
                        textColor: Theme.of(context).backgroundColor,
                        backgroundColor:
                            Theme.of(context).textTheme.subtitle1!.color!),
                    SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: mediaQuery.height / 3.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              e.body,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ExploreHomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          left: Radius.circular(20),
                                          right: Radius.circular(20),
                                        )),
                                    width: mediaQuery.width / 2.5,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'View Hotel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                AnimatedSmoothIndicator(
                                  activeIndex:
                                      HomeCubit.get(context).indicatorIndex,
                                  count: exploreList.length,
                                  effect: WormEffect(
                                      activeDotColor:
                                          Theme.of(context).primaryColor,
                                      dotColor: Colors.grey.withOpacity(0.4)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList(),
  );
}
