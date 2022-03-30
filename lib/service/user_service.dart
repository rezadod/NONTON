import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nonton_app/models/user_model.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future updateUser(UserModel user) async {
    String genres = '';
    for (var genre in user.selectedGenres) {
      genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    }
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': genres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserModel(
      id,
      snapshot.get('email'),
      balance: snapshot.get('balance'),
      profilePicture: snapshot.get('profilePicture'),
      selectedGenres: (snapshot.get('selectedGenres') as List)
          .map((e) => e.toString())
          .toList(),
      selectedLanguage: snapshot.get('selectedLanguage'),
      name: snapshot.get('name'),
    );
  }
}
