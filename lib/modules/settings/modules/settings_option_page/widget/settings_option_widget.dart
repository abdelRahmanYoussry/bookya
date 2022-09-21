import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_states.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/settings_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsOptionWidget extends StatelessWidget {
  const SettingsOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DarkModeBloc, DarkModeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        DarkModeBloc cubit = DarkModeBloc.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
                    onChanged: (value){
                      cubit.changeAppMode();
                      debugPrint(value.toString());
                    },
                    thumbColor: defaultColor,
                    activeColor: Colors.white,
                    trackColor: HexColor('333739').withOpacity(0.6),
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
                function: () {},
                text: 'Color',
                icon: Icons.color_lens_rounded,
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
        );
      },
    );
  }
}
