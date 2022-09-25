import 'package:bookya/modules/login/presentation/login_screen.dart';
import 'package:bookya/modules/register/data/register_request.dart';
import 'package:bookya/modules/register/domain/register_bloc.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/shared/colors.dart';
import 'package:bookya/shared/widgets/text_button.dart';
import 'package:bookya/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rxdart/subjects.dart';
import 'package:hexcolor/hexcolor.dart';


class RegisterPage extends StatefulWidget {
   const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc registerBloc = RegisterBloc();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  BehaviorSubject<Map<Icon,bool>> rxPassword = BehaviorSubject();
  BehaviorSubject<Map<Icon,bool>> rxConfirmPassword = BehaviorSubject();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _nameController.clear();
    _passwordController.clear();
    _emailController.clear();
    _confirmPasswordController.clear();
    rxPassword.close();
    rxConfirmPassword.close();
    super.dispose();
  }
  @override
  void initState() {
    Icon visibilityOff =  Icon(Icons.visibility_off_outlined,color: mainColor);
    rxPassword.sink.add({visibilityOff: true});
    rxConfirmPassword.sink.add({visibilityOff: true});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          bloc: registerBloc,
          listener: (context, snapshot) {
            if(snapshot is LoadingRegisterState){
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: LoadingAnimationWidget.stretchedDots(
                        color: defaultColor,
                        size: 50,
                      ),
                    );
            });
            }
            else if(snapshot is SuccessRegisterState){
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                return const LoginPage();
              }));
            }else if(snapshot is ErrorRegisterState){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error)));
            }
          },
          child: Stack(
            children:  [
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                color: defaultColor,
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
                          Text("Register" , style: TextStyle(color: Colors.white, fontSize: 36 , fontWeight: FontWeight.w400),),
                          SizedBox(height: 8,),
                          Text("Register Here" , style: TextStyle(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.normal),)
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
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(70), topLeft: Radius.circular(70)),
                      color: DarkModeBloc.get(context).isDark ? HexColor('#1a1a1a') : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .08,),
                        Container(
                          height: MediaQuery.of(context).size.height * .35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: DarkModeBloc.get(context).isDark
                                  ? HexColor('#1a1a1a')
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:DarkModeBloc.get(context).isDark
                                        ? Colors.grey.shade700
                                        : defaultColor.shade100,
                                    blurRadius: 9,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 5)
                                )
                              ]
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 16,),
                                Expanded(child: CustomTextFormField(_nameController, hint: "Name", hintStyle:  TextStyle(color: Colors.grey.shade500 , fontSize: 16),
                                    onValidator:(String? value){
                                      if(value!.length < 3) return "enter valid name";
                                      return null;
                                    }
                                ),),
                                Expanded(child: CustomTextFormField(_emailController,hint: "Email", hintStyle:  TextStyle(color: Colors.grey.shade500 , fontSize: 16),
                                    onValidator:(String? value){
                                      {
                                        if (!RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(value!)){
                                          return "Enter valid email";
                                        }
                                        return null;
                                      }                                })),
                                Expanded(child: StreamBuilder<Map<Icon,bool>>(
                                  stream: rxPassword.stream,
                                  builder: (context, snapshot) {
                                    return CustomTextFormField(_passwordController,hint: "Password",
                                        hintStyle:  TextStyle(color: Colors.grey.shade500 , fontSize: 16),
                                        obscureText: snapshot.data == null ? false : snapshot.data!.values.first,
                                        suffexIcon: snapshot.data == null ?
                                        const Icon(Icons.abc)
                                            :
                                        snapshot.data!.keys.first, onIconPress: (){
                                      if(snapshot.data!.values.first == false){
                                          rxPassword.sink.add({  Icon(Icons.visibility_off_rounded,color: mainColor):true});
                                      }else {
                                        rxPassword.sink.add({  Icon(Icons.visibility,color: mainColor):false});
                                        }
                                      },
                                        onValidator:(String? value){
                                          if(value!.length < 6) return "Enter valid password";
                                          return null;

                                        });
                                  }
                                )),
                                Expanded(child: StreamBuilder<Map<Icon,bool>>(
                                  stream: rxConfirmPassword.stream,
                                  builder: (context, snapshot) {
                                    return CustomTextFormField(_confirmPasswordController,hint: "Confirm Password", hintStyle:  TextStyle(color: Colors.grey.shade500 , fontSize: 16),
                                        obscureText: snapshot.data == null ? false : snapshot.data!.values.first,
                                        suffexIcon: snapshot.data == null ?
                                        const Icon(Icons.abc)
                                            :
                                        snapshot.data!.keys.first,onIconPress: (){
                                          if(snapshot.data!.values.first == false){
                                            rxConfirmPassword.sink.add({  Icon(Icons.visibility_off_rounded,color: mainColor,):true});
                                          }else {
                                            rxConfirmPassword.sink.add({  Icon(Icons.visibility,color: mainColor,):false});
                                          }
                                        },
                                        onValidator:(String? value){
                                          if(value!.length < 6) {
                                            return "Enter valid password";
                                          }else if ( value != _passwordController.text) {
                                            return "Confirm password does not match";
                                          }
                                          return null;
                                        });
                                  }
                                )),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * .04,),
                        CustomTextButton(context, "Register", onTap: ()async{
                          if(formKey.currentState!.validate()){
                            await registerBloc.registerUser(
                                RegisterRequestModel(_nameController.text, _emailController.text, _passwordController.text, _confirmPasswordController.text));
                          }
                        }
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * .04,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("I already have an account? " , style:  TextStyle(color: Colors.grey.shade500 ,fontSize: 16),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                                    return const LoginPage();
                                  }));
                                },
                                child: Text("Login here? " , style:   TextStyle(color: defaultColor ,fontSize: 16),)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
