import 'package:firebase_auth/firebase_auth.dart';
import 'package:nonton_app/models/user_model.dart';
import 'package:nonton_app/service/user_service.dart';
import 'package:nonton_app/utils/firebase_user_extension.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel user = result.user!.convertToUser(
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = await result.user!.fromFireStore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }
}

class SignInSignUpResult {
  final UserModel? user;
  final String message;

  SignInSignUpResult({this.message = '', this.user});
}
