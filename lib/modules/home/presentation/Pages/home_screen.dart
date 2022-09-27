import 'dart:ffi';

import 'package:bookya/modules/bookingStatus/data/network/endpoints.dart';
import 'package:bookya/modules/bookingStatus/presentation/widget/rating_stars.dart';
import 'package:bookya/modules/home/Data/HomeModels/HomeDataInData.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/home/HomeCubit/home_state.dart';
import 'package:bookya/modules/home/presentation/Pages/hotel_details_fullscreen.dart';
import 'package:bookya/modules/home/presentation/widgets/TextFormField.dart';
import 'package:bookya/modules/settings/modules/explore_screen/page/explore_screen_home.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_page/search_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';



List<StorageItem> item = [
  StorageItem(itemID: 1, name: "Grand Royal Hotel"),
  StorageItem(itemID: 2, name: "Grand Royal Hotel2"),
  StorageItem(itemID: 3, name: "Grand Royal Hotel3"),
  StorageItem(itemID: 4, name: "Grand Royal Hotel4")
];

class StorageItem {
  final int itemID;
  String name;



  StorageItem({
    required this.itemID,
    required this.name,
  });

}


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
                expandedHeight: mediaQuery.height / 1.8,
                pinned: true,
                automaticallyImplyLeading: false,
                toolbarHeight: mediaQuery.height / 6,
                title:  MyTextFormField(
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: SearchPage<DataInData>(
                            onQueryUpdate: (s) => debugPrint(s),
                            failure:
                            const Center(child: Text('No item found ')),
                            items:
                            HomeCubit.get(context).homeModel!.data!.data!,
                            searchLabel: ' Where Are you Going?',
                            suggestion: Center(
                              child: Text(
                                'Search by Hotel Name, Address',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            filter: (h) => [
                              h.name,
                              h.address,
                            ],
                            builder: (b) => InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenDetailsHotelScreen(
                                  hotelName: b.name!,
                                  hotelId: b.id!,
                                  address: b.address!,
                                  price: b.price!,
                                  rate: double.parse(b.rate!),
                                  description: b.description!,
                                  image: ['https://img.freepik.com/free-photo/beautiful-luxury-outdoor-swimming-pool-hotel-resort_74190-7433.jpg?size=626&ext=jpg&ga=GA1.2.1790598675.1657719862,'],
                                ),),);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                ),
                                child: ListTile(
                                  title: Text(b.name!),
                                  subtitle: Text(b.address!,),
                                ),
                              ),
                            ),
                          )
                      );
                    },
                    onSubmit: () {},
                    prefix: IconButton(
                        icon: Icon(Icons.search,
                            color: defaultColor,
                            size: 28),
                        onPressed: () {}),
                    hintStyle: TextStyle(
                        color: DarkModeBloc.get(context).isDark ? Colors.black : Colors.white,),
                    readOnly: false,
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
                          //button
                          Padding(
                            padding:  const EdgeInsets.symmetric(
                                horizontal: 20.0,vertical: 40),
                            child: InkWell(
                              onTap: () {
                                HomeCubit.get(context).getHotels();
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
                                    color: defaultColor.withOpacity(0.8),
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

                        ],
                      ))
                          .toList(),
                    ),
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
                                activeDotColor: defaultColor,
                                dotColor: Theme.of(context).primaryColor.withOpacity(0.4)),
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
                      horizontal: 10.0, vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        'Best Deals',
                        style: TextStyle(
                          fontSize: 26.0,
                            color: DarkModeBloc.get(context).isDark ? Colors.white : Colors.black),
                        ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                              color: defaultColor,
                              fontSize: 18.0,
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: defaultColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ) ,
              ),
              SliverList(delegate: SliverChildListDelegate([
                ConditionalBuilder(
                  condition: HomeCubit.get(context).homeModel!=null,
                  fallback: (context)=>Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor),),
                  builder: (context)=>ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount:HomeCubit.get(context).homeModel!.data!.data!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenDetailsHotelScreen(
                            hotelName: HomeCubit.get(context).homeModel!.data!.data![index].name!,
                            hotelId: HomeCubit.get(context).homeModel!.data!.data![index].id!,
                            description: HomeCubit.get(context).homeModel!.data!.data![index].description!,
                            address: HomeCubit.get(context).homeModel!.data!.data![index].address!,
                            price: HomeCubit.get(context).homeModel!.data!.data![index].price!,
                            image: [
                          // ignore: unrelated_type_equality_checks
                          if (baseUrlWithNoApI +
                          "images/" +
                          '${HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.isEmpty}' ==
                              'http://api.mahmoudtaha.com/images/false')
                          [
                          baseUrlWithNoApI +
                              "images/" +
                              '${HomeCubit.get(context).homeModel!.data!.data![index].hotelImages![0].image}',
                              baseUrlWithNoApI +
                                  "images/" +
                                  '${HomeCubit.get(context).homeModel!.data!.data![index].hotelImages![1].image}'
                              ]
                              else
                              'No data to show'
                              ],
                            rate: double.parse(HomeCubit.get(context).homeModel!.data!.data![index].rate!),
                          ),),);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0),
                          child: Container(
                            height: mediaQuery.height/6,
                            width: mediaQuery.width/2,
                            decoration: BoxDecoration(
                                color: defaultColor, // Container background color
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mediaQuery.width/ 4.5,
                                    height: mediaQuery.height / 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),

                                        ),
                                        // image:HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.isNotEmpty?
                                        // DecorationImage(
                                        //     filterQuality: FilterQuality.low,
                                        //    isAntiAlias: true,
                                        //     fit: BoxFit.fill,
                                        //     image:
                                        //     NetworkImage(
                                        //       'http://api.mahmoudtaha.com/images/${HomeCubit.get(context).homeModel!.data!.data![index].hotelImages![0].image}')
                                        //     // ): AssetImage(
                                        //     //     'assets/images/hotel1.jpg')
                                        // ):
                                        // const DecorationImage(
                                        //     fit: BoxFit.fill,
                                        //     image: AssetImage(
                                        //       'assets/images/noimage.jpg')
                                        // )
                                    ),
                                    child:HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.isNotEmpty?
                                    CarouselSlider(
                                      options:CarouselOptions(
                                          height: mediaQuery.height,
                                          autoPlay: true,
                                          autoPlayAnimationDuration: (const Duration(seconds: 1)),
                                          reverse: false,
                                          initialPage: 0,
                                          autoPlayCurve: Curves.decelerate,
                                          scrollDirection: Axis.horizontal,
                                          autoPlayInterval: const Duration(seconds: 2),
                                          viewportFraction: 1,
                                          onPageChanged: (int index, reson) {
                                            HomeCubit.get(context).changeIndicatorIndex(index, reson);
                                          }) ,
                                      items:HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.map((e) =>
                                          Container(
                                            width: mediaQuery.width/ 3.5,
                                            height: mediaQuery.height / 8,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),

                                                ),
                                                image:HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.isNotEmpty?
                                                DecorationImage(
                                                    isAntiAlias: true,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        'http://api.mahmoudtaha.com/images/${e.image}')
                                                ):
                                                const DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/images/noimage.jpg')
                                                )
                                            ),
                                          ),
                                      ).toList() ,
                                    ):
                                    const Image(image: AssetImage('assets/images/noimage.jpg')) ,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${HomeCubit.get(context).homeModel!.data!.data![index].name}'.toUpperCase(),
                                            style: Theme.of(context).textTheme.labelLarge),
                                        Text(
                                          '${HomeCubit.get(context).homeModel!.data!.data![index].address}'.toUpperCase(),
                                          style: Theme.of(context).textTheme.caption,
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 18,
                                              color: DarkModeBloc.get(context).isDark ? Colors.black : Colors.white,
                                            ),
                                            Text(
                                              '2.0 Km to city',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                         Rating(
                                          rate: double.parse(HomeCubit.get(context).homeModel!.data!.data![index].rate!),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Container(
                                      //   width: 60,height: 60,
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.red,
                                      //   ),
                                      //   child: CarouselSlider(
                                      //     options:CarouselOptions(
                                      //         height: mediaQuery.height,
                                      //         autoPlay: true,
                                      //         autoPlayAnimationDuration: (const Duration(seconds: 2)),
                                      //         reverse: false,
                                      //         initialPage: 0,
                                      //         autoPlayCurve: Curves.bounceInOut,
                                      //         scrollDirection: Axis.horizontal,
                                      //         autoPlayInterval: const Duration(seconds: 5),
                                      //         viewportFraction: 1,
                                      //         onPageChanged: (int index, reson) {
                                      //           HomeCubit.get(context).changeIndicatorIndex(index, reson);
                                      //         }) ,
                                      //     items:HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.map((e) =>
                                      //         Container(
                                      //           width: mediaQuery.width/ 3.5,
                                      //           height: mediaQuery.height / 8,
                                      //           decoration: BoxDecoration(
                                      //               color: Colors.white,
                                      //               borderRadius: const BorderRadius.only(
                                      //                 topLeft: Radius.circular(20),
                                      //                 bottomLeft: Radius.circular(20),
                                      //                 topRight: Radius.circular(20),
                                      //                 bottomRight: Radius.circular(20),
                                      //
                                      //               ),
                                      //               image:HomeCubit.get(context).homeModel!.data!.data![index].hotelImages!.isNotEmpty?
                                      //               DecorationImage(
                                      //                   isAntiAlias: true,
                                      //                   fit: BoxFit.fill,
                                      //                   image: NetworkImage(
                                      //                       'http://api.mahmoudtaha.com/images/${e.image}')
                                      //               ):
                                      //               const DecorationImage(
                                      //                   fit: BoxFit.fill,
                                      //                   image: AssetImage(
                                      //                       'assets/images/noimage.jpg')
                                      //               )
                                      //           ),
                                      //         ),
                                      //     ).toList() ,
                                      //   ),
                                      // ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          'EGP${HomeCubit.get(context).homeModel!.data!.data![index].price}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,maxLines: 1,overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        '/per night',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                  ),

                ),


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
                                color: defaultColor,
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
                                          defaultColor,
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
