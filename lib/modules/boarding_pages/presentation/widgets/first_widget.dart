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
                    Text(
                      "Bookya",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Best hotel deals for your holiday",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 400,),
                    MyButton(text: "Get Started", height: 50.0, width: 300.0, onPress: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BoardingWidget()));
                    },borderRadius: 15,),
                    const SizedBox(height: 15,),

                  ],
                ),
              )
          )
      );


  }
}
