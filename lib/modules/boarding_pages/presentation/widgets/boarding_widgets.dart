import 'package:bookya/modules/boarding_pages/presentation/widgets/my_button.dart';
import 'package:bookya/modules/login/presentation/login_screen.dart';
import 'package:bookya/modules/register/presentation/register_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';





class BoardingWidget extends StatelessWidget {
  const BoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,

        ),
        body: PageView(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Image.asset('assets/part1.png'),
                  const SizedBox(height: 50,),
                  const Center(
                    child: Text(
                      'Plan your trips',
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'book one of your unique hotel to \n            escape the ordinary',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  DotsIndicator(
                    dotsCount: 3,
                    position: 0,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MyButton(text: "Login", height: 50.0, width: 300.0, onPress: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  },borderRadius: 15,),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MyButton(text: "Create Account", textColor: Colors.black,height: 50.0, width: 300.0, backGroundColor: Colors.white,onPress: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()));
                  },borderRadius: 15,),

                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Image.asset('assets/part2.png'),
                  const SizedBox(height: 50,),
                  const Center(
                    child: Text(
                      'Find best deals',
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Find deals for any season from cosy\n      country homes to city flats',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  DotsIndicator(
                    dotsCount: 3,
                    position: 1,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MyButton(text: "Login", height: 50.0, width: 300.0, onPress: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  },borderRadius: 15,),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MyButton(text: "Create Account", textColor: Colors.black,height: 50.0, width: 300.0, backGroundColor: Colors.white,onPress: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()));
                  },borderRadius: 15,),

                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Image.asset('assets/part3.png'),
                  const SizedBox(height: 130,),
                  const Center(
                    child: Text(
                      'Best travelling all time',
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Find deals for any season from cosy\n      country homes to city flats',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  DotsIndicator(
                    dotsCount: 3,
                    position: 2,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  MyButton(text: "Login", height: 50.0, width: 300.0, onPress: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  },borderRadius: 15,),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MyButton(text: "Create Account", textColor: Colors.black,height: 50.0, width: 300.0, backGroundColor: Colors.white,onPress: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()));
                  },borderRadius: 15,),

                ],
              ),
            ),

          ],
        )



    );
  }
}
