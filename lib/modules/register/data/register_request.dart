class RegisterRequestModel{
  String name , email , password , confirmPassword ;

  RegisterRequestModel(
      this.name, this.email, this.password, this.confirmPassword);

  Map<String , dynamic > toJson(){
    Map<String , dynamic > jsonRequest = {};
    jsonRequest["name"] = name;
    jsonRequest["email"] = email;
    jsonRequest["password"] = password;
    jsonRequest["password_confirmation"] = confirmPassword;
    return jsonRequest;
  }
}