abstract class SignUpEvents{}
class SignUpUserEventes extends SignUpEvents{
  String firstName, lastName, email, password, phone;

  SignUpUserEventes({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });

}