import 'package:bookya/modules/login/data/login_request_model.dart';
import 'package:bookya/modules/login/data/login_response_model.dart';
import 'package:bookya/shared/network/dio_helper.dart';

class LoginApi {
  DioHelper dioHelper = DioHelper();
  dynamic login(LoginRequestModel model )async{
    var response = await dioHelper.post(false, "auth/login", model.toJson());
    if(response is String ){
      return response;
    }
    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response);
    return loginResponseModel;

  }
}