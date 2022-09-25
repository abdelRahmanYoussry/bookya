import 'package:bookya/modules/settings/modules/edit_account_page/presentation/page/edit_account_page.dart';
import 'package:bookya/modules/settings/modules/settings_option_page/page/settings_option_page.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/settings_item.dart';
import 'package:bookya/shared/network/url_api.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class SettingsWidget extends StatelessWidget {
  final bool darkMode;
  SettingsWidget({
    Key? key,
    this.darkMode = true,
  }) : super(key: key);
  BehaviorSubject<bool> rxReload = BehaviorSubject();
  @override

  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: rxReload.stream,
        builder: (context, snapshot) {
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
                  SettingsItem(
                    function: (){},
                    text: 'Change password',
                    icon: IconBroken.Lock,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MyDivider(),
                  ),
                  SettingsItem(
                    function: (){},
                    text: 'Help Center',
                    icon: IconBroken.Info_Circle,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MyDivider(),
                  ),
                  SettingsItem(
                    function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsOptionPage(),),);
                    },
                    text: 'Settings',
                    icon: IconBroken.Setting,
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
