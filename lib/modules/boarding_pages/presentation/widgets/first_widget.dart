import 'package:bookya/modules/boarding_pages/presentation/widgets/boarding_widgets.dart';
import 'package:bookya/modules/boarding_pages/presentation/widgets/my_button.dart';
import 'package:bookya/modules/register/presentation/register_screen.dart';

import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/back.jpg"),
                fit: BoxFit.cover,
              )
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                alignment: Alignment.center,
                child: Column(
                  children:  [
                    const SizedBox(height: 120,),
                    Image.asset('assets/icon.png'),
                    const SizedBox(height: 15,),
                    const Text(
                      "Bookya",
                      style: TextStyle(
                      fontSize: 25,
                      fontWeight:FontWeight.bold,
                      color: Colors.white
                    ),),
                    const SizedBox(height: 5,),
                    const Text(
                      "Best hotel deals for your holiday",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                    const SizedBox(height: 400,),
                    MyButton(text: "Get Started", height: 50.0, width: 300.0, onPress: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BoardingWidget()));
                    },borderRadius: 15,),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterPage()),
                              );
                            },

                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ) )
                      ],
                    )





                  ],
                ),
              )
          )
      );


  }
}
