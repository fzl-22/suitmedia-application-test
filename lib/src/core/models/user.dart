/// User Class
///
/// A class representing a user profile with attributes such as
/// [id], [email], [firstName], [lastName], and [avatar]. The class includes
/// a constructor for creating instances of User and a factory method,
/// [fromMap], for creating User instances from a map used for JSON data decoding.
class User {
  /// User constructor
  ///
  /// Creates a User instance with the specified [id], [email], [firstName],
  /// [lastName], and [avatar].
  ///
  /// Parameters:
  /// - [id]: The unique identifier for the user.
  /// - [email]: The email address associated with the user.
  /// - [firstName]: The first name of the user.
  /// - [lastName]: The last name of the user.
  /// - [avatar]: The URL of the user's avatar image.
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  /// Factory method to create a User instance from a map.
  ///
  /// This method is used for decoding JSON data into User objects.
  ///
  /// Parameters:
  /// - [map]: A map representing the user data.
  ///
  /// Returns:
  /// - A User instance created from the provided map.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
}
