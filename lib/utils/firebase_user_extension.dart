import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:nonton_app/models/user_model.dart';
import 'package:nonton_app/service/user_service.dart';

extension FirebaseUserExtension on auth.User {
  UserModel convertToUser({
    String name = 'No Name',
    List<String> selectedGenres = const [],
    String selectedLanguage = 'English',
    int balance = 50000,
  }) =>
      UserModel(
        uid,
        email.toString(),
        balance: balance,
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
        profilePicture: '',
      );
  Future<UserModel> fromFireStore() async => UserServices.getUser(uid);
  // Future<UserModel> fromFireStore() async =>
  //     await UserServices.getUser(this.uid);
}
