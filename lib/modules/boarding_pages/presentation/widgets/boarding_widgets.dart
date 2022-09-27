import 'package:bookya/modules/boarding_pages/presentation/widgets/my_button.dart';
import 'package:bookya/modules/login/presentation/login_screen.dart';
import 'package:bookya/modules/register/presentation/register_screen.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


class BoardingWidget extends StatelessWidget {
  const BoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 75.0,
              ),
              Expanded(
                child: PageView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset('assets/part1.png'),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              'Plan your trips',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'book one of your unique hotel to \n            escape the ordinary',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: 0,
                            decorator: DotsDecorator(
                              activeColor: defaultColor,
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset('assets/part2.png'),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              'Find best deals',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Find deals for any season from cosy\n      country homes to city flats',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: 1,
                            decorator: DotsDecorator(
                              activeColor: defaultColor,
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset('assets/part3.png'),
                          const SizedBox(
                            height: 130,
                          ),
                          Center(
                            child: Text(
                              'Best travelling all time',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Find deals for any season from cosy\n      country homes to city flats',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: 2,
                            decorator: DotsDecorator(
                              activeColor: defaultColor,
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              MyButton(
                text: "Login",
                width: 300.0,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                borderRadius: 15,
              ),
              const SizedBox(
                height: 10.0,
              ),
              MyButton(
                text: "Create Account",
                width: 300.0,
                backGroundColor: Colors.grey[350],
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                borderRadius: 15,
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ));
  }
}
