import 'package:chatbox/core/colored/print_colored_text_in_flutter.dart';
import 'package:chatbox/core/colored/print_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chatbox/core/utils/firebase_ref.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser() async {
    try {
      emit(LoginLoading());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // check the user
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Check if already signed up
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: firebaseUser.uid)
            .get();

        final List<DocumentSnapshot> documents = result.docs;
        if (documents.isEmpty) {
          await userRf.doc(firebaseUser.uid).set({
            'id': firebaseUser.uid,
            'userName': firebaseUser.displayName,
            'email': firebaseUser.email,
            'photoUrl': firebaseUser.photoURL,
          });
        }
        currentUser = firebaseUser;
        emit(LoginSuccess()); // Once signed in, return the UserCredential
      } else {
        emit(LoginFailure('Login failed firebaseUser is null'));
      }
    } catch (error) {
      printColoredText(error.toString(), ConsoleColor.white);
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> loginSuccess() async {
    try {
      await loginUser();
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
