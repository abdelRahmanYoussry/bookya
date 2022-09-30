import 'package:bookya/modules/filtter/FilterCubit/filter_cubit.dart';
import 'package:bookya/modules/filtter/FilterCubit/filter_state.dart';
import 'package:bookya/modules/settings/modules/explore_screen/page/explore_screen_home.dart';
import 'package:bookya/modules/settings/modules/explore_screen/widget/explore_screen_widget.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/shared/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bookingStatus/presentation/widget/rating_stars.dart';


SfRangeValues priceSlider = const SfRangeValues(0, 1000);
SfRangeValues distanceSlider = const SfRangeValues(0.5, 20);

bool isChecked1 = false;
bool isChecked2 = false;
bool isChecked3 = false;
bool isChecked4 = false;
bool isChecked5 = false;

bool status1 = false;
bool status2 = false;
bool status3 = false;
bool status4 = false;
bool status5 = false;
bool status6 = false;

List<int>facilityList=[];

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return BlocConsumer<FilterCubit, FilterState>(

      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  const Text("Filter", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),),

          ),
          body: ConditionalBuilder(
            condition: FilterCubit.get(context).facilitiesData!=null,
            fallback: (context)=>Center(child: CircularProgressIndicator(color: mainColor)),
            builder:(context)=> SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    const Text("price / ber night", style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey
                    ),),
                    //priceSlider
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: SfRangeSlider(
                        min: 0,
                        max: 1000,
                        values: priceSlider,
                        interval: 200,
                        showTicks: false,
                        stepSize: 10,
                        shouldAlwaysShowTooltip: true,
                        // thumbShape:  const SfThumbShape(),
                        // tooltipTextFormatterCallback: (v,f){
                        //        return    f.toUpperCase();
                        // },
                        showLabels: false,
                        enableTooltip: true,
                        minorTicksPerInterval: 2,
                        activeColor: defaultColor,
                        onChanged: (SfRangeValues values) {
                          setState(() {
                            priceSlider = values;
                            print('$priceSlider  _value');
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(color: Colors.grey, height: 1,),
                    const SizedBox(height: 10,),
                     Text("Popular Filter", style: TextStyle(
                        fontSize: 20,
                        color:  DarkModeBloc.get(context).isDark?Colors.white:Colors.black
                    ),),
                    const SizedBox(height: 20,),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: FilterCubit.get(context).facilitiesData!.data!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          mainAxisExtent: 50,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,),
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0,),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: DarkModeBloc.get(context).isDark?Colors.black:Colors.white,
                                  // Container background color
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,),
                                child: Row(
                                  children: [
                                    Image(
                                        image: NetworkImage(
                                      '${FilterCubit.get(context).facilitiesData!.data![index].image}',
                                    ),fit: BoxFit.cover,width: 30,color:FilterCubit.get(context).facilitiesData!.data![index].isChecked!?
                                      defaultColor:DarkModeBloc.get(context).isDark?Colors.white:Colors.black
                                    ),
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Checkbox(
                                        checkColor: defaultColor,
                                        fillColor: MaterialStateProperty.resolveWith((
                                            states) =>DarkModeBloc.get(context).isDark?Colors.white:Colors.black),
                                        value: FilterCubit.get(context).facilitiesData!.data![index].isChecked!,
                                        onChanged: (value) {
                                          setState(() {
                                            print(value.toString());
                                            if(value==true){
                                              FilterCubit.get(context).facilitiesData!.data![index].isChecked=true;
                                            }else{
                                              FilterCubit.get(context).facilitiesData!.data![index].isChecked=false;
                                            }

                                          });
                                        },),
                                    ),
                                    Expanded(
                                      child: Text('${FilterCubit.get(context).facilitiesData!.data![index].name}',
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          fontSize: 18
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 20,),
                    ConditionalBuilder(
                        condition: state is  SuccessStateGetSearch ,
                        fallback: (context)=>Stack(
                          children: [
                            Container(
                              child: Image(
                                fit: BoxFit.cover,
                                height: mediaQuery.height/4,
                                width: mediaQuery.width,
                                image: const AssetImage(
                                  'assets/images/Bookya.png'),),
                            ),
                            Container(
                              height: mediaQuery.height/3.5,
                              width: mediaQuery.width,
                              decoration: BoxDecoration(
                                color: DarkModeBloc.get(context).isDark?Colors.black.withOpacity(0.5):Colors.white.withOpacity(0.1)
                              ),

                            ),
                            // Center(
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //         top: 30,bottom: 50),
                            //     child: Container(
                            //       height: mediaQuery.height/5,
                            //       width: mediaQuery.width/1.8,
                            //       decoration: BoxDecoration(
                            //         color: Colors.transparent
                            //       ),
                            //
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        builder: (context)=>SizedBox(
                          height: mediaQuery.height/3,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            physics:const BouncingScrollPhysics() ,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '${FilterCubit.get(context).searchData!.faciltydata!.hotelData!.length.toString()} Hotels Found'
                                        .toUpperCase(),
                                    style: TextStyle(fontSize: 18,color: defaultColor),

                                  ),
                                  // width: mediaQuery.width/2 ,
                                ),
                                const SizedBox(height: 15,),
                                ListView.separated(
                                  shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (BuildContext context, int index)=>const SizedBox(height: 15,),
                                  itemCount: FilterCubit.get(context).searchData!.faciltydata!.hotelData!.length,
                                  itemBuilder: (context,index)=>Container(
                                      width: mediaQuery.width/2,
                                      height: mediaQuery.height/8,
                                      decoration: BoxDecoration(
                                          color: DarkModeBloc.get(context).isDark
                                              ? Colors.black
                                              : Colors.white,
                                          // Container background color
                                          borderRadius: const BorderRadius.horizontal(
                                            left: Radius.circular(20),
                                            right: Radius.circular(20),
                                          )),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: mediaQuery.width / 4.5,
                                            height: mediaQuery.height / 8,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                const BorderRadius
                                                    .only(
                                                  topLeft:
                                                  Radius.circular(
                                                      20),
                                                  bottomLeft:
                                                  Radius.circular(
                                                      20),
                                                  topRight:
                                                  Radius.circular(
                                                      0),
                                                  bottomRight:
                                                  Radius.circular(
                                                      0),
                                                ),
                                                image: FilterCubit.get(context).facilitiesData!.data!.isNotEmpty
                                                    ? DecorationImage(
                                                    isAntiAlias: true,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        'http://api.mahmoudtaha.com/images/${FilterCubit.get(context).searchData!.faciltydata!.hotelData![index].hotelImages![0].image}'))
                                                    : const DecorationImage(
                                                    fit: BoxFit
                                                        .fill,
                                                    image: AssetImage(
                                                        'assets/images/noimage.jpg'))),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 15.0,top: 5,bottom: 5
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: mediaQuery.width / 1.7,
                                                  child: Text(
                                                    '${FilterCubit.get(context).searchData!.faciltydata!.hotelData![index].name}'
                                                        .toUpperCase(),
                                                    style: const TextStyle(fontSize: 16),
                                                    softWrap: true,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: mediaQuery.width / 1.8,
                                                  child: Text(
                                                    '${FilterCubit.get(context).searchData!.
                                                    faciltydata!.hotelData![index].address}'
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines:1,
                                                  ),
                                                ),
                                                const Spacer(),
                                                SizedBox(
                                                  width: mediaQuery.width / 1.6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        size: 18,
                                                        color: defaultColor,
                                                      ),
                                                      Text(
                                                        '2.0 Km to city',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption,
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        'EGP${FilterCubit.get(context).searchData!.faciltydata!.hotelData![index].price}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                        textAlign: TextAlign.right,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: mediaQuery.width / 1.6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Rating(
                                                        rate: double.parse(
                                                            FilterCubit.get(context).searchData!.faciltydata!.hotelData![index].rate!),
                                                        color: defaultColor,
                                                      ),
                                                      const Spacer(flex: 1),
                                                      Text(
                                                        '/per night',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                ),
                              ],
                            ),
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: FloatingActionButton.extended(
                onPressed: () async{
                  facilityList.clear();
                  // String e=priceSlider.end;
                  // print(e);
                  // print(int.parse(priceSlider.start));
                 //  debugPrint(
                 //   '${int.parse(priceSlider.start.toString())} Start price'
                 // );
                 // debugPrint(
                 //     '${priceSlider.end.toString()} End price'
                 // );
                 FilterCubit.get(context).facilitiesData!.data!.forEach((element) {
                   if(element.isChecked==true){
                     facilityList.add(element.id!);
                     print(element.id.toString());
                     // debugPrint(
                     //     '${element.name} Name'
                     // );
                   }
                 });
                  await  FilterCubit.get(context).getSearch(
                  facilityId:facilityList,
                   maxPrice: priceSlider.end.toString(),
                    minPrice: priceSlider.start.toString(),
                 );
                 // FilterCubit.get(context).getFacilities();

                  // Navigator.push(
                  //   context, MaterialPageRoute(
                  //     builder: (context) => const ExploreHomeScreen()),);
                },
                backgroundColor: defaultColor,
                label: const Text(
                    'Apply'
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
