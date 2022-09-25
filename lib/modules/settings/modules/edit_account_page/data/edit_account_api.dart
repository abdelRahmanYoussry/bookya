import 'package:bookya/modules/login/data/login_response_model.dart';
import 'package:bookya/modules/settings/modules/edit_account_page/data/UpdateProfileModel.dart';
import 'package:bookya/shared/network/dio_helper.dart';

class EditAccountApi {
  DioHelper dioHelper = DioHelper();
 dynamic getProfileInfo()async {
   var response = await dioHelper.get(true, "auth/profile-info");
   if (response is String ){
     return response;
   }else{
     return LoginResponseModel.fromJson(response);
   }
  }
  dynamic updateProfileInfo(UpdateProfileModel model)async {
    var response = await dioHelper.post(true, "auth/update-info",model.toJson());
    if (response is String ){
      return response;
    }else{
      return LoginResponseModel.fromJson(response);
    }
  }
}