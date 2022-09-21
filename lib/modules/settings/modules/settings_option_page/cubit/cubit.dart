import 'package:bookya/modules/settings/modules/settings_option_page/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Cubit<SettingsStates>{
  SettingsBloc() : super(SettingsInitialState());

  static SettingsBloc get(context) => BlocProvider.of(context);

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Light Mode", child: Text("Light Mode")),
      const DropdownMenuItem(value: "DarkMode", child:  Text("DarkMode")),
    ];
    return menuItems;
  }
}
