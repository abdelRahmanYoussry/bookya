import 'package:bookya/modules/login/data/login_api.dart';
import 'package:bookya/modules/login/data/login_request_model.dart';
import 'package:bookya/modules/login/data/login_response_model.dart';
import 'package:bookya/modules/settings/modules/edit_account_page/data/UpdateProfileModel.dart';
import 'package:bookya/modules/settings/modules/edit_account_page/data/edit_account_api.dart';
import 'package:bookya/modules/settings/modules/edit_account_page/presentation/widget/edit_account_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProfileBloc extends Cubit<GetProfileState>{
  GetProfileBloc(): super(EmptyGetProfileState());
  EditAccountApi editAccountApi = EditAccountApi();

  getProfileInfo()async{
    emit(LoadingGetProfileState());
    var result =await editAccountApi.getProfileInfo();
    if(result is String ){
      emit(ErrorGetProfileState(result));
    }else if(result is LoginResponseModel){
      emit(SuccessGetProfileState(result));
    }
  }

}
class EditProfileBloc extends Cubit<EditProfileState>{
  EditProfileBloc(): super(EmptyEditProfileState());
  EditAccountApi editAccountApi = EditAccountApi();
  updateProfileInfo(UpdateProfileModel model)async{
    emit(LoadingEditProfileState());
    var result =await editAccountApi.updateProfileInfo(model);
    if(result is String ){
      emit(ErrorEditProfileState(result));
    }else if(result is LoginResponseModel){
      emit(SuccessEditProfileState(result));
    }
  }


}

class GetProfileState {}
class EmptyGetProfileState extends GetProfileState {}
class LoadingGetProfileState extends GetProfileState {}
class SuccessGetProfileState extends GetProfileState{
  LoginResponseModel model ;

  SuccessGetProfileState(this.model);
}
class ErrorGetProfileState extends GetProfileState{
  String error ;
  ErrorGetProfileState(this.error);
}



class EditProfileState {}
class EmptyEditProfileState extends EditProfileState {}
class LoadingEditProfileState extends EditProfileState {}
class SuccessEditProfileState extends EditProfileState{
  LoginResponseModel model ;

  SuccessEditProfileState(this.model);
}
class ErrorEditProfileState extends EditProfileState{
  String error ;
  ErrorEditProfileState(this.error);
}
