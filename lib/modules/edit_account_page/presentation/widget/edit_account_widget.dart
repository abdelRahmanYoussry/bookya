
import 'package:bookya/shared/styles/icon_broken.dart';
import 'package:bookya/shared/widgets/divider.dart';
import 'package:bookya/shared/widgets/edit_profile_item.dart';
import 'package:bookya/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';

class EditAccountWidget extends StatelessWidget {
  const EditAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit profile',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children:  [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 5.0,
                        right: 5.0,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/images/user (2).png',
                        ),
                        radius: 60,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.teal[200],
                      radius: 20.0,
                      child: IconButton(
                          onPressed: (){},
                          icon: const Icon(
                        IconBroken.Camera,
                            color: Colors.white,
                      )),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const EditProfileItem(
              text: 'Username',
              hintText: 'Username',
              keyBoard: TextInputType.text,
            ),
            const MyDivider(),
            const EditProfileItem(
              text: 'Email',
              hintText: 'Email',
              keyBoard: TextInputType.emailAddress,
            ),
            const MyDivider(),
            const EditProfileItem(
              text: 'Phone',
              hintText: 'Phone',
              keyBoard: TextInputType.phone,
            ),
            const MyDivider(),
            const EditProfileItem(
              text: 'Password',
              hintText: 'Password',
              keyBoard: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const MyDivider(),
            const SizedBox(
              height: 15.0,
            ),
            MainButton(
              text: 'Submit',
              function: (){},
            ),

          ],
        ),
      ),
    );
  }
}
