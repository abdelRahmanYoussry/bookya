import 'package:bookya/modules/home/presentation/Pages/Tabs_screen.dart';
import 'package:bookya/modules/login/data/login_request_model.dart';
import 'package:bookya/modules/login/domain/login_bloc.dart';
import 'package:bookya/modules/register/presentation/register_screen.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:bookya/shared/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:bookya/shared/widgets/text_button.dart';
import 'package:bookya/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = LoginBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  BehaviorSubject<Map<Icon, bool>> rxPassword = BehaviorSubject();

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    rxPassword.close();
    loginBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    Icon visibilityOff =
        Icon(Icons.visibility_off_outlined, color: defaultColor);
    rxPassword.sink.add({visibilityOff: true});

    _emailController.text = SharedPref.getEmail() ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<LoginBloc, LoginState>(
          bloc: loginBloc,
          listener: (context, state) {
            if (state is LoadingLoginState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: LoadingAnimationWidget.stretchedDots(
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  });
            } else if (state is SuccessLoginState) {
              Navigator.pop(context);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllTabsScreen()));
            } else if (state is ErrorLoginState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                color: defaultColor,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )
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
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(70),
                          topLeft: Radius.circular(70)),
                      color: DarkModeBloc.get(context).isDark
                          ? HexColor('#1a1a1a')
                          : Colors.white,),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height * .18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: DarkModeBloc.get(context).isDark
                                  ? HexColor('#1a1a1a').withOpacity(0.9)
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: DarkModeBloc.get(context).isDark
                                        ? Colors.grey.shade700
                                        : defaultColor.shade100,
                                    blurRadius: 9,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Expanded(
                                    child: CustomTextFormField(
                                        _emailController,
                                        hint: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 16),
                                        onValidator: (String? value) {
                                  {
                                    if (!RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(value!)) {
                                      return "Enter valid email";
                                    }
                                    return null;
                                  }
                                })),
                                Expanded(
                                    child: StreamBuilder<Map<Icon, bool>>(
                                        stream: rxPassword.stream,
                                        builder: (context, snapshot) {
                                          return CustomTextFormField(
                                            _passwordController,
                                            hint: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 16),
                                            onValidator: (String? value) {
                                              if (value!.length < 6)
                                                return "Enter valid password";
                                              return null;
                                            },
                                            obscureText: snapshot.data == null
                                                ? false
                                                : snapshot.data!.values.first,
                                            suffexIcon: snapshot.data == null
                                                ? const Icon(Icons.abc)
                                                : snapshot.data!.keys.first,
                                            onIconPress: () {
                                              if (snapshot.data!.values.first ==
                                                  false) {
                                                rxPassword.sink.add({
                                                  Icon(
                                                    Icons
                                                        .visibility_off_rounded,
                                                    color: defaultColor,
                                                  ): true
                                                });
                                              } else {
                                                rxPassword.sink.add({
                                                  Icon(
                                                    Icons.visibility,
                                                    color: defaultColor,
                                                  ): false
                                                });
                                              }
                                            },
                                          );
                                        })),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        CustomTextButton(context, "Login", onTap: () {
                          if (_formKey.currentState!.validate()) {
                            loginBloc.login(LoginRequestModel(
                                _emailController.text,
                                _passwordController.text));
                          }
                        }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 16),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (c) {
                                    return const RegisterPage();
                                  }));
                                },
                                child: Text(
                                  "Register here? ",
                                  style: TextStyle(
                                      color: defaultColor, fontSize: 16),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
