import 'package:bookya/home/HomeCubit/home_cubit.dart';
import 'package:bookya/home/HomeCubit/home_state.dart';
import 'package:bookya/pages/home_screen.dart';
import 'package:bookya/pages/mybooking_screen.dart';
import 'package:bookya/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AllTabsScreen extends StatelessWidget {
  const AllTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var cubit=HomeCubit.get(context);
    List<BottomNavigationBarItem> bottomNavBarList =const [
       BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: 'Explore',
      ),
       BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: 'Trips'),
       BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile'),
    ];
    List<Widget> tapsScreens = const [
      HomeScreen(),
      MyBookingScreen(),
       ProfileScreen(),
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            // extendBody: true,
            // extendBodyBehindAppBar: true,
            // backgroundColor: Colors.white,
            // appBar: AppBar(
            //   // elevation: 0.5,
            //   systemOverlayStyle: SystemUiOverlayStyle(
            //       statusBarColor: Theme.of(context).primaryColor,
            //     statusBarIconBrightness: Brightness.light,
            //   ),
            //   // backgroundColor: Theme.of(context).backgroundColor,
            //   title: Row(
            //     children: [
            //       Text(
            //         'Bookya',
            //         style: TextStyle(
            //             color: Theme.of(context).textTheme.subtitle1!.color),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.settings,
            //             size: 27,
            //             color: Theme.of(context).primaryColor,
            //           ))
            //     ],
            //   ),
            // ),
            body: tapsScreens[cubit.currentIndex],
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.0800,
                    decoration:  BoxDecoration(
                      color:Theme.of(context).backgroundColor,
                      borderRadius:  const BorderRadius.all(Radius.circular(20)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 0,
                            blurRadius: 10),
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: BottomNavigationBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        type: BottomNavigationBarType.fixed,
                        selectedLabelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        items: bottomNavBarList,
                        currentIndex: cubit.currentIndex,
                        selectedIconTheme: const IconThemeData(color: Colors.white,size: 30),
                        selectedItemColor: Theme.of(context).backgroundColor,
                        onTap: (index) {
                          cubit.changeNavBar(index);
                        },
                      ),
                    )))
        );
      },
    );
  }
}
