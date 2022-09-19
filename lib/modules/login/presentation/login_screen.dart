import 'package:bookya/modules/register/presentation/register_screen.dart';
import 'package:bookya/shared/colors.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:bookya/shared/widgets/text_button.dart';
import 'package:bookya/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _emailController.text = SharedPref.getEmail() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
          children:  [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              color: mainColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: MediaQuery.of(context).size.height * .12,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Login" , style: TextStyle(color: Colors.white, fontSize: 36 , fontWeight: FontWeight.w400),),
                        SizedBox(height: 8,),
                        Text("Welcome Back" , style: TextStyle(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.normal),)
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(70), topLeft: Radius.circular(70)),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .12,),
                      Container(
                        height: MediaQuery.of(context).size.height * .18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.shade100,
                              blurRadius: 9,
                              spreadRadius: 2,
                              offset: const Offset(0, 5)
                            )
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16,),
                            Expanded(child: CustomTextFormField(_emailController,hint: "Email", hintStyle:  TextStyle(color: Colors.grey.shade500 , fontSize: 16))),
                            Expanded(child: CustomTextFormField(_passwordController,hint: "Password", hintStyle:  TextStyle(color: Colors.grey.shade500 , fontSize: 16))),

                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .04,),
                      CustomTextButton(context, "Login", onTap: (){
                      }
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? " , style:  TextStyle(color: Colors.grey.shade500 ,fontSize: 16),),
                          GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                                  return const RegisterPage();
                                }));
                              },
                              child: const Text("Register here? " , style:   TextStyle(color: Colors.blueAccent ,fontSize: 16),)),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }
}
