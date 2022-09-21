import 'package:bookya/settings/modules/settings_option_page/widget/settings_option_widget.dart';
import 'package:flutter/material.dart';

class SettingsOptionPage extends StatelessWidget {
  const SettingsOptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const SettingsOptionWidget(),
      ),
    );
  }
}
