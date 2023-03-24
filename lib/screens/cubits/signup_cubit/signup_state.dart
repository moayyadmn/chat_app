abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {}
class SignupFailure extends SignupState {
    String errMessage;
  SignupFailure({required this.errMessage});
}
