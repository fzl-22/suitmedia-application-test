import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia_application_test/src/core/models/user.dart';

/// UserService Class
///
/// A class responsible for fetching user data from a remote API. It utilizes
/// the HTTP package for making network requests The fetched data is converted
/// into a list of [User] objects, representing user profiles.
class UserService {
  /// The base URL for the remote API.
  static const String _baseUrl = "https://reqres.in";

  /// Fetches user data from the remote API based on pagination parameters.
  ///
  /// This method makes an HTTP GET request to the API endpoint with the specified
  /// [page] and [perPage] parameters to retrieve user data. The fetched data is
  /// then processed and converted into a list of [User] objects.
  ///
  /// Parameters:
  /// - [page]: The page number of the data to be fetched.
  /// - [perPage]: The number of items per page to be fetched.
  ///
  /// Returns:
  /// - A Future containing a list of [User] objects representing user profiles.
  ///
  /// Throws:
  /// - If an error occurs during the HTTP request or data processing, it is rethrown.
  Future<List<User>> fetchData({
    required int page,
    required int perPage,
  }) async {
    final Uri url =
        Uri.parse("$_baseUrl/api/users?page=$page&per_page=$perPage");

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        return [];
      }

      final Map<String, dynamic> fetchedData = json.decode(response.body);

      final List<User> fetchedUserProfiles = (fetchedData['data'] as List)
          .map((userMap) => User.fromMap(userMap))
          .toList();

      return fetchedUserProfiles;
    } catch (error) {
      rethrow;
    }
  }
}
