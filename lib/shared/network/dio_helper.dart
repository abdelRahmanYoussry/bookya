import 'package:bookya/shared/Strings.dart';
import 'package:bookya/shared/network/base_response_model.dart';
import 'package:bookya/shared/network/url_api.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:dio/dio.dart';

class DioHelper {
  Dio dio =  Dio();
  dynamic post(bool isAuthorized, String service, dynamic model)async{
    if(isAuthorized){
      headers= {"token":SharedPref.getToken()};
    }
    try{
      Response response = await dio.post("$baseURL$service",data: FormData.fromMap(model),
          options: Options(
              headers: headers
          ));
      BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(response.data);
      if(baseResponseModel.status!.type == "0"){
        return baseResponseModel.status!.title!.en;
      }
      else {
        return response.data;
      }
    }catch(e){
      return e.toString();
    }
  }
  Map<String , dynamic> headers = {
      "token":""
  };
  dynamic get( bool isAuthorized,String service)async{
    if(isAuthorized){
      headers= {"token":SharedPref.getToken()};
    }
    try{
      Response response = await dio.get("$baseURL$service",
          options: Options(
        headers: headers
      ));
      BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(response.data);
      if(baseResponseModel.status!.type == "0"){
        return baseResponseModel.status!.title!.en;
      }
      else {
        return response.data;
      }
    }catch(e){
      return e.toString();
    }
  }
}
