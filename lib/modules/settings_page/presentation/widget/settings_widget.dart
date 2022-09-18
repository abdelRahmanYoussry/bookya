import 'package:bookya/modules/edit_account_page/presentation/page/edit_account_page.dart';
import 'package:bookya/shared/styles/icon_broken.dart';
import 'package:bookya/shared/widgets/main_button.dart';
import 'package:bookya/shared/widgets/settings_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsWidget extends StatelessWidget {
  final bool darkMode;
  const SettingsWidget({
    Key? key,
    this.darkMode = true,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/scenic-view-blur.png'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
              decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15,),
                bottomRight: Radius.circular(15,),
              ),
              color: HexColor('#2369a7'),
            ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        'assets/images/user (2).png',
                      ),
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Mostafa Gado',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Example@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      text: 'Edit account',
                      width: 200,
                      function: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccount(),),);
                      },
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   'Help and support',
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Row(
                  children: [
                    const Text(
                      'Dark mode',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                        value: darkMode,
                        onChanged: (value){
                          value = darkMode;
                          debugPrint(darkMode.toString());
                        },
                      thumbColor: Colors.teal,
                      activeColor: Colors.grey[400],
                    ),
                  ],
                ),
                SettingsItem(
                  function: (){},
                  icon: IconBroken.Location,
                  text: 'Relocate',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Help and support',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SettingsItem(
                  function: (){},
                  icon: IconBroken.Call,
                  text: 'Contact Us',
                ),
                SettingsItem(
                  function: (){},
                  icon: IconBroken.Star,
                  text: 'Rate the app',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Settings and legal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SettingsItem(
                  function: (){},
                  icon: IconBroken.Logout,
                  text: 'Sign Out',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
