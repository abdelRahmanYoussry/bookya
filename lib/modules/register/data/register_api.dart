import 'package:bookya/modules/register/data/register_request.dart';
import 'package:bookya/modules/register/data/register_response_model.dart';
import 'package:bookya/shared/network/dio_helper.dart';

class RegisterApi {
  DioHelper dioHelper = DioHelper();
 dynamic registerUser (RegisterRequestModel model)async{
    try{
   var response = await dioHelper.post(false, "auth/register", model.toJson());
    if(response is String){
      return response;
    }
     RegisterResponseModel registerResponseModel = RegisterResponseModel.fromJsonForData(response);
     return registerResponseModel;
    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }
}