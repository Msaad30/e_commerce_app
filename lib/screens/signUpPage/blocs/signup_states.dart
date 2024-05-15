import 'package:e_commerce_appp/screens/signUpPage/model/signUpModel.dart';

abstract class SignUpState{}
class InitialState extends SignUpState{}
class LoadingState extends SignUpState{}
class LoadedState extends SignUpState{
  SignUpModel signUpModel;
  LoadedState({required this.signUpModel});
}
class ErrorState extends SignUpState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}