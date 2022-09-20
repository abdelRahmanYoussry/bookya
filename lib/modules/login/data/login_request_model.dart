class LoginRequestModel {
  String email , password ;

  LoginRequestModel(this.email, this.password);
  toJson (){
    Map<String, String > loginRequest = {
      "email": email,
      "password": password,
    };
    return loginRequest;
  }
}