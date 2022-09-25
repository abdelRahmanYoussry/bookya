import 'dart:io';

import 'package:bookya/modules/settings/modules/edit_account_page/data/UpdateProfileModel.dart';
import 'package:bookya/modules/settings/modules/edit_account_page/domain/edit_profile_bloc.dart';
import 'package:bookya/modules/settings/shared/styles/icon_broken.dart';
import 'package:bookya/modules/settings/shared/widgets/divider.dart';
import 'package:bookya/modules/settings/shared/widgets/edit_profile_item.dart';
import 'package:bookya/modules/settings/shared/widgets/main_button.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditAccountWidget extends StatefulWidget {
  const EditAccountWidget({Key? key}) : super(key: key);

  @override
  State<EditAccountWidget> createState() => EditAccountWidgetState();
}

class EditAccountWidgetState extends State<EditAccountWidget> {
  String? photo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GetProfileBloc bloc = GetProfileBloc();
  EditProfileBloc editProfileBloc = EditProfileBloc();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    bloc.getProfileInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,rxSelected.hasValue ? rxSelected.value : false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(leading: GestureDetector(
            onTap: (){
              Navigator.pop(context,rxSelected.hasValue ? rxSelected.value : false);
            },
            child: const Icon(Icons.arrow_back , color: Colors.white,)),),
        body: SingleChildScrollView(
          child: BlocListener<EditProfileBloc ,EditProfileState>(
            bloc: editProfileBloc,
            listener: (context, myState) {
               if (myState is LoadingEditProfileState){
                 showLoading();
               }else if (myState is SuccessEditProfileState){
                 SharedPref.saveName(nameController.text);
                 SharedPref.saveImage(myState.model.data!.image!);
                 Navigator.pop(context);
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("updated Successfully")));
                bloc.getProfileInfo();
               }else if (myState is ErrorEditProfileState){
                 Navigator.pop(context);
                 ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(myState.error)));
               }
            },
            child: BlocBuilder<GetProfileBloc , GetProfileState>(
                bloc: bloc,
                builder: (context, state) {
                  if(state is LoadingGetProfileState){
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: const Center(child:  CircularProgressIndicator()));
                  }
                  if(state is SuccessGetProfileState)
                  {
                    nameController.text = state.model.data!.name!;
                    emailController.text = state.model.data!.email!;
                    photo = state.model.data!.image;
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit profile',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                fontSize: 28,
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
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 5.0,
                                        right: 5.0,
                                      ),
                                      child: StreamBuilder<XFile>(
                                        stream: rxImageSelected.stream,
                                        builder: (context, snapshot) {
                                          return CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: getImage(),
                                            radius: 60,
                                          );
                                        }
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final ImagePicker _picker = ImagePicker();
                                        // Pick an image
                                        final XFile? image = await _picker.pickImage(
                                            source: ImageSource.gallery);
                                        if(image != null){
                                          rxSelected.sink.add(true);
                                          rxImageSelected.sink.add(image);
                                        }
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.teal[200],
                                        radius: 20.0,
                                        child: IconButton(
                                            onPressed: () async{
                                              final ImagePicker _picker = ImagePicker();
                                              // Pick an image
                                              final XFile? image = await _picker.pickImage(
                                                  source: ImageSource.gallery);
                                              if(image != null){
                                                rxSelected.sink.add(true);
                                                rxImageSelected.sink.add(image);

                                              }
                                            },
                                            icon: const Icon(
                                              IconBroken.Camera,
                                              color: Colors.white,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            EditProfileItem(
                              controller: nameController,
                              onValidator:(String? value){
                                if(value!.length < 3) return "enter valid name";
                                return null;
                              },
                              text: 'Username',
                              hintText: 'Username',
                              keyBoard: TextInputType.text,
                            ),
                            const MyDivider(),
                            EditProfileItem(
                              onValidator:(String? value){
                                {
                                  if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value!)){
                                    return "Enter valid email";
                                  }
                                  return null;
                                }                                },
                              controller: emailController,
                              text: 'Email',
                              hintText: 'Email',
                              keyBoard: TextInputType.emailAddress,
                            ),
                            const MyDivider(),
                            const SizedBox(
                              height: 15.0,
                            ),
                            MainButton(
                              text: 'Submit',
                              function: () async{
                                if(_formKey.currentState!.validate()){
                                  if(rxImageSelected.hasValue) {
                                    File file = File(rxImageSelected.value.path);
                                    editProfileBloc.updateProfileInfo(UpdateProfileModel(nameController.text, emailController.text,image: await MultipartFile.fromFile(file.path)));
                                  }else{
                                    editProfileBloc.updateProfileInfo(UpdateProfileModel(nameController.text, emailController.text));
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  else{
                    return const Center(child:  Text("We can not get your information now , Try Later "));
                  }
                }
            ),
          ),
        ),
      ),
    );
  }

BehaviorSubject <XFile > rxImageSelected = BehaviorSubject();
BehaviorSubject <bool > rxSelected = BehaviorSubject();
  ImageProvider getImage() {

   if(!rxSelected.hasValue || !rxSelected.value){
    if (photo == null) {
      return const AssetImage(
        'assets/images/user (2).png',);
    } else {
      return NetworkImage(photo!);
    }
  }else {
     File file = File(rxImageSelected.value.path);
     return FileImage(file);
   }
  }
  showLoading (){
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
  }
}
