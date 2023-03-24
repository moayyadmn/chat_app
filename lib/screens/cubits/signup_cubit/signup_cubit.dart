import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/screens/cubits/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signUpUser(
      {required String email, required String password}) async {
    emit(SignupLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailure(errMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailure(errMessage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(SignupFailure(errMessage: 'an error has occurred'));
    }
  }
}
