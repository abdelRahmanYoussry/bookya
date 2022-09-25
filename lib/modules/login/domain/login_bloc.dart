import 'package:bookya/modules/login/data/login_api.dart';
import 'package:bookya/modules/login/data/login_request_model.dart';
import 'package:bookya/modules/login/data/login_response_model.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState>{
  LoginBloc(): super(EmptyLoginState());
  LoginApi loginApi = LoginApi();
  login(LoginRequestModel loginRequestModel)async{
    emit(LoadingLoginState());
    var result =await loginApi.login(loginRequestModel);
    if(result is String ){
      emit(ErrorLoginState(result));
    }else if(result is LoginResponseModel){
      await SharedPref.saveToken(result.data!.apiToken!);
      await SharedPref.saveEmail(result.data!.email!);
      await SharedPref.saveImage(result.data!.image!);
      await SharedPref.saveName(result.data!.name!);
      emit(SuccessLoginState());
    }
  }

}
class LoginState {}
class EmptyLoginState extends LoginState {}
class LoadingLoginState extends LoginState {}
class SuccessLoginState extends LoginState{}
class ErrorLoginState extends LoginState{
  String error ;
  ErrorLoginState(this.error);
}
