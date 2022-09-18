import 'package:bookya/modules/edit_account_page/presentation/widget/edit_account_widget.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: const EditAccountWidget(),
    );
  }
}
