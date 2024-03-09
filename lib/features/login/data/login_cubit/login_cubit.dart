import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scholarchat_app/core/services/app_services.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final AppServices _appServices = Get.find();

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
  
    
      }
      // Once signed in, return the UserCredential
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> loginSuccess() async {
    try {
      await loginUser();
      _appServices.sharedPreferences.setString('step', '1');
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
