import 'package:bookya/modules/register/data/register_api.dart';
import 'package:bookya/modules/register/data/register_request.dart';
import 'package:bookya/modules/register/data/register_response_model.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Cubit<RegisterState>{
  RegisterBloc(): super(EmptyRegisterState());
  RegisterApi registerApi = RegisterApi();
  registerUser (RegisterRequestModel model)async {
    emit(LoadingRegisterState());
  dynamic result = await registerApi.registerUser(model);
  if(result is String ){
    emit(ErrorRegisterState(result.toString()));
    print(result.toString());
  }else if (result is RegisterResponseModel){
    await SharedPref.saveToken(result.data!.apiToken!);
    await SharedPref.saveEmail(result.data!.email!);
    emit(SuccessRegisterState());
  }
  }

}
class RegisterState {
}
class EmptyRegisterState extends RegisterState{}
class LoadingRegisterState extends RegisterState{}
class SuccessRegisterState extends RegisterState{}
class ErrorRegisterState extends RegisterState{
  String error;
  ErrorRegisterState(this.error);
}
