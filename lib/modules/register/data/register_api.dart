import 'package:bookya/modules/register/data/register_request.dart';
import 'package:bookya/modules/register/data/register_response_model.dart';
import 'package:bookya/shared/Strings.dart';
import 'package:dio/dio.dart';

class RegisterApi {
  Dio dio = Dio();
 dynamic registerUser (RegisterRequestModel model)async{
    try{
     Response response = await dio.post("$baseURL/auth/register",data: FormData.fromMap(model.toJson()));
     RegisterResponseModel registerResponseModel = RegisterResponseModel.fromJsonForStatus(response.data);
     if(registerResponseModel.status!.type == "1"){
       registerResponseModel.fromJsonForData(response.data);
       return registerResponseModel;
     }else {
        return registerResponseModel.status!.title!.en;
     }
    }catch(e){
      return e.toString();
    }
  }
}