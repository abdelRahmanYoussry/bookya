import 'package:bookya/modules/settings/modules/edit_account_page/presentation/widget/edit_account_widget.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const EditAccountWidget(),
    );
  }
}
