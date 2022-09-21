import 'package:bookya/modules/settings/modules/settings_page/presentation/widget/settings_widget.dart';
import 'package:flutter/material.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SettingsWidget(),
      ),
    );
  }
}
