class LoginRequest{
  final String email;
  final String password;
  LoginRequest({required this.email,required this.password});

  Map<String,dynamic>toJson(){
    Map<String,dynamic> map={};
    map["email"]=email;



    map["password"]=password;
    return map;
  }
}