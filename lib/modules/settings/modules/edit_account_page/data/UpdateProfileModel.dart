import 'dart:io';
import 'package:dio/dio.dart';

class UpdateProfileModel {
  String name , email ;
  MultipartFile? image ;

  UpdateProfileModel(this.name, this.email, {this.image});
  toJson(){
    Map<String, dynamic > jsonResult = {};

    jsonResult["image"] = image;
    jsonResult["name"] = name ;
    jsonResult["email"] = email ;
    return jsonResult;

  }
}