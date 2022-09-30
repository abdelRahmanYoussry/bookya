
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/home/HomeCubit/home_state.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../styles/icon_broken.dart';

class ExploreItem extends StatelessWidget {
  int ?index;
   ExploreItem({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return InkWell(
      onTap: (){},
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
               ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0,),
                  topLeft: Radius.circular(15.0,),
                ),
                child: Image(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'http://api.mahmoudtaha.com/images/${HomeCubit.get(context).homeModel!.data!.data![index!].hotelImages![0].image}')
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
                          Expanded(
                            child: Text(
                              '${HomeCubit.get(context).homeModel!.data!.data![index!].name}'.split('-').first,
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,fontSize: 20
                              ),
                              maxLines: 1,overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'EGP ${HomeCubit.get(context).homeModel!.data!.data![index!].price}',
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
                          Expanded(
                            child: Text(
                              '${HomeCubit.get(context).homeModel!.data!.data![index!].address}',
                              style: Theme.of(context).textTheme.caption,maxLines: 1,overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          // Icon(
                          //   Icons.location_on,
                          //   color: defaultColor,
                          // ),
                          // Text(
                          //   '2 Km to...',
                          //   style: Theme.of(context).textTheme.caption,
                          // ),
                          // const Spacer(),
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
              radius: 20.0,
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    IconBroken.Heart,
                    size: 26,
                    color: defaultColor,
                  )),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
