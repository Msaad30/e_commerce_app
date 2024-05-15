import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_appp/screens/signUpPage/blocs/signup_events.dart';
import 'package:e_commerce_appp/screens/signUpPage/blocs/signup_states.dart';
import 'package:e_commerce_appp/screens/signUpPage/model/signUpModel.dart';
import 'package:e_commerce_appp/screens/signUpPage/model/user_model.dart';
import 'package:e_commerce_appp/utils/urls.dart';
import 'package:http/http.dart' as http;

class SignUpBloc extends Bloc<SignUpEvents,SignUpState>{
  SignUpBloc() : super(InitialState());

  signUp(UserModel userModel)async{
    emit(LoadingState());

    final response = await http.post(Uri.parse(BaseUrls.signUpUrl),
      headers: {
        "Content-Type" : "application/json"
      },
      body: jsonEncode({
        "f_name":userModel.firstName,
        "l_name":userModel.lastName,
        "email":userModel.email,
        "phone":userModel.phone,
        "password":userModel.password
      })
    );
    if(response.statusCode == 200){
      Map<String,dynamic> mapData = jsonDecode(response.body);
      SignUpModel signUpModel = SignUpModel.fromJson(mapData);
      log(mapData.toString());
      emit(LoadedState(signUpModel: signUpModel));
    } else {

      Map<String,dynamic> mapData = jsonDecode(response.body);
      log(mapData["message"].toString());

      emit(ErrorState(errorMsg: mapData["message"].toString()));

    }
  }

}