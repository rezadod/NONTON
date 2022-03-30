import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  const UserModel(
    this.id,
    this.email, {
    required this.balance,
    required this.name,
    required this.selectedGenres,
    required this.selectedLanguage,
    required this.profilePicture,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "[$id]-$name,$email";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        balance,
        selectedLanguage
      ];
}
