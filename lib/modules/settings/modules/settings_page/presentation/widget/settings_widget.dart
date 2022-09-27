import 'package:bookya/modules/settings/modules/edit_account_page/presentation/page/edit_account_page.dart';
import 'package:bookya/modules/settings/modules/settings_option_page/page/settings_option_page.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_states.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/settings_item.dart';
import 'package:bookya/shared/network/url_api.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatelessWidget {
  final bool darkMode;
  SettingsWidget({
    Key? key,
    this.darkMode = true,
  }) : super(key: key);
  BehaviorSubject<bool> rxReload = BehaviorSubject();
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<DarkModeBloc, DarkModeStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return StreamBuilder<bool>(
        stream: rxReload.stream,
        builder: (context, snapshot) {
          DarkModeBloc cubit = DarkModeBloc.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 10.0,
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccount(),),).then((value) {
                          if(value == true){
                            rxReload.sink.add(true);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  SharedPref.getName()??"Name",
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  'View and edit account',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    fontSize: 18.0,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundImage: getImage(),
                              backgroundColor: Colors.white,
                              radius: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Dark Theme',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: cubit.isDark,
                        onChanged: (value) {
                          cubit.changeAppMode();
                          debugPrint(value.toString());
                        },
                        thumbColor: defaultColor,
                        activeColor: Colors.white,
                        trackColor: HexColor('#1a1a1a').withOpacity(0.6),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MyDivider(),
                  ),
                  Row(
                    children: [
                      Text(
                        'Color',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: false,
                          borderRadius: BorderRadius.zero,
                          icon: Icon(
                            Icons.color_lens_rounded,
                            color: defaultColor,
                            size: 28.0,
                          ),
                          onChanged: (value) {
                            debugPrint(value.toString());
                            cubit.changeAppColor(value.toString());
                          },
                          items: [
                            DropdownMenuItem(
                              value: "Red",
                              child: Text(
                                'Red',
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Blue",
                              child: Text(
                                'Blue',
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Light blue",
                              child: Text(
                                'Light blue',
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Teal",
                              child: Text(
                                'Teal',
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MyDivider(),
                  ),
                  SettingsItem(
                    function: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.drag_handle,
                                size: 28,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    IconBroken.Call,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Mostafa Gado',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '0123456789',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: MyDivider(),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    IconBroken.Call,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Mostafa Gado',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '0123456789',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: MyDivider(),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    IconBroken.Call,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Mostafa Gado',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '0123456789',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: MyDivider(),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    IconBroken.Call,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Mostafa Gado',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '0123456789',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: MyDivider(),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    IconBroken.Call,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Mostafa Gado',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '0123456789',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: MyDivider(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    text: 'About us',
                    icon: IconBroken.Info_Circle,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MyDivider(),
                  ),
                  SettingsItem(
                    function: () {},
                    text: 'Sign out',
                    icon: IconBroken.Logout,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MyDivider(),
                  ),
                ],
              ),
            ),
          );
        }
    );
  },
);
  }

  ImageProvider getImage() {
    String? image =  SharedPref.getImage();
    if(image== null) {
      return const AssetImage('assets/images/user (2).png',);
    }
    else
    { return NetworkImage(imageUrl+SharedPref.getImage()!);
    }
  }
}
