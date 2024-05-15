class UserModel{

  String firstName;
  String lastName;
  String email;
  String password;
  String phone;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic>mapData){
    return UserModel(
        firstName: mapData['fistName'],
        lastName: mapData['lastName'],
        email: mapData['email'],
        password: mapData['password'],
        phone: mapData['phone']
    );
  }

  Map<String, dynamic>toJson(){
    return {
      'fistName' : firstName,
      'lastName' : lastName,
      'email' : email,
      'phone' : phone,
      'password' : password,
    };
  }
}