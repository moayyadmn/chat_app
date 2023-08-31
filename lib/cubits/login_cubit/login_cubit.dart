import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  
  Future<User?> loginUser() async {
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
    User? firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    if (firebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .get();

      final List<DocumentSnapshot> documents = result.docs;
      if (documents.isEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .set({
              'id': firebaseUser.uid,
              'userName': firebaseUser.displayName,
              'email': firebaseUser.email,
              'photoUrl' : firebaseUser.photoURL,
            });
      }
    }
    // Once signed in, return the UserCredential
    return firebaseUser;
  }

  Future loginSuccess() async {
    await loginUser();
    emit(LoginSuccess());
  }
}



